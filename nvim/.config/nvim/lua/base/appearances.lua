local cmd = vim.cmd

-- xresources, ayu
local colorscheme = "ayu"
local ayu_theme = "mirage"                    -- dark, light, mirage

cmd("syntax enable")
cmd("let ayu_theme=\"" .. ayu_theme .. "\"")
cmd("colorscheme " .. colorscheme)
