local fzf_lua = require("fzf-lua")

-- Setup
-- ------------------------------
fzf_lua.setup({
    keymap = {
        builtin = {
            ["<F1>"] = "toggle-fullscreen",
            ["<F2>"] = "toggle-preview-wrap",
            ["<F3>"] = "toggle-preview",
            ["<F4>"] = "toggle-preview-ccw",
            ["<F5>"] = "toggle-preview-cw",
            ["<S-down>"] = "preview-page-down",
            ["<S-up>"] = "preview-page-up",
            ["<PageDown>"] = "preview-page-down",
            ["<PageUp>"] = "preview-page-up",
            ["<S-left>"] = "preview-page-reset",
        },
        fzf = {
            ["ctrl-u"] = "unix-line-discard",
            ["f3"] = "toggle-preview-wrap",
            ["f4"] = "toggle-preview",
            ["pgdn"] = "preview-page-down",
            ["pgup"] = "preview-page-up",
            ["shift-down"] = "preview-page-down",
            ["shift-up"] = "preview-page-up",
        },
    },
    previewers = {
        glow = {
            cmd = "glow",
            args = "--pager",
        },
        builtin = {
            title = true,
            scrollbar = true,
            scrollchar = "█",
            syntax = true,
            syntax_limit_b = 1024 * 1024,
            syntax_limit_l = 0,
            hl_cursor = "Cursor",
            hl_cursorline = "CursorLine",
        },
    },
    file_icon_colors = {
        ["sh"]    = "green",
        ["lua"]    = "blue",
    },
})

-- Mappings
-- ------------------------------
nnoremap("<C-p>", "<CMD>FzfLua files<CR>", { silent = true }, "Find Files")
nnoremap("<leader>fo", "<CMD>FzfLua oldfiles<CR>", { silent = true }, "File History")
nnoremap("<leader>ff", "<CMD>FzfLua oldfiles<CR>", { silent = true }, "File History")
nnoremap("<leader>fg", "<CMD>FzfLua grep<CR>", { silent = true }, "Grep")
nnoremap("<leader>fl", "<CMD>FzfLua live_grep<CR>", { silent = true }, "Live Grep")
nnoremap("<leader>fd", "<CMD>FzfLua marks<CR>", { silent = true }, "Marks")
nnoremap("<leader>fb", "<CMD>FzfLua files<CR>", { silent = true }, "File Browser")
nnoremap("<leader>fk", "<CMD>FzfLua keymaps<CR>", { silent = true }, "Keybindings")
nnoremap("<leader>fc", "<CMD>FzfLua colorschemes<CR>", { silent = true }, "Colorscheme")
nnoremap("<Leader>ft", "<CMD>FzfLua builtin<CR>", { silent = true }, "Built-Ins")
nnoremap("<Leader>f?", "<CMD>FzfLua help_tags<CR>", { silent = true }, "Help Tags")
