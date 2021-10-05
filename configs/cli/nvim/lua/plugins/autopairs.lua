local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local remap = vim.api.nvim_set_keymap

npairs.setup({
    pairs_map = {
        ["'"] = "'",
        ['"'] = '"',
        ["("] = ")",
        ["["] = "]",
        ["{"] = "}",
        ["`"] = "`",
    },
    ignored_next_char = string.gsub([[ [%w%%%'%[%"%.%#%$%(%)] ]], "%s+", ""),
    map_bs = false,
    check_line_pair = true,
    check_ts = true,
    enable_moveright = true,
    enable_afterquote = true,
    enable_check_bracket_line = true,
    html_break_line_filetype = { "html", "vue", "typescriptreact", "svelte", "javascriptreact" },
    disable_filetype = { "TelescopePrompt", "vim" },
    fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        end_key = "e",
        keys = "qwasdf",
        check_comma = true,
        hightlight = "Search",
    },
})

-- Rule
-- ==========
-- Endwise
-- npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))

-- add space paranthess
npairs.add_rules({
    Rule(" ", " "):with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({ "()", "[]", "{}" }, pair)
    end),
    Rule("( ", " )")
        :with_pair(function()
            return false
        end)
        :with_move(function(opts)
            return opts.prev_char:match(".%)") ~= nil
        end)
        :use_key(")"),
    Rule("{ ", " }")
        :with_pair(function()
            return false
        end)
        :with_move(function(opts)
            return opts.prev_char:match(".%}") ~= nil
        end)
        :use_key("}"),
    Rule("[ ", " ]")
        :with_pair(function()
            return false
        end)
        :with_move(function(opts)
            return opts.prev_char:match(".%]") ~= nil
        end)
        :use_key("]"),
})

if pcall(require, "cmp") then
    require("nvim-autopairs.completion.cmp").setup({
        map_cr = true, --  map <CR> on insert mode
        map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
        auto_select = false, -- automatically select the first item
        insert = false, -- use insert confirm behavior instead of replace
        map_char = { -- modifies the function or method delimiter by filetypes
            all = "(",
            tex = "{",
        },
    })
    remap("i", "<BS>", "v:lua.Util.backspace()", { expr = true, noremap = true })
else
    remap("i", "<CR>", "v:lua.Util.trigger_completion()", { expr = true, noremap = true })
    remap("i", "<BS>", "v:lua.Util.backspace()", { expr = true, noremap = true })
end
