vim.cmd("packadd packer.nvim")

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    vim.cmd("packadd packer.nvim")
end

local ok, packer = pcall(require, "packer")

if ok then
    local use = packer.use
    packer.init({
        git = {
            clone_timeout = 180, -- Timeout, in seconds, for git clones
        },
        display = {
            open_cmd = "leftabove 60vnew [packer]",
            -- open_cmd = "80vnew [packer]",
        },
        profile = {
            enable = false,
            threshold = 1,
        },
    })

    local plugins = function()
        use({ "wbthomason/packer.nvim", opt = true })

        -- ================================== UI Related
        -- Colorscheme
        use({ "tjdevries/colorbuddy.nvim", opt = true })
        use({ "marko-cerovac/material.nvim", opt = true })
        use({ "nekonako/xresources-nvim", opt = true })

        -- vim-devicons written in lua
        use({ "kyazdani42/nvim-web-devicons", opt = true })

        -- snazzy bufferline
        use({ "akinsho/nvim-bufferline.lua", opt = true })

        -- Beautiful Statusline
        use({
            "glepnir/galaxyline.nvim",
            branch = "main",
            opt = true,
        })

        -- Indenting
        use({ "lukas-reineke/indent-blankline.nvim", branch = "lua", opt = true })

        -- Colorizer
        use({ "norcalli/nvim-colorizer.lua", opt = true })

        use({ "edluffy/specs.nvim", opt = true })

        -- ================================== LSP, Completion and Snippet
        use({ "neovim/nvim-lspconfig", opt = true })
        use({ "glepnir/lspsaga.nvim", opt = true })
        use({ "onsails/lspkind-nvim", opt = true })
        use({ "folke/lsp-trouble.nvim", opt = true })

        use({
            "hrsh7th/nvim-compe",
            opt = true,
        })

        use({
            "hrsh7th/vim-vsnip",
            opt = true,
            requires = {
                { "hrsh7th/vim-vsnip-integ" },
                { "rafamadriz/friendly-snippets" },
            },
        })

        -- ================================== Languange

        -- Nvim Treesitter configurations and abstraction layer
        use({
            "nvim-treesitter/nvim-treesitter",
            requires = {
                { "windwp/nvim-ts-autotag", opt = true },
                { "code-biscuits/nvim-biscuits", opt = true },
                { "JoosepAlviste/nvim-ts-context-commentstring", opt = true },
                { "theHamsta/nvim-treesitter-pairs" },
            },
            opt = true,
        })

        -- SQL Support
        use({ "tami5/sql.nvim", opt = false })

        -- Markdown Support
        use({
            "plasticboy/vim-markdown",
            opt = true,
            ft = { "markdown" },
        })

        -- VIM Table Mode for instant table creation.
        use({
            "dhruvasagar/vim-table-mode",
            ft = { "text", "markdown" },
            opt = true,
        })

        -- VIM Table Align
        use({
            "godlygeek/tabular",
            ft = { "text", "markdown" },
            opt = true,
        })

        -- Terminal Markdown Previewer
        use({
            "npxbr/glow.nvim",
            run = ":GlowInstall",
            opt = true,
            ft = { "markdown" },
        })

        -- Free Distraction-mode
        use({
            "kdav5758/TrueZen.nvim",
            opt = true,
            ft = { "text", "markdown" },
        })

        -- Syntax for tridactyl
        use({
            "tridactyl/vim-tridactyl",
            opt = true,
            ft = { "tridactyl" },
        })

        -- ================================== Experience

        -- Emmet Support for vim
        use({ "mattn/emmet-vim", opt = false })

        -- Code formatter
        use({ "lukas-reineke/format.nvim", opt = false })

        -- Autopairs
        use({ "windwp/nvim-autopairs", opt = true })

        -- Multi Cursor
        use({ "mg979/vim-visual-multi", opt = false })

        -- vim easy motion
        use({ "phaazon/hop.nvim", opt = false })

        -- Easy Commenting
        use({ "b3nj5m1n/kommentary", opt = false })

        -- Vim surround
        use({ "blackcauldron7/surround.nvim", opt = false })

        -- Align
        use({ "junegunn/vim-easy-align" })

        -- gf like plugins
        use({ "notomo/curstr.nvim" })

        use({ "monaqa/dial.nvim", opt = true })
        -- Browser Integration plugin
        use({
            "glacambre/firenvim",
            opt = true,
            run = function()
                vim.fn["firenvim#install"](0)
            end,
        })

        -- ================================= Files
        -- Fuzzy Finder
        use({
            "nvim-telescope/telescope.nvim",
            opt = false,
            requires = {
                { "nvim-lua/popup.nvim" },
                { "nvim-lua/plenary.nvim" },
                { "nvim-telescope/telescope-media-files.nvim" },
                { "nvim-telescope/telescope-fzy-native.nvim" },
                { "nvim-telescope/telescope-frecency.nvim" },
                {
                    "nvim-telescope/telescope-arecibo.nvim",
                    rocks = { "openssl", "lua-http-parser" },
                },
            },
        })

        -- Superfast Tree File
        use({ "kyazdani42/nvim-tree.lua", opt = true })

        -- Open root previllage files
        use({ "lambdalisue/suda.vim", opt = true })

        -- ====================================== Git
        -- show git stuff in signcolumn
        use({ "lewis6991/gitsigns.nvim", opt = true })

        -- Magit for Neovim
        use({ "TimUntersberger/neogit", opt = false })

        -- ====================================== Misc
        -- For keybindings
        use({ "tjdevries/astronauta.nvim", opt = false })

        -- Dims inactive windows
        use({ "sunjon/shade.nvim", opt = true })

        -- Smooth Scrolling
        use({ "psliwka/vim-smoothie", opt = false })

        -- better window and buffer management
        use({ "mhinz/vim-sayonara", cmd = "Sayonara" })

        -- vim which key
        use({
            "AckslD/nvim-whichkey-setup.lua",
            opt = true,
            requires = { "liuchengxu/vim-which-key" },
        })

        -- Check startup time
        use({ "dstein64/vim-startuptime", opt = false })
    end

    packer.startup(plugins)
end
