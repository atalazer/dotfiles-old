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
            clone_timeout = 300,
        },
        display = {
            -- open_cmd = "leftabove 60vnew [packer]",
            open_fn = function()
                return require("packer.util").float({
                    border = Util.border,
                })
            end,
        },
    })

    local plugins = function()
        -- ======= Base =======
        use({ "wbthomason/packer.nvim", opt = true })

        -- For keybindings
        use({ "tjdevries/astronauta.nvim" })

        -- ======= User Interface =======
        -- Colorscheme
        use({ "marko-cerovac/material.nvim", branch = "pure-lua", opt = false })
        use({ "nekonako/xresources-nvim", opt = false })

        -- vim-devicons written in lua
        use({
            "kyazdani42/nvim-web-devicons",
            opt = true,
            config = function()
                require("plugins.devicons")
            end,
        })

        -- snazzy bufferline
        use({
            "akinsho/nvim-bufferline.lua",
            requires = { "kyazdani42/nvim-web-devicons" },
            config = function()
                require("plugins.bufferline")
            end,
        })

        -- Beautiful Statusline
        use({
            "glepnir/galaxyline.nvim",
            branch = "main",
            requires = { "kyazdani42/nvim-web-devicons" },
            config = function()
                require("plugins.galaxyline")
            end,
        })

        -- ======= Languange =======
        -- Nvim Treesitter configurations and abstraction layer
        use({
            "nvim-treesitter/nvim-treesitter",
            requires = {
                { "windwp/nvim-ts-autotag" },
                { "JoosepAlviste/nvim-ts-context-commentstring" },
            },
            config = function()
                require("plugins.treesitter")
            end,
        })

        -- SQL Support
        use({ "tami5/sql.nvim" })

        -- Markdown Support
        use({
            "plasticboy/vim-markdown",
            opt = true,
            ft = { "markdown" },
            config = function()
                vim.g.vim_markdown_frontmatter = 1
            end,
        })

        -- VIM Table Mode for instant table creation.
        use({
            "dhruvasagar/vim-table-mode",
            ft = { "text", "markdown" },
            opt = true,
        })

        -- Terminal Markdown Previewer
        use({
            "npxbr/glow.nvim",
            branch = "main",
            opt = true,
            ft = "markdown",
            run = ":GlowInstall",
        })

        -- Hugo Helper
        use({
            "robertbasic/vim-hugo-helper",
        })

        -- Syntax for tridactyl
        use({
            "tridactyl/vim-tridactyl",
            opt = true,
            ft = { "tridactyl" },
        })

        use({ "editorconfig/editorconfig-vim", opt = false })

        -- ======= Experience =======
        -- Easy Commenting
        use({ "tpope/vim-commentary" })

        -- Align
        use({ "junegunn/vim-easy-align" })

        -- vim easy motion
        use({
            "phaazon/hop.nvim",
            opt = true,
            cmd = { "HopWord", "HopPattern" },
            config = function()
                require("hop").setup({})
            end,
        })

        -- sandwiched textobjects.
        use({ "machakann/vim-sandwich", opt = false })

        -- Code formatter
        use({
            "lukas-reineke/format.nvim",
            config = function()
                require("plugins.format")
            end,
        })

        -- Autopairs
        use({
            "windwp/nvim-autopairs",
            config = function()
                require("plugins.autopairs")
            end,
        })

        -- gf like plugins
        use({
            "notomo/curstr.nvim",
            config = function()
                require("plugins.curstr")
            end,
        })

        -- Increment and decrement
        use({
            "monaqa/dial.nvim",
            config = function()
                require("plugins.dial")
            end,
        })

        -- Indenting
        use({
            "lukas-reineke/indent-blankline.nvim",
            branch = "lua",
            config = function()
                require("plugins.indent-blankline")
            end,
        })

        -- Colorizer
        use({
            "norcalli/nvim-colorizer.lua",
            opt = true,
            ft = {
                "lua",
                "css",
                "scss",
                "html",
                "javascript",
                "typescript",
            },
            cmd = "ColorizerToggle",
            config = function()
                require("colorizer").setup({
                    ["*"] = {
                        css = true,
                        css_fn = true,
                        mode = "background",
                    },
                })
            end,
        })

        -- ======= LSP, Completion and Snippet =======
        use({
            "neovim/nvim-lspconfig",
            opt = true,
            requires = {
                { "glepnir/lspsaga.nvim", opt = true },
                { "onsails/lspkind-nvim", opt = true },
                { "folke/lsp-trouble.nvim", opt = true },
                { "folke/lsp-colors.nvim", opt = true },
                { "simrat39/symbols-outline.nvim", opt = true },
            },
        })

        use({
            "hrsh7th/nvim-compe",
            config = function()
                require("plugins.compe")
            end,
        })

        use({
            "hrsh7th/vim-vsnip",
            requires = {
                { "rafamadriz/friendly-snippets" },
            },
            config = function()
                require("plugins.vsnip")
            end,
        })

        -- Emmet Support for vim
        use({
            "mattn/emmet-vim",
            opt = true,
            ft = { "html" },
            config = function()
                require("plugins.emmet")
            end,
        })

        -- ======= Files =======
        -- Fuzzy Finder
        use({
            "nvim-telescope/telescope.nvim",
            requires = {
                { "nvim-lua/popup.nvim" },
                { "nvim-lua/plenary.nvim" },
                { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
                { "nvim-telescope/telescope-media-files.nvim" },
                { "nvim-telescope/telescope-frecency.nvim" },
            },
            config = function()
                require("plugins.telescope")
            end,
        })

        -- Superfast Tree File
        use({
            "kyazdani42/nvim-tree.lua",
            config = function()
                require("plugins.nvim-tree")
            end,
        })

        -- Open root previllage files
        use({
            "lambdalisue/suda.vim",
            opt = true,
            cmd = { "SudaRead", "SudaWrite" },
            config = function()
                vim.g.suda_smart_edit = 1
                vim.g["suda#prompt"] = "Password : "
            end,
        })

        -- ======= Git =======
        -- show git stuff in signcolumn
        use({
            "lewis6991/gitsigns.nvim",
            config = function()
                require("plugins.gitsigns")
            end,
        })

        -- ======= Misc =======
        -- Smooth Scrolling
        use({
            "psliwka/vim-smoothie",
            config = function()
                -- Vim Smoothie
                vim.g.smoothie_enabled = 1
                vim.g.smoothie_update_interval = 30
                vim.g.smoothie_speed_constant_factor = 10
                vim.g.smoothie_speed_linear_factor = 10
            end,
        })

        -- better window and buffer management
        use({
            "mhinz/vim-sayonara",
            cmd = "Sayonara",
            opt = true,
        })

        -- Highlight, list and search todo comments in your projects
        use({
            "folke/todo-comments.nvim",
            config = function()
                require("plugins.todo")
            end,
        })

        -- vim which key
        use({
            "folke/which-key.nvim",
            config = function()
                require("plugins.which-key")
            end,
        })

        -- Better Terminal for Neovim
        use({
            "numtostr/FTerm.nvim",
            opt = false,
            config = function()
                require("plugins.fterm")
            end,
        })

        -- Check startup time
        use({
            "tweekmonster/startuptime.vim",
            opt = true,
            cmd = "StartupTime",
        })
    end
    packer.startup(plugins)
end
