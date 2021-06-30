local cmd, fn, g = vim.cmd, vim.fn, vim.g
local packpath = vim.fn.stdpath("data") .. "/site/pack"

-- Ensures a given github.com/USER/REPO is cloned in the pack/packer/start directory.
local ensure = function(user, repo)
    local install_path = string.format("%s/packer/opt/%s", packpath, repo)
    if fn.empty(fn.glob(install_path)) > 0 then
        cmd(string.format([[
            !git clone https://github.com/%s/%s %s
            packadd %s
        ]], user, repo, install_path, repo ))
    end
end

-- Bootstrap essential plugins required for installing and loading the rest.
ensure("wbthomason", "packer.nvim")

-- ==================================== Global settings
-- Set leader and localleader
g.mapleader = "."
g.maplocalleader = ","

-- Others options
g.python_host_prog = "/usr/bin/python3"
g.python3_host_prog = "/usr/bin/python3"
g.node_host_prog = "/home/atalariq/.fnm/node-versions/v14.16.1/installation/bin/neovim-node-host"

-- Disable builtin plugins I don't use
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

local modules = {
    "base.keymap",
    "base.util",
    "base.settings",
    "base.keys",
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
