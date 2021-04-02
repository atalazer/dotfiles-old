-- ========================================================
vim.cmd[[packadd nvim-treesitter]]
require("nvim-treesitter.configs").setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = {
        enable = true,
    },
}

-- ========================================================
vim.cmd[[packadd nvim-ts-autotag]]
require('nvim-ts-autotag').setup({
    filetypes = { "html", "markdown", "xml" }
})

-- ========================================================
vim.cmd[[packadd nvim-biscuits]]
require('nvim-biscuits').setup({
    -- default_config = {
    --     max_length = 12,
    --     min_destance = 5,
    --     prefix_string = " 📎 "
    -- },
    -- language_config = {
    --     html = {
    --         prefix_string = " 🌐 "
    --     },
    --     javascript = {
    --         prefix_string = " ✨ ",
    --         max_length = 80
    --     }
    -- }
})
vim.cmd[[
" global color
highlight BiscuitColor ctermfg=cyan

" language specific color
highlight BiscuitColorRust ctermfg=red
]]

