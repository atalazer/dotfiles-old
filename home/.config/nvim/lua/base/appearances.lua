-- xresources, material
local colorscheme = RC.colorscheme or "industry"
local g = vim.g

if RC.use_xresources == false then
    if colorscheme == "material" then
        g.material_style = "deep ocean" -- darker, lighter, default, oceanic, palenight, deep ocean
        g.material_italic_comments  = true
        g.material_italic_keywords  = true
        g.material_italic_functions = true
        g.material_contrast         = true
        g.material_borders          = true
    end
    elseif colorscheme == "tokyonight" then
        vim.cmd"packadd tokyonight.nvim"
        g.tokyonight_style = "night"       -- night day storm
        g.tokyonight_transparent     = true
        g.tokyonight_terminal_colors = true
        g.tokyonight_italic_comments  = true
        g.tokyonight_italic_keywords  = true
        g.tokyonight_italic_functions = true
        g.tokyonight_italic_variables = true
        g.tokyonight_dark_sidebar = true
        g.tokyonight_dark_float   = true
        g.tokyonight_hide_inactive_statusline = true
        g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
        g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
end

-- ===== Initialize =====
vim.cmd([[
syntax enable
set termguicolors
]])

if RC.use_xresources == true then
    -- require("xresources")
    require("base.colorscheme.xresources").colorscheme()
else
    if colorscheme == "material" then
        require("material").set()
    else
        vim.cmd("colorscheme " .. colorscheme)
    end
end
