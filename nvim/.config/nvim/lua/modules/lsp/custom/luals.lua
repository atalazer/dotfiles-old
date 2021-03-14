vim.cmd[[packadd nvim-lspconfig]]
local lspconfig = require("lspconfig")
local configs = require'lspconfig/configs'

configs.luals = {
  default_config = {
    cmd = {"lua-lsp"};
    filetypes = {'lua'};
    root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end;
    settings = {};
  };
}
