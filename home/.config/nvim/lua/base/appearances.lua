local colorscheme = "xresources"

-- ===== Initialize =====
vim.cmd([[
    syntax enable
    set termguicolors
]])

vim.cmd("colorscheme " .. colorscheme)

