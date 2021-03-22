local cmd = vim.cmd

-- xresources, ayu
local colorscheme = "xresources"
local ayu_theme = "dark"                    -- dark, light, mirage

cmd("syntax enable")
cmd("let ayu_theme=\"" .. ayu_theme .. "\"")
cmd("colorscheme " .. colorscheme)
