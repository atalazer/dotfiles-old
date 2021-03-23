vim.cmd("packadd packer.nvim")
local ok, packer = pcall(require, "packer")

if ok then
    local use = packer.use
    packer.init({
        git = {
            clone_timeout = 120, -- Timeout, in seconds, for git clones
        },
        display = {
            open_cmd = "leftabove 70vnew [packer]",
            -- open_cmd = "80vnew [packer]",
        },
    })

    local plugins = function()
        use({ "wbthomason/packer.nvim", opt = true })

        -- ------------------------------- UI Related
        use({ "ayu-theme/ayu-vim" }) -- Ayu Colorscheme
        use({ "nekonako/xresources-nvim" }) -- xresources-based Colorscheme

        use({ "kyazdani42/nvim-web-devicons", opt = true }) -- vim-devicons written in lua
        use({ "romgrk/barbar.nvim", opt = true }) -- Beautiful Tabline
        use({ "akinsho/nvim-bufferline.lua", opt = true }) -- snazzy bufferline
        use({ "glepnir/galaxyline.nvim", branch = "main", opt = true }) -- Beautiful Statusline
        use({ "mhinz/vim-startify", opt = true }) -- Startify
        use({ "glepnir/indent-guides.nvim", opt = true }) -- Indenting
        use({ "norcalli/nvim-colorizer.lua", opt = true }) -- Colorizer

        -- -------------------------------- LSP
        use({ "neovim/nvim-lspconfig", opt = true })
        use({ "glepnir/lspsaga.nvim", opt = true })
        use({ "onsails/lspkind-nvim", opt = true })
        use({ "stevearc/aerial.nvim", opt = true })

        -- ------------------------------- Completion and Snippet
        use({
            "hrsh7th/nvim-compe",
            opt = true,
            requires = { "hrsh7th/vim-vsnip", "hrsh7th/vim-vsnip-integ" },
        }) -- Code Completion

        -- ------------------------------- Languange
        use({ "nvim-treesitter/nvim-treesitter", opt = true, run = ":TSUpdate" }) -- Semantic Highlighting
        use({ "tami5/sql.nvim", opt = false }) -- SQL Languange Support
        use({ "plasticboy/vim-markdown", opt = true, ft = { "markdown" } }) -- Markdown Languange Support
        use({
            "iamcco/markdown-preview.nvim",
            opt = true,
            ft = { "markdown" },
            run = "cd app && yarn install",
            cmd = "MarkdownPreview",
        })
        use({ "npxbr/glow.nvim", run = ":GlowInstall" })
        use({ "junegunn/goyo.vim", opt = true, ft = { "text", "markdown" } }) -- Free Distraction-mode

        -- ------------------------------ Experience
        use({ "editorconfig/editorconfig-vim", opt = true })
        use({ "mattn/emmet-vim", opt = false }) -- Emmet Support for vim
        use({ "windwp/nvim-autopairs", opt = true }) -- Autopairs
        use({ "windwp/nvim-ts-autotag", opt = true }) -- Auto-close tag
        use({ "mg979/vim-visual-multi", opt = false }) -- Multi Cursor
        use({ "phaazon/hop.nvim", opt = false }) -- vim easy motion
        use({ "b3nj5m1n/kommentary", opt = false }) -- Eassy Commenting
        use({ "blackcauldron7/surround.nvim", opt = false }) -- Vim surround
        use({ "lukas-reineke/format.nvim", opt = true }) -- Code formatter

        use({ "godlygeek/tabular" }) -- Align
        use({ "sagarrakshe/toggle-bool", opt = true }) -- Quick toggle boolean value

        use({
            "glacambre/firenvim",
            opt = true,
            run = function()
                vim.fn["firenvim#install"](0)
            end,
        }) -- Browser Integration plugin

        -- ------------------------------- Files
        use({ "kyazdani42/nvim-tree.lua", opt = true }) -- Superfast Tree File
        use({
            "nvim-telescope/telescope.nvim",
            opt = false,
            requires = {
                "nvim-lua/popup.nvim",
                "nvim-lua/plenary.nvim",
                "nvim-telescope/telescope-media-files.nvim",
                "nvim-telescope/telescope-fzy-native.nvim",
                "nvim-telescope/telescope-frecency.nvim",
            },
        }) -- Fuzzy Finder
        use({ "lambdalisue/suda.vim", opt = true }) -- Open root previllage files

        -- -------------------------------- Git
        use({ "tpope/vim-fugitive", opt = false }) -- git helpers inside neovim
        use({ "lewis6991/gitsigns.nvim", opt = true }) -- show git stuff in signcolumn

        -- -------------------------------- Misc
        use({ "tjdevries/astronauta.nvim", opt = false }) -- For keybindings
        use({ "TaDaa/vimade", opt = true }) -- Fade for unfocused window/buffer
        use({ "psliwka/vim-smoothie", opt = false }) -- Smooth Scrolling
        use({ "mhinz/vim-sayonara", cmd = "Sayonara" }) -- better window and buffer management
        use({ "dstein64/vim-startuptime", opt = false }) -- Check startup time
        use({ "liuchengxu/vim-which-key", opt = true }) -- Whick keys

    end

    packer.startup(plugins)
end
