local actions = require("telescope.actions")
local previewers = require("telescope.previewers")

local M = {}
local _, telescope = pcall(require, "telescope")

telescope.setup({
    defaults = {
        file_previewer   = previewers.vim_buffer_cat.new,
        grep_previewer   = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,
        scroll_strategy    = "cycle",
        selection_strategy = "reset",
        layout_strategy    = "flex",
        borderchars        = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        layout_defaults = {
            horizontal = {
                width_padding  = 0.10,
                height_padding = 0.10,
                preview_width  = 0.65,
            },
            vertical = {
                width_padding  = 0.10,
                height_padding = 1.00,
                preview_height = 0.60,
            },
        },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-v>"] = actions.select_vertical,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-t>"] = actions.select_tab,

                ["<C-c>"] = actions.close,
                ["<Esc>"] = actions.close,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
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
                ["alacritty"] = "/home/atalariq/.config/alacritty",
                ["kitty"] = "/home/atalariq/.config/kitty",
                ["zsh"] = "/home/atalariq/.zsh",
            },
        },
    },
})

pcall(require("telescope").load_extension, "fzf") -- superfast sorter
pcall(require("telescope").load_extension, "media_files") -- media preview
pcall(require("telescope").load_extension, "frecency") -- frecency

local no_preview = function()
    return require("telescope.themes").get_dropdown({
        borderchars = {
            {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
            prompt  = { '─', '│', ' ', '│', '╭', '╮', '╯', '╰' },
            result  = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
            preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }
        },
        width     = 0.8,
        previewer = false,
    })
end

M.files = function()
    require("telescope.builtin").find_files({
        file_ignore_patterns = { "%.png", "%.jpg", "%.webp" },
    })
end

M.code_action = function()
    require("telescope.builtin").lsp_code_actions(no_preview())
end

M.frecency = function()
    require("telescope").extensions.frecency.frecency(no_preview())
end
M.media_files = function()
    require("telescope").extensions.media_files.media_files()
end

return setmetatable({}, {
    __index = function(_, k)
        if M[k] then
            return M[k]
        else
            return require("telescope.builtin")[k]
        end
    end,
})
