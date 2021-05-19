-- xresources, material
local colorscheme = "xresources"
local g = vim.g

if colorscheme == "material" then
    g.material_style = "deep ocean" -- darker, lighter, default, oceanic, palenight, deep ocean
    g.material_italic_comments = true
    g.material_italic_keywords = true
    g.material_italic_functions = true
    g.material_contrast = true
    g.material_borders = true
end

-- ===== Initialize =====
vim.cmd([[
syntax enable
set termguicolors
]])

if colorscheme == "material" then
    require("material").set()
elseif colorscheme == "xresources" then
    require("xresources")
else
    vim.cmd("colorscheme " .. colorscheme)
end

return {
    colorscheme = colorscheme
}
