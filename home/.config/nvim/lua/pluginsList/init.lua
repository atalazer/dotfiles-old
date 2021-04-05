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
        use({ "ayu-theme/ayu-vim" })                                    -- Ayu Colorscheme
        use({ "nekonako/xresources-nvim" })                             -- xresources-based Colorscheme

        -- vim-devicons written in lua
        use({ "kyazdani42/nvim-web-devicons", opt = true })

        -- snazzy bufferline
        use({ "akinsho/nvim-bufferline.lua", opt = true })

        -- Beautiful Statusline
        use({ "glepnir/galaxyline.nvim", branch = "main", opt = true })

        -- Startify
        use({ "mhinz/vim-startify", opt = true })

        -- Indenting
        use({ "glepnir/indent-guides.nvim", opt = true })

        -- Colorizer
        use({ "norcalli/nvim-colorizer.lua", opt = true })

        -- -------------------------------- LSP
        use({ "neovim/nvim-lspconfig", opt = true })
        use({ "glepnir/lspsaga.nvim", opt = true })
        use({ "onsails/lspkind-nvim", opt = true })
        use({ "stevearc/aerial.nvim", opt = true })

        -- ------------------------------- Completion and Snippet
        use({ "hrsh7th/nvim-compe",
            opt = true,
            requires = { "hrsh7th/vim-vsnip" },
        })

        -- ------------------------------- Languange

        -- Nvim Treesitter configurations and abstraction layer
        use({
            "nvim-treesitter/nvim-treesitter",
            requires = {
                { "windwp/nvim-ts-autotag" },
                { "code-biscuits/nvim-biscuits" },
            },
            opt = true,
            run = ":TSUpdate"
        })

        -- SQL Support
        use({ "tami5/sql.nvim", opt = false })

        -- Markdown Support
        use({ "plasticboy/vim-markdown",
            opt = true,
            ft = { "markdown" }
        })

        -- Markdown Previewer
        use({
            "npxbr/glow.nvim",
            run = ":GlowInstall",
            opt = true,
            ft = { "markdown" },
        })

        -- Free Distraction-mode
        use({
            "junegunn/goyo.vim",
            opt = true,
            ft = { "text", "markdown" }
        })

        -- ------------------------------ Experience

        -- Editor Config
        use({ "editorconfig/editorconfig-vim", opt = true })

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
        use({ "godlygeek/tabular" })

        -- gf like plugins
        use { "notomo/curstr.nvim"}

        -- Browser Integration plugin
        use({
            "glacambre/firenvim",
            opt = true,
            run = function()
                vim.fn["firenvim#install"](0)
            end,
        })

        -- ------------------------------- Files
         -- Fuzzy Finder
        use({
            "nvim-telescope/telescope.nvim",
            opt = false,
            requires = {
                {"nvim-lua/popup.nvim"},
                {"nvim-lua/plenary.nvim"},
                {"nvim-telescope/telescope-media-files.nvim"},
                {"nvim-telescope/telescope-fzy-native.nvim"},
                {"nvim-telescope/telescope-frecency.nvim"},
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

        -- -------------------------------- Git
        -- show git stuff in signcolumn
        use({ "lewis6991/gitsigns.nvim", opt = true })

        -- Magit for Neovim
        use { "TimUntersberger/neogit", opt = false }

        -- -------------------------------- Misc
        -- For keybindings
        use({ "tjdevries/astronauta.nvim", opt = false })

        -- Fade for unfocused window/buffer
        use({ "TaDaa/vimade", opt = true })

        -- Smooth Scrolling
        use({ "psliwka/vim-smoothie", opt = false })

        -- better window and buffer management
        use({ "mhinz/vim-sayonara", cmd = "Sayonara" })

        -- Which keys
        use({ "liuchengxu/vim-which-key", opt = true })

        -- Check startup time
        use({ "dstein64/vim-startuptime", opt = false })

    end

    packer.startup(plugins)
end
