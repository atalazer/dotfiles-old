vim.cmd[[packadd vim-which-key]]
local g = vim.g
local settings = {
    keys = {
        '<leader>', '<localleader>', '<space>',
    },
    trigger = 'w',
    keys_w_trigger = {
        '<leader>', '<localleader>', '<space>',
        '1', '2', '3', '4', '5',
        '6', '7', '8', '9', '0',
        'a', 'b', 'c', 'd', 'e',
        'f', 'g', 'h', 'i', 'j',
        'k', 'l', 'm', 'n', 'o',
        'p', 'q', 'r', 's', 't',
        'u', 'v', 'w', 'x', 'y', 'z',
    }
}

g.which_key_sep     = '→'
g.which_key_hspace  = 5
g.which_key_timeout = 200

g.which_key_flatten  = 1
g.which_key_max_size = 0

g.which_key_centered = 1
g.which_key_vertical = 0
g.which_key_sort_horizontal    = 1
g.which_key_align_by_seperator = 1

g.which_key_position         = 'botright'
g.which_key_run_map_on_popup = 1
g.which_key_use_floating_win = 0
g.which_key_floating_relative_win = 0
g.which_key_fallback_to_native_key = 1
vim.cmd[[
let g:which_key_floating_opts = {'width': '5', 'height': '5', 'col': '3', 'row': '3'}

let g:which_key_display_names = {' ': 'SPC','<CR>': '↵ ','<TAB>': '⇆','<C-H>': 'BS','<C-I>': '⇆ '}
let g:which_key_exit = ["<C-c>", "<ESC>", "<C-d>"]

highlight default link WhichKey          Function
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Keyword
highlight default link WhichKeyDesc      Identifier

highlight default link WhichKeyFloating Pmenu
]]

local keymap = vim.api.nvim_set_keymap
local whichKey = function(keys)
    for _, key in ipairs(keys) do
        keymap("n", key, ":WhichKey '".. key .. "'<CR>", {noremap = true, silent = true})
        keymap("v", key, ":WhichKeyVisual '".. key .."'<CR>", {noremap = true, silent = true})
    end

end
local whichKeyWithTrigger = function(keys, trig)
    for _, key in ipairs(keys) do
        keymap("n", trig .. key, ":WhichKey '".. key .. "'<CR>", {noremap = true, silent = true})
        keymap("v", trig .. key, ":WhichKeyVisual '".. key .."'<CR>", {noremap = true, silent = true})
    end

end
whichKey(settings.keys)
whichKeyWithTrigger(settings.keys_w_trigger, settings.trigger)

