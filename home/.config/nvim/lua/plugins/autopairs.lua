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
    ignored_next_char = string.gsub([[ [%w%%%'%[%"%.%#] ]], "%s+", ""),
    check_line_pair = true,
    check_ts = true,
    html_break_line_filetype = { "html", "vue", "typescriptreact", "svelte", "javascriptreact" },
    disable_filetype = { "TelescopePrompt", "vim" },
})

-- Rule
-- ==========
-- Endwise
npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))

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
