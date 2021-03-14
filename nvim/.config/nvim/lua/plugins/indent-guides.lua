vim.cmd[[packadd indent-guides.nvim]]

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
    };
    even_colors = {
        fg = '#1a2129', 
        bg = '#14191F',
    };
    odd_colors = { 
        fg = '#14191F',
        bg = '#1a2129', 
    };
})
