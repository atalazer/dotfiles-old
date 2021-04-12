vim.cmd[[packadd indent-guides.nvim]]

local get_color = function()
    if RC.use_xresources == true then
        local color = require("base.colorscheme.xresources")
        return {
            fg = color.grey1,
            bg = color.grey
        }
    else
        return {
            fg = '#1F2233',
            bg = '#464B5D'
        }
    end
end

local colors = get_color()

require('indent_guides').setup({
    -- put your options in here
    indent_levels = 30,
    indent_guide_size = 2,
    indent_start_level = 1,
    indent_space_guides = true,
    indent_tab_guides = false,
    indent_soft_pattern = '\\s',
    exclude_filetypes = {
        'help', 'startuptime',
        'dashboard','dashpreview', 'startify',
        'NvimTree','vista','sagahover',
        'packer',
        'text', 'markdown'
    },
    even_colors = {
        fg = colors.fg,
        bg = colors.bg
    },
    odd_colors = {
        fg = colors.bg,
        bg = colors.fg
    }
})

nnoremap{"<leader>ii", "<CMD>IndentGuidesToggle<CR>"}
