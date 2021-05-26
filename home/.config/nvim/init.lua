-- ==================================== Global settings
local g = vim.g
local cmd = vim.cmd

g.mapleader = "."
g.maplocalleader = ","

-- Others options
g.python_host_prog  = "/usr/bin/python"
g.python3_host_prog = "/usr/bin/python3"
g.node_host_prog    = "/home/atalariq/.fnm/node-versions/v14.16.1/installation/bin/neovim-node-host"

-- Disable builtin plugins I don't use
g.loaded_gzip         = 1
g.loaded_tar          = 1
g.loaded_tarPlugin    = 1
g.loaded_zipPlugin    = 1
g.loaded_2html_plugin = 1
g.loaded_netrw        = 1
g.loaded_netrwPlugin  = 1
g.loaded_matchit      = 1
g.loaded_matchparen   = 1
g.loaded_spec         = 1

-- change cwd to current directory
cmd("cd %:p:h")

-- TODO: Add Custom Command
local modules = {
    -- "base.plugins",
    "base._util",
    "base.settings",
    "base.events",
    -- "base.commands",
    "base.keys",
    "base.appearances",
    "lsp",
}

local errors = {}
for _, v in pairs(modules) do
    local ok, err = pcall(require, v)
    if not ok then
        table.insert(errors, err)
    end
end

if not vim.tbl_isempty(errors) then
    for _, v in pairs(errors) do
        print(v)
    end
end
