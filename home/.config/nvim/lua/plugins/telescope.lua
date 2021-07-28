local telescope = require("telescope")
local previewers = require("telescope.previewers")
local actions = require("telescope.actions")

local M = {}

local no_preview = function()
    return require("telescope.themes").get_dropdown({
        borderchars = {
            { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            prompt = { "─", "│", " ", "│", "╭", "╮", "╯", "╰" },
            result = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        },
        layout_config = {
            width = 0.8,
        },
        previewer = false,
    })
end

telescope.setup({
    defaults = {
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,
        scroll_strategy = "cycle",
        selection_strategy = "reset",
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        use_less = true,
        set_env = {["COLORTERM"] = "truecolor"},
        layout_strategy = "flex",
        layout_config = {
            width = 0.8,
            height = 0.9,
            horizontal = {
                prompt_position = "bottom",
                preview_cutoff = 120,
                preview_width = 0.65,
            },
            vertical = {
                preview_cutoff = 40,
                preview_height = 0.60,
            },
            center = {
                preview_cutoff = 40,
            },
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case"
        },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-v>"] = actions.select_vertical,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-t>"] = actions.select_tab,

                ["<C-c>"] = actions.close,
                -- ["<Esc>"] = actions.close,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["<Tab>"] = actions.toggle_selection,
            },
            n = {
                ["<CR>"] = actions.select_default + actions.center,
                ["<C-v>"] = actions.select_vertical,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-t>"] = actions.select_tab,
                ["<Esc>"] = actions.close,

                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<C-q>"] = actions.send_to_qflist,
                ["<Tab>"] = actions.toggle_selection,
            },
        },
    },
    pickers = {
        find_files = {
            file_ignore_patterns = { "%.png", "%.jpg", "%.webp" },
        },
        lsp_code_actions = no_preview(),
        oldfiles = no_preview(),
        frecency = no_preview(),
    },
    extensions = {
        fzf = {
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg", "svg" },
            find_cmd = "rg",
        },
        frecency = {
            show_scores = false,
            show_unindexed = true,
            ignore_patterns = { "*.git/*", "*/tmp/*", "**.cache**" },
            workspaces = {
                ["dotfiles"] = os.getenv("DOTS") or "/home/atalariq/.dotfiles",
                ["blog"] = os.getenv("BLOG") or "/home/atalariq/Work/Blog",
                ["repos"] = os.getenv("REPO_DIR") or "/home/atalariq/Work/Repos",
                ["nvim"] = "/home/atalariq/.config/nvim",
                ["awesome"] = "/home/atalariq/.config/awesome",
                ["kitty"] = "/home/atalariq/.config/kitty",
                ["zsh"] = "/home/atalariq/.zsh",
            },
        },
    },
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("media_files")
require("telescope").load_extension("frecency")

return M
