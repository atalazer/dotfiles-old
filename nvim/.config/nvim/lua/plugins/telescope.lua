vim.cmd([[packadd plenary.nvim]])
vim.cmd([[packadd popup.nvim]])
vim.cmd([[packadd telescope.nvim]])

require('telescope').setup{
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        prompt_position = "bottom",
        prompt_prefix = ">>",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_defaults = {},
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {"*.git/*", "*/tmp/*", "*.cache/*"},
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        shorten_path = true,
        winblend = 0,
        width = 0.6,
        preview_cutoff = 100,
        results_height = 2,
        results_width = 0.5,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons = true,
        use_less = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
        file_previewer = require'telescope.previewers'.cat.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
        grep_previewer = require'telescope.previewers'.vimgrep.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
        qflist_previewer = require'telescope.previewers'.qflist.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
    },
    extensions = {
        media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg", "pdf", "mkv"},
            find_cmd = "rg"
        },
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
        frecency = {
            show_scores = false,
            show_unindexed = true,
            ignore_patterns = {"*.git/*", "*/tmp/*", "*.cache/*"},
            workspaces = {
                ["nvim"] = "/home/atalariq/.config/nvim",
                ["awesome"] = "/home/atalariq/.config/awesome",
                ["alacritty"] = "/home/atalariq/.config/alacritty",
                ["dotfiles"] = "/home/atalariq/dotfiles",
                ["zsh"] = "/home/atalariq/dotfiles/zsh/.zsh"
            }
        },
    },
}

require('telescope').load_extension('media_files')
require('telescope').load_extension('fzy_native')
require('telescope').load_extension("frecency")

-- Telescope
nnoremap{"<C-p>", ":Telescope fd<CR>"}
nnoremap{"<C-p>p", ":Telescope frecency<CR>"}
nnoremap{"<C-p>m", ":Telescope media_files<CR>"}
nnoremap{"<C-p>l", ":Telescope live_grep<CR>"}
nnoremap{"<C-p>f", ":Telescope file_browser<CR>"}
nnoremap{"<C-p>h", ":Telescope oldfiles<CR>"}
nnoremap{"<C-p>b", ":Telescope buffers<CR>"}
nnoremap{"<C-p>k", ":Telescope keymaps<CR>"}
nnoremap{"<C-p>c", ":Telescope colorscheme<CR>"}

