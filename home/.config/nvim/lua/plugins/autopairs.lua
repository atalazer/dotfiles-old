vim.cmd[[packadd nvim-autopairs]]

local npairs = require('nvim-autopairs')

npairs.setup{
    break_line_filetype = nil, -- enable this rule for all filetypes
    pairs_map = {
        ["'"] = "'",
        ['"'] = '"',
        ['('] = ')',
        ['['] = ']',
        ['{'] = '}',
        -- ['<'] = '>',
        ['`'] = '`',
    },
    disable_filetype = { "TelescopePrompt" },
    html_break_line_filetype = {
        'html' , 'vue' , 'typescriptreact'
    },
    -- ignore alphanumeric, operators, quote, curly brace, and square bracket
    ignored_next_char = "[%w%.%+%-%=%/%,\"'{%[]"
}

