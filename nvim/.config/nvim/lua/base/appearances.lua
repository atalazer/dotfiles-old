local cmd = vim.cmd

-- dark, light, mirage
local ayu_theme = "dark"
-- xresources, ayu, onebuddy
local colorscheme = "ayu"

cmd('syntax enable')
cmd('let ayu_theme="'..ayu_theme..'"')
cmd('colorscheme '.. colorscheme)

