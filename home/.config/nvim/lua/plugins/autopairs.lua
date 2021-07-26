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
    fast_wrap = {},
    ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
    check_line_pair = true,
    check_ts = true,
    ts_config = {
        lua = { "string" }, -- it will not add pair on that treesitter node
    },
    break_line_filetype = nil,
    html_break_line_filetype = { "html", "vue", "typescriptreact", "svelte", "javascriptreact" },
    disable_filetype = { "TelescopePrompt", "vim" },
})

-- Rule
-- ==========
-- Latex
npairs.add_rules({
    Rule("$$$", "$", "tex"),
})

-- add space paranthess
npairs.add_rules({
    Rule(" ", " ")
    :with_pair(function(opts)
        local pair = opts.line:sub(opts.col, opts.col + 1)
        return vim.tbl_contains({ "()", "[]", "{}" }, pair)
    end)
})
