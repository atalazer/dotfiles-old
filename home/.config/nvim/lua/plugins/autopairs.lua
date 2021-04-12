vim.cmd[[packadd nvim-autopairs]]

local npairs = require('nvim-autopairs')

npairs.setup{
    check_line_pair = false,
    break_line_filetype = nil, -- enable this rule for all filetypes
    pairs_map = {
        ["'"] = "'",
        ['"'] = '"',
        ['`'] = '`',
        ['('] = ')',
        ['['] = ']',
        ['{'] = '}',
        -- ['<'] = '>',
    },

    disable_filetype = {
        "TelescopePrompt"
    },

    html_break_line_filetype = {
        'html',
    },
    ignored_next_char = "[%w%.%+%-%=%/%,\"'{%[]".."%#%$"
}

local remap = vim.api.nvim_set_keymap
_G.MUtils= {}

vim.g.completion_confirm_key = ""
MUtils.completion_confirm=function()
    if vim.fn.pumvisible() ~= 0  then
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

remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})

