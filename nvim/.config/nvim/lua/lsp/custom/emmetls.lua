vim.cmd[[packadd nvim-lspconfig]]
local configs = require'lspconfig/configs'

configs.emmetls = {
  default_config = {
    cmd = {'emmet-ls', '--stdio'};
    filetypes = {'html', 'css'};
    root_dir = function()
      return vim.loop.cwd()
    end;
    settings = {};
  };
}

