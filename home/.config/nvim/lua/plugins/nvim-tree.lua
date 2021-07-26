vim.g.nvim_tree_side = "left"
vim.g.nvim_tree_width = 30
vim.g.nvim_tree_ignore = {
    ".git",
    "node_modules",
    "__sapper__",
    ".routify",
    "dist",
    ".cache",
}

vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_auto_close = 0
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_root_folder_modifier = ":~"
vim.g.nvim_tree_tab_open = 0
vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1,
}

vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git_icons = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
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

