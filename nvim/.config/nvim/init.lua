vim.g.mapleader = "."
vim.g.maplocalleader = ","

-- ------------------------------------ neovim package manager
require("pluginsList.bootstrapping")
require("pluginsList.init")

-- ------------------------------------ neovim basic configuration
require("base.settings")
require("base.events")
require("base.commands")
require("mappings.keys")

-- ------------------------------------ File Related
require("plugins.nvim-tree")
require("plugins.suda")
require("plugins.telescope")

-- ------------------------------------ Funcionality
require("plugins.autopairs")
require("plugins.firenvim")
require("plugins.hop")
require("plugins.kommentary")
require("plugins.surround")

-- ------------------------------------ Language support
require("plugins.editorconfig")
require("plugins.markdown")
require("plugins.treesitter")

-- ------------------------------------ UI Related
require("base.appearances")
require("base.colorscheme.xresources")
require("base.colorscheme.transparancy")

require("plugins.devicons")
require("plugins.barbar")
-- require("plugins.bufferline")

require("plugins.galaxyline.aeroline")
require("plugins.galaxyline.real-round")
require("plugins.galaxyline.rounded")
require("plugins.galaxyline.zero")

require("plugins.colorizer")
require("plugins.indent-guides")
-- require('plugins.startify')
require("plugins.vimade")

-- ------------------------------------ Plugins Keys
require("mappings.pkeys")
require("mappings.togglebool")
require("mappings.visual-multi")
require("plugins.which-key")

-- ------------------------------------ LSP, Code Completions, Code Formater

require("plugins.compe")

require("plugins.vsnip")
require("plugins.format")
require("lsp")
