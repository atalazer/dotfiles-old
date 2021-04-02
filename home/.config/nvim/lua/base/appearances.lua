-- xresources, ayu
local colorscheme = "ayu"
local ayu_theme = "dark"                    -- dark, light, mirage

-- ===== Initialize =====

vim.cmd("syntax enable")
vim.cmd("let ayu_theme=\"" .. ayu_theme .. "\"")
vim.cmd("colorscheme " .. colorscheme)
