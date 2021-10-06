local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local remap = vim.api.nvim_set_keymap

npairs.setup({
    pairs_map = {
        ["'"] = "'",
        ['"'] = '"',
        ["`"] = "`",
        ["("] = ")",
        ["["] = "]",
        ["{"] = "}",
    },
    ignored_next_char = [[ [%w%.%,%'%"%#%$%%] ]],
    map_bs = false,
    check_line_pair = true,
    check_ts = true,
    enable_moveright = true,
    enable_afterquote = true,
    enable_check_bracket_line = false,
    html_break_line_filetype = { "html", "vue", "typescriptreact", "svelte", "javascriptreact" },
    disable_filetype = { "TelescopePrompt", "vim" },
    fast_wrap = {
        map = "<A-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        end_key = "q",
        keys = "wasdfhjkl",
        check_comma = true,
        hightlight = "Search",
    },
})

-- Rule
-- ------------------
-- Endwise
-- npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))

-- add space paranthess
npairs.add_rules({
    Rule(" ", " "):with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        if vim.bo.filetype == "markdown" then
            return vim.tbl_contains({ "()", "{}" }, pair)
        end
        return vim.tbl_contains({ "()", "[]", "{}" }, pair)
    end),
})

-- Mappings
-- ------------------
if pcall(require, "cmp") then
    require("nvim-autopairs.completion.cmp").setup({
        map_cr = true, --  map <CR> on insert mode
        map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
        auto_select = false, -- automatically select the first item
        insert = true, -- use insert confirm behavior instead of replace
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
