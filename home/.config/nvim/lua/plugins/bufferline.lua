-- originally was taken from https://github.com/cooper-anderson/dotfiles
-- with some modifications and refactoring that I did

vim.cmd([[packadd nvim-bufferline.lua]])
vim.cmd [[packadd nvim-web-devicons]]

require("bufferline").setup({
    tab_size = 15,
    max_name_length = 12,
    max_prefix_length = 3,
    mappings = true,
    show_buffer_close_icons = true,
    buffer_close_icon = "",
    separator_style = { "|", "|" },
    diagnostics = "nvim_lsp",
})
