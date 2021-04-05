-- xresources, material
local colorscheme = "material"
local ayu_theme = "dark" -- dark, light, mirage

if colorscheme == "material" then
    vim.g.material_style = "deep ocean" -- darker, lighter, default, oceanic, palenight, deep ocean
    vim.g.material_italic_comments = 1
    vim.g.material_italic_keywords = 1
    vim.g.material_italic_functions = 1
    -- Set Mappings
    vim.api.nvim_set_keymap(
        "n",
        "<C-m>k",
        [[<Cmd>lua require('material').change_style('deep ocean')<CR>]],
        { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
        "n",
        "<C-m>l",
        [[<Cmd>lua require('material').change_style('darker')<CR>]],
        { noremap = true, silent = true }
    )
end

-- ===== Initialize =====

vim.cmd("syntax enable")
vim.cmd("let ayu_theme=\"" .. ayu_theme .. "\"")
vim.cmd("colorscheme " .. colorscheme)
