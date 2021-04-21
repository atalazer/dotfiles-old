vim.cmd("packadd vim-which-key")
vim.cmd("packadd nvim-whichkey-setup.lua")

-- ==================================
vim.g.which_key_fallback_to_native_key = 1
vim.g.which_key_display_names = {
    ['<CR>'] = '↵',
    ['<TAB>'] = '⇆',
    [' '] = '🚀',
}
vim.g.which_key_sep = '→'
vim.g.which_key_timeout = 100

-- ==================================
local wk = require('whichkey_setup')

wk.config({
    hide_statusline = false,
    default_keymap_settings = {
        silent = true,
        noremap = true,
    },
    default_mode = "n",
})

-- ==================================
local leader_keymap = {}
-- cwd
leader_keymap.c = {
    name = '+cwd',
    d = {':cd %:p:h<CR>:pwd<CR>', 'cd to current'},
    l = {':lcd %:p:h<CR>:pwd<CR>', 'lcd to current'},
}
wk.register_keymap('leader', leader_keymap)

-- ==================================
local local_keymap = {
    l = {':!lua %', 'run lua file'},
    p = {':!python %', 'run python file'},
}
wk.register_keymap('localleader', local_keymap)

-- ==================================
local visual_keymap = {
    K = {':move \'<-2<CR>gv-gv', 'move line up'},
    J = {':move \'>+1<CR>gv-gv', 'move line down'},
}
wk.register_keymap('leader', visual_keymap, {mode = 'v'})

