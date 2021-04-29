-- ==================================== Global settings
vim.g.mapleader = "."
vim.g.maplocalleader = ","

-- prevent typo when pressing `wq` or `q`
vim.cmd([[
  cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
  cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
  cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
  cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
]])

-- change cwd to current directory
vim.cmd("cd %:p:h")

RC = {
    colorscheme = "material",
    use_xresources = true,
    plug_enabled = {
        autotag = true,
        biscuits = true,
    },
}

-- ==================================== neovim package manager
pcall(require, "base.plugins")

-- ==================================== neovim basic configuration
pcall(require, "base.settings")
pcall(require, "base.events")
pcall(require, "base.commands")
pcall(require, "base.functions")

pcall(require, "mappings.keys")
pcall(require, "mappings.visual-multi")
pcall(require, "mappings.which-key")
-- ==================================== UI
pcall(require, "base.appearances")

pcall(require, "plugins.devicons")
pcall(require, "plugins.bufferline")
pcall(require, "plugins.galaxyline")

pcall(require, "plugins.colorizer")
pcall(require, "plugins.indent-blankline")

-- ==================================== Files
pcall(require, "plugins.nvim-tree")
pcall(require, "plugins.telescope")
pcall(require, "plugins.suda")
pcall(require, "plugins.session")

-- ==================================== Funcionality
pcall(require, "plugins.autopairs")
pcall(require, "plugins.hop")
pcall(require, "plugins.surround")
pcall(require, "plugins.dial")
pcall(require, "plugins.curstr")

-- ==================================== Git
pcall(require, "plugins.gitsigns")

-- ==================================== Misc
-- pcall(require, "plugins.shade")

pcall(require, "plugins.fterm")
pcall(require, "plugins.truezen")
pcall(require, "plugins.firenvim")

-- ==================================== Language support
pcall(require, "plugins.treesitter")
pcall(require, "plugins.markdown")

-- ==================================== LSP, Code Completions, Code Formater
pcall(require, "plugins.compe")
pcall(require, "plugins.emmet")
pcall(require, "plugins.vsnip")
pcall(require, "plugins.format")
pcall(require, "lsp")
