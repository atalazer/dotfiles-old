-- Store startup time in seconds
vim.g.start_time = vim.fn.reltime()

-- Disable these for very fast startup time
vim.cmd([[
	syntax off
	filetype off
    filetype plugin indent off
]])

-- Temporarily disable shada file to improve performance
vim.opt.shadafile = "NONE"

-- Disable builtin plugins
vim.g.loaded_gzip = false
vim.g.loaded_tar = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_2html_plugin = false
vim.g.loaded_netrw = false
vim.g.loaded_netrwPlugin = false
vim.g.loaded_matchit = false
vim.g.loaded_matchparen = false
vim.g.loaded_spec = false

-- Set leader and localleader
vim.g.mapleader = "."
vim.g.maplocalleader = ","

pcall(require, "base.settings")
pcall(require, "base.util")

local async
async = vim.loop.new_async(vim.schedule_wrap(function()
    vim.defer_fn(function()
        pcall(require, "base.keymap")
        pcall(require, "base.keys")
        pcall(require, "plugins.init")

        -- If the dashboard plugin is already installed and the packer_compiled.lua
        -- file exists so we can make sure that the dashboard have been loaded
        local compiled_plugins_path = vim.fn.expand("$HOME/.config/nvim/plugin/packer_compiled.lua")
        if vim.fn.filereadable(compiled_plugins_path) > 0 then
            -- If the current buffer name is empty then trigger Dashboard
            if vim.api.nvim_buf_get_name(0):len() == 0 then
                vim.cmd("Dashboard")
            end
        end

        vim.opt.shadafile = ""
        vim.defer_fn(function()
            vim.cmd([[
                rshada!
                doautocmd BufRead
                syntax on
                filetype on
                filetype plugin indent on
                PackerLoad nvim-treesitter
                silent! bufdo e
            ]])
        end, 15)
    end, 0)

    async:close()
end))

async:send()
