vim.cmd [[packadd nvim-tree.lua]]
vim.cmd [[packadd nvim-web-devicons]]

vim.g.nvim_tree_side = "left"
vim.g.nvim_tree_width = 30
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_ignore = {
    ".git",
    "node_modules",
    "__sapper__",
    ".routify",
    "dist",
    ".cache",
}
vim.g.nvim_tree_auto_ignore_ft = {
    "startify",
    "dashboard",
}

vim.g.nvim_tree_tab_open = 0
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_auto_close = 0
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_root_folder_modifier = ":~"
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
}
vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git_icons = {
        unstaged  = "✗",
        staged    = "✓",
        unmerged  = "",
        renamed   = "➜",
        untracked = "★",
        deleted   = "",
        ignored   = "◌"
    },
    folder_icons = {
        default      = "",
        open         = "",
        empty        = "",
        empty_open   = "",
        symlink      = "",
        symlink_open = "",
    },
    lsp = {
        hint    = "",
        info    = "",
        warning = "",
        error   = "",
    },
}

-- Mappings for nvimtree
local tree_cb = require("nvim-tree.config").nvim_tree_callback
vim.g.nvim_tree_bindings = {
    ["<CR>"]           = tree_cb("edit"),
    ["o"]              = tree_cb("edit"),
    ["<2-LeftMouse>"]  = tree_cb("edit"),
    ["<2-RightMouse>"] = tree_cb("cd"),
    ["<C-]>"]          = tree_cb("cd"),
    ["cd"]             = tree_cb("cd"),
    ["<C-v>"]          = tree_cb("vsplit"),
    ["<C-x>"]          = tree_cb("split"),
    ["<C-t>"]          = tree_cb("tabnew"),
    ["<BS>"]           = tree_cb("close_node"),
    ["<S-CR>"]         = tree_cb("close_node"),
    ["<Tab>"]          = tree_cb("preview"),
    ["I"]              = tree_cb("toggle_ignored"),
    ["H"]              = tree_cb("toggle_dotfiles"),
    ["<C-r>"]          = tree_cb("refresh"),
    ["a"]              = tree_cb("create"),
    ["d"]              = tree_cb("remove"),
    ["r"]              = tree_cb("rename"),
    ["R"]              = tree_cb("full_rename"),
    ["x"]              = tree_cb("cut"),
    ["c"]              = tree_cb("copy"),
    ["p"]              = tree_cb("paste"),
    ["[c"]             = tree_cb("prev_git_item"),
    ["]c"]             = tree_cb("next_git_item"),
    ["-"]              = tree_cb("dir_up"),
    ["q"]              = tree_cb("close"),
}
