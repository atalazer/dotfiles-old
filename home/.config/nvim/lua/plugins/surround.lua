vim.cmd([[packadd surround.nvim]])

-- normal mode:
-- | ------- | ----------------------------- | ---------------------------    |
-- | options | surround                      | sandwich                       |
-- | ------- | ----------------------------- | ---------------------------    |
-- | add     | s<char> or ys{motion}{char}   | s<char> or ys{motion}{char}    |
-- | replace | sr<from><to>                  | cs<from><to>                   |
-- | delete  | sd<char>                      | ds<char>                       |
-- | repeat  | ss                            | -                              |
-- | ------- | ----------------------------- | ---------------------------    |

-- insert mode:
-- add                 | <c-s><char>
-- add with whitespace | <c-s><char><space>
-- add with new line   | <c-s><char><c-s>

vim.g.surround_prefix = "s"
vim.g.surround_mappings_style = "sandwich" -- "surround" or "sandwich"
vim.g.surround_load_autogroups = true
vim.g.surround_load_keymaps = true
vim.g.surround_context_offset = 100
vim.g.surround_quotes = { "'", "\"", "`" }
vim.g.surround_brackets = { "(", "{", "[" }
vim.g.surround_pairs = {
    nestable = {
        { "(", ")" },
        { "[", "]" },
        { "{", "}" },
        { "<", ">" }
    },
    linear = {
        { "'", "'" },
        { "\"", "\"" },
        { "`", "`" }
    }
}

require("surround").setup({})
