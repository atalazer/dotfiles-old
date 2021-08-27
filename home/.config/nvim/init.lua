-- Disable builtin plugins
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_spec = 1

-- Set leader and localleader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Lua
require("base.keymap")
require("base.settings")
require("base.util")
require("base.keys")

-- Vimscript
vim.cmd([[
    runtime! lua/base/keys.vim
    runtime! lua/base/event.vim
]])
