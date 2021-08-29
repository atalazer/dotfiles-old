local _, telescope = pcall(require, "telescope")
local previewers = require("telescope.previewers")
local actions = require("telescope.actions")

local k = vim.keymap
local nnoremap = k.nnoremap

local HOME = os.getenv("HOME")
local M = {}

M.no_preview = function()
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
        set_env = { ["COLORTERM"] = "truecolor" },
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
            "--smart-case",
        },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-v>"] = actions.select_vertical,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-t>"] = actions.select_tab,

                ["<C-c>"] = actions.close,

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
            file_ignore_patterns = {
                "%.svg",
                "%.png",
                "%.jpg",
                "%.webp",
                "%.mp3",
                "%.mp4",
                "%.mkv",
            },
        },
        lsp_code_actions = M.no_preview(),
        oldfiles = M.no_preview(),
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
                ["dotfiles"] = os.getenv("DOTS"),
                ["dots"] = os.getenv("DOTS"),
                ["blog"] = os.getenv("BLOG"),
                ["repo"] = HOME .. "/Documents/GitHub",
                ["project"] = HOME .. "/Documents/Project",
                ["pro"] = HOME .. "/Documents/Project",
                ["school"] = HOME .. "/Documents/School",
                ["sch"] = HOME .. "/Documents/School",
                ["scratch"] = HOME .. "/Documents/.Scratch",
                ["scr"] = HOME .. "/Documents/.Scratch",
                ["ksn"] = HOME .. "/Documents/KSN-MTK-SMP",
                ["nvim"] = HOME .. "/.config/nvim",
                ["awesome"] = HOME .. "/.config/awesome",
                ["awm"] = HOME .. "/.config/awesome",
                ["kitty"] = HOME .. "/.config/kitty",
                ["zsh"] = HOME .. "/.zsh",
                ["firefox"] = HOME .. "/.mozilla/firefox/",
                ["backup"] = HOME .. "/Backups",
            },
        },
    },
})

-- Load Extensions {{{
require("telescope").load_extension("fzf")
require("telescope").load_extension("frecency")
require("telescope").load_extension("media_files")
-- }}}

-- Set Keymap {{{
local builtin = require("telescope.builtin")
M.builtins = function()
    builtin.builtin(M.no_preview())
end

M.frecency = function()
    telescope.extensions.frecency.frecency(M.no_preview())
end

-- Telescope
nnoremap({ "<C-p>", ":Telescope find_files<CR>", { silent = true } })
nnoremap({ "<leader>fl", ":Telescope live_grep<CR>", { silent = true } })
nnoremap({ "<leader>fo", ":Telescope oldfiles<CR>", { silent = true } })
nnoremap({ "<leader>fd", ":Telescope marks<CR>", { silent = true } })
nnoremap({ "<leader>fb", ":Telescope file_browser<CR>", { silent = true } })
nnoremap({ "<leader>fk", ":Telescope keymaps<CR>", { silent = true } })
nnoremap({ "<leader>fc", ":Telescope colorscheme<CR>", { silent = true } })
nnoremap({ "<Leader>ft", M.builtins, { silent = true } })

-- :Telescope Extensions
nnoremap({ "<leader>ff", M.frecency, { silent = true } })
nnoremap({ "<leader>fm", ":Telescope media_files<CR>", { silent = true } })
-- }}}

return M
