local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

npairs.setup({
    pairs_map = {
        ["'"] = "'",
        ['"'] = '"',
        ["("] = ")",
        ["["] = "]",
        ["{"] = "}",
        ["`"] = "`",
    },
    disable_filetype = { "TelescopePrompt", "vim" },
    break_line_filetype = nil,
    check_line_pair = true,
    html_break_line_filetype = { "html", "vue", "typescriptreact", "svelte", "javascriptreact" },
    ignored_next_char = "%w",
    check_ts = true,
})

-- Rule
-- ==========
-- add space paranthess
npairs.add_rules({
    Rule(" ", " ")
        :with_pair(function (opts)
            local pair = opts.line:sub(opts.col, opts.col + 1)
            return vim.tbl_contains({ "()", "[]", "{}" }, pair)
        end)
})

