vim.g.mapleader = "."
vim.g.maplocalleader = ","

-- ------------------------------------ neovim package manager
require("modules.packer.bootstrapping")
require("modules.packer.init")

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
require('plugins.firenvim')
require("plugins.hop")
require("plugins.kommentary")
require("plugins.surround")

-- ------------------------------------ Language support
-- require("plugins.editorconfig")
-- require("plugins.markdown")
require("plugins.treesitter")

-- ------------------------------------ UI Related
require("base.appearances")
require("colorscheme.xresources")
require("colorscheme.transparancy")

require('plugins.barbar')
-- require("plugins.bufferline")

-- require('plugins.neoline')
-- require('galaxyline.aeroline')
-- require('galaxyline.real-round')
-- require('galaxyline.rounded')
require("galaxyline.zero")

require("plugins.colorizer")
require("plugins.indent-blankline")
-- require("plugins.indent-guides")
require('plugins.startify')
require("plugins.vimade")

-- ------------------------------------ Plugins Keys
require("mappings.pkeys")
require("mappings.togglebool")
require("mappings.visual-multi")
require("plugins.which-key")

-- ------------------------------------ LSP, Code Completions, Code Formater

require("plugins.compe")
-- require('plugins.completion')

require("plugins.vsnip")
require("plugins.format")
require("modules.lsp")

-- Garbage collection
-- Enable for lower memory consumption
-- ===================================================================
collectgarbage("setpause", 100)
collectgarbage("setstepmul", 1000)
