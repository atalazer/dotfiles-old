local g = vim.g

-- Set leader and localleader
g.mapleader = "."
g.maplocalleader = ","

-- Disable builtin plugins
g.loaded_gzip = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_zipPlugin = 1
g.loaded_2html_plugin = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_spec = 1

pcall(require, "base.settings")
pcall(require, "base.util")
pcall(require, "base.keymap")
pcall(require, "base.keys")

