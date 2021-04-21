-- ==================================== Global settings
vim.g.mapleader = "."
vim.g.maplocalleader = ","

RC = {
    colorscheme    = "material",
    use_xresources = false,
    plug_enabled = {
        autotag  = true,
        biscuits = true,
    },
}

-- ==================================== neovim package manager
require("pluginsList.bootstrapping")
require("pluginsList.init")

-- ==================================== neovim basic configuration
require("base.settings")
require("base.events")
require("base.commands")

require("mappings.keys")
require("mappings.visual-multi")
require("plugins.which-key")
-- ==================================== UI Related
require("base.appearances")

require("plugins.devicons")
require("plugins.bufferline")
require("plugins.galaxyline")

require("plugins.colorizer")
require("plugins.indent-blankline")
-- require("plugins.indent-guides")

-- ==================================== File Related
require("plugins.suda")
require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.gitsigns")
require("plugins.neogit")

-- ==================================== Funcionality
require("plugins.autopairs")
require("plugins.firenvim")
require("plugins.hop")
require("plugins.kommentary")
require("plugins.surround")
require("plugins.curstr")

-- ==================================== Misc
-- require("plugins.neoscroll")
require("plugins.shade")
require("plugins.truezen")

-- ==================================== Language support
require("plugins.treesitter")
require("plugins.markdown")

-- ==================================== LSP, Code Completions, Code Formater
require("plugins.compe")
require("plugins.emmet")
require("plugins.vsnip")
require("plugins.format")
require("lsp")

