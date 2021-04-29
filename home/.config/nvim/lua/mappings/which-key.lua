vim.cmd("packadd vim-which-key")
vim.cmd("packadd nvim-whichkey-setup.lua")

-- ==================================
local which_key_prefix = "w"
vim.g.which_key_fallback_to_native_key = 1
vim.g.which_key_sep = "->"
vim.g.which_key_timeout = 100
vim.g.which_key_display_names = {
    ["<CR>"] = "↵",
    ["<TAB>"] = "⇆",
    [" "] = "🚀",
}

-- ==================================

local wk = require("whichkey_setup")
wk.config({
    hide_statusline = true,
    default_keymap_settings = {
        silent = true,
        noremap = true,
    },
    default_mode = "n",
})

-- ==================================

leader_keymap = {}

leader_keymap.c = {
    name = "+cwd",
    c = { ":lcd %:p:h<CR>:pwd<CR>", "lcd to current" },
    d = { ":cd %:p:h<CR>:pwd<CR>", "cd to current" },
}

wk.register_keymap("leader", leader_keymap)

-- ==================================
local local_keymap = {
    r = { ":!lua %<CR>", "run lua file" },
    p = { ":!python %<CR>", "run python file" },
    l = { ":luafile %<CR>", "source lua file" },
    v = { ":source %<CR>", "source vim file" },
}

wk.register_keymap("localleader", local_keymap)

-- ==================================
local visual_keymap = {
    K = { ":move '<-2<CR>gv-gv", "move line up" },
    J = { ":move '>+1<CR>gv-gv", "move line down" },
}

wk.register_keymap("leader", visual_keymap, { mode = "v" })

-- ==================================

nnoremap({ which_key_prefix .. "l", ":<c-u>WhichKey 'l'<CR>", { silent = true } })
nnoremap({ which_key_prefix .. ";", ":<c-u>WhichKey ';'<CR>", { silent = true } })
nnoremap({ which_key_prefix .. " ", ":<c-u>WhichKey ' '<CR>", { silent = true } })

