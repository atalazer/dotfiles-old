vim.cmd [[packadd nvim-web-devicons]]
vim.cmd [[packadd nvim-nonicons]]

vim.g.override_nvim_web_devicons = false

local icons = require "nvim-nonicons"
require "nvim-web-devicons".setup{
    default = true
}

