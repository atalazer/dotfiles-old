vim.g.mapleader = "."
vim.g.maplocalleader = ","
vim.cmd([[cd %:p:h]])

-- ==================================== neovim package manager
require("pluginsList.bootstrapping")
require("pluginsList.init")

-- ==================================== neovim basic configuration
require("base.settings")
require("base.events")
require("base.commands")
require("mappings.keys")

-- ==================================== UI Related
require("base.appearances")
-- require("base.colorscheme.transparancy")

require("plugins.devicons")
require("plugins.bufferline")

-- require("plugins.galaxyline.aeroline")
-- require("plugins.galaxyline.real-round")
-- require("plugins.galaxyline.rounded")
require("plugins.galaxyline.zero")

require("plugins.colorizer")
require("plugins.indent-guides")
-- require('plugins.startify')
require("plugins.vimade")

-- ==================================== File Related
require("plugins.suda")
require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.gitsigns")
require("plugins.neogit")

-- ==================================== Funcionality
require("plugins.autopairs")
require("plugins.editorconfig")
require("plugins.firenvim")
require("plugins.hop")
require("plugins.kommentary")
require("plugins.surround")
require("plugins.curstr")

-- ==================================== Language support
require("plugins.markdown")
require("plugins.treesitter")

-- ==================================== Plugins Keys
require("mappings.pkeys")
require("mappings.visual-multi")
require("plugins.which-key")

-- -=================================== LSP, Code Completions, Code Formater
require("plugins.compe")
require("plugins.emmet")
require("plugins.vsnip")
require("plugins.format")
require("lsp")
