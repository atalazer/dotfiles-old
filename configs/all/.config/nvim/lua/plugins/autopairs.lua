local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

npairs.setup({
    check_line_pair = true,
    check_ts = true,
    disable_filetype = { "TelescopePrompt", "vim" },
    enable_afterquote = true,
    enable_check_bracket_line = true,
    enable_moveright = true,
    html_break_line_filetype = { "html", "vue", "typescriptreact", "svelte", "javascriptreact" },
    ignored_next_char = string.gsub([[ [%w%.%,%'%"%#%$%%] ]], "%s+", ""),
    map_bs = false,
    fast_wrap = {
        map = "<A-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        end_key = "q",
        keys = "wasdfhjkl",
        check_comma = true,
        hightlight = "Search",
    },
    pairs_map = {
        ["'"] = "'",
        ['"'] = '"',
        ["`"] = "`",
        ["("] = ")",
        ["["] = "]",
        ["{"] = "}",
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

