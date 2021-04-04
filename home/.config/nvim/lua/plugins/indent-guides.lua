vim.cmd[[packadd indent-guides.nvim]]
local colors = require("base.colorscheme.xresources") or require("xresources")

require('indent_guides').setup({
    -- put your options in here
    indent_levels = 30;
    indent_guide_size = 2;
    indent_start_level = 1;
    indent_space_guides = true;
    indent_tab_guides = false;
    indent_soft_pattern = '\\s';
    exclude_filetypes = {
        'help', 'startuptime',
        'dashboard','dashpreview', 'startify',
        'NvimTree','vista','sagahover',
        'packer',
        'text', 'markdown'
    };
    even_colors = {
        fg = colors.grey,
        bg = colors.grey1,
    };
    odd_colors = {
        fg = colors.grey1,
        bg = colors.grey,
    };
})
nnoremap{"<leader>ii", "<CMD>IndentGuidesToggle<CR>"}
