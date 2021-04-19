-- xresources, material
local colorscheme = RC.colorscheme or "industry"

if colorscheme == "material" and RC.use_xresources == false then
    vim.cmd[[packadd colorbuddy.nvim]]
    vim.cmd[[packadd material.nvim]]

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
        [[<Cmd>lua require('material').change_style('palenight')<CR>]],
        { noremap = true, silent = true }
    )
end

-- ===== Initialize =====
vim.cmd("syntax enable")
vim.cmd("set termguicolors")
if RC.use_xresources == true then
    require("base.colorscheme.xresources").colorscheme()
else
    if colorscheme == "material" then
        require('colorbuddy').colorscheme('material')
    else
        vim.cmd("colorscheme " .. colorscheme)
    end
end
