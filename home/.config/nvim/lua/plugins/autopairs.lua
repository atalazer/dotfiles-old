vim.cmd([[packadd nvim-autopairs]])

local npairs = require("nvim-autopairs")
local Rule = require('nvim-autopairs.rule')

npairs.setup({
    pairs_map = {
        ["'"] = "'",
        ["\""] = "\"",
        ["`"] = "`",
        ["("] = ")",
        ["["] = "]",
        ["{"] = "}",
        -- ['<'] = '>',
    },
    ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]],"%s+", ""),
    enable_moveright = true,

    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
    },
})

-- ===== Rules =====
-- Treesitter Rules
local ts_conds = require('nvim-autopairs.ts-conds')
npairs.add_rules({
  Rule("%", "%", "lua")
    :with_pair(ts_conds.is_ts_node({'string','comment'})),
  Rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'}))
})

-- Endwise Rules
local endwise = require('nvim-autopairs.ts-rule').endwise
npairs.add_rules({
    endwise('then$', 'end', 'lua', 'if_statement')
})

-- ===== Mappings =====
local remap = vim.api.nvim_set_keymap
_G.MUtils = {}

vim.g.completion_confirm_key = ""
MUtils.completion_confirm = function()
    if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            vim.fn["compe#confirm"]()
            return npairs.esc("<c-y>")
        else
            vim.defer_fn(function()
                vim.fn["compe#confirm"]("<cr>")
            end, 20)
            return npairs.esc("<c-n>")
        end
    else
        return npairs.check_break_line_char()
    end
end

remap(
    "i",
    "<CR>",
    "v:lua.MUtils.completion_confirm()",
    { expr = true, noremap = true }
)
