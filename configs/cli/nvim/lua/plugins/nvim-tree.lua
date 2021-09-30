local M = {}
local dev = true

M.setup = function()
    vim.g.nvim_tree_ignore = {
        ".git",
        "node_modules",
        "__sapper__",
        ".routify",
        "dist",
        ".cache",
    }
    vim.g.nvim_tree_gitignore = 0
    vim.g.nvim_tree_quit_on_open = 0
    vim.g.nvim_tree_indent_markers = 1
    vim.g.nvim_tree_hide_dotfiles = 0
    vim.g.nvim_tree_git_hl = 1
    vim.g.nvim_tree_highlight_opened_files = 1
    vim.g.nvim_tree_root_folder_modifier = ":~"
    vim.g.nvim_tree_add_trailing = 1
    vim.g.nvim_tree_group_empty = 1
    vim.g.nvim_tree_disable_window_picker = 0
    vim.g.nvim_tree_icon_padding = " "
    vim.g.nvim_tree_symlink_arrow = " >> "
    vim.g.nvim_tree_respect_buf_cwd = 1
    vim.g.nvim_tree_refresh_wait = 500
    vim.g.nvim_tree_window_picker_exclude = {
        filetype = {
            "notify",
            "packer",
            "qf",
        },
        buftype = {
            "terminal",
        },
    }
    vim.g.nvim_tree_special_files = {
        ["README.md"] = 1,
        ["Makefile"] = 1,
        ["MAKEFILE"] = 1,
    }
    vim.g.nvim_tree_show_icons = {
        git = 0,
        folders = 1,
        files = 1,
        folder_arrows = 1,
    }
    vim.g.nvim_tree_icons = {
        default = "",
        symlink = "",
        git_icons = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "",
            untracked = "★",
            deleted = "",
            ignored = "◌",
        },
        folder_icons = {
            default = "",
            open = "",
            empty = "",
            empty_open = "",
        },
    }
end

M.config = function()
    local cb = require("nvim-tree.config").nvim_tree_callback
    require("nvim-tree").setup({
        disable_netrw = false,
        hijack_netrw = true,
        hijack_cursor = true,
        lsp_diagnostics = true,
        update_cwd = true,
        update_focused_file = {
            enable = true,
            update_cwd = true,
            ignore_list = {},
        },
        view = {
            width = 30,
            side = "left",
            auto_resize = true,
            mappings = {
                custom_only = true,
                list = {
                    { key = "<CR>", cb = cb("edit") },
                    { key = "<C-]>", cb = cb("cd") },
                    { key = "<C-v>", cb = cb("vsplit") },
                    { key = "<C-x>", cb = cb("split") },
                    { key = "<C-t>", cb = cb("tabnew") },
                    { key = "<", cb = cb("prev_sibling") },
                    { key = ">", cb = cb("next_sibling") },
                    { key = "P", cb = cb("parent_node") },
                    { key = "<BS>", cb = cb("close_node") },
                    { key = ",", cb = cb("toggle_ignored") },
                    { key = ".", cb = cb("toggle_dotfiles") },
                    { key = "<C-r>", cb = cb("refresh") },
                    { key = "n", cb = cb("create") },
                    { key = {"<DEL>"}, cb = cb("remove") },
                    { key = "r", cb = cb("rename") },
                    { key = "R", cb = cb("full_rename") },
                    { key = "x", cb = cb("cut") },
                    { key = "c", cb = cb("copy") },
                    { key = "p", cb = cb("paste") },
                    { key = "y", cb = cb("copy_name") },
                    { key = "Y", cb = cb("copy_path") },
                    { key = "gy", cb = cb("copy_absolute_path") },
                    { key = "[c", cb = cb("prev_git_item") },
                    { key = "]c", cb = cb("next_git_item") },
                    { key = "-", cb = cb("dir_up") },
                    { key = "s", cb = cb("system_open") },
                    { key = "q", cb = cb("close") },
                    { key = "?", cb = cb("toggle_help") },
                },
            },
        },
    })
end

if dev == "true" then
    M.setup()
    M.config()
end

return M
