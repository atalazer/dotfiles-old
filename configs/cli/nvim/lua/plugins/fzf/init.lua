local fzf_lua = require("fzf-lua")
local search = require(... .. ".search")
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
nnoremap("<leader>fm", "<CMD>FzfLua marks<CR>", { silent = true }, "Marks")
nnoremap("<leader>fb", "<CMD>FzfLua files<CR>", { silent = true }, "File Browser")
nnoremap("<leader>fk", "<CMD>FzfLua keymaps<CR>", { silent = true }, "Keybindings")
nnoremap("<leader>fc", "<CMD>FzfLua colorschemes<CR>", { silent = true }, "Colorscheme")
nnoremap("<Leader>ft", "<CMD>FzfLua builtin<CR>", { silent = true }, "Built-Ins")
nnoremap("<Leader>f?", "<CMD>FzfLua help_tags<CR>", { silent = true }, "Help Tags")

nnoremap("<Leader>df", function()
        search.search({
            vim_cmd = "edit",
            previewer = "bat --style=numbers --color=always",
            extension = "*",
            dir = string.format("%s/.dotfiles", vim.loop.os_homedir())
        })
    end
)

