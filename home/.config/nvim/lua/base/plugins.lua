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
            enable = true,
            threshold = 1,
        },
    })

    local plugins = function()
        -- ======= Base =======
        use({ "wbthomason/packer.nvim", opt = true })

        -- For keybindings
        use({
            "tjdevries/astronauta.nvim",
            opt = false,
        })

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
            opt = false,
            config = function()
                require("plugins.bufferline")
            end,
        })

        -- Beautiful Statusline
        use({
            "glepnir/galaxyline.nvim",
            branch = "main",
            requires = { "kyazdani42/nvim-web-devicons" },
            opt = false,
            config = function()
                require("plugins.galaxyline")
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
            opt = false,
            config = function()
                require("plugins.compe")
            end,
        })

        use({
            "hrsh7th/vim-vsnip",
            opt = false,
            requires = {
                { "hrsh7th/vim-vsnip-integ" },
                { "rafamadriz/friendly-snippets" },
            },
            config = function()
                require("plugins.vsnip")
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
            opt = false,
            config = function()
                require("plugins.treesitter")
            end,
        })
        use({
            "code-biscuits/nvim-biscuits",
            opt = false,
            config = function()
                require("nvim-biscuits").setup({
                    default_config = {
                        max_length = 30,
                        min_destance = 5,
                        prefix_string = " // ",
                        on_events = { "InsertLeave", "CursorHoldI" },
                    },
                })
                vim.cmd([[
                highlight link BiscuitColor Comment
                highlight BiscuitColorRust ctermfg=red
                ]])
            end,
        })

        -- SQL Support
        use({
            "tami5/sql.nvim",
            opt = false,
        })

        -- Markdown Support
        use({
            "plasticboy/vim-markdown",
            opt = true,
            ft = { "markdown" },
            config = function()
                require("plugins.markdown")
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
            run = ":GlowInstall",
        })
        -- Syntax for tridactyl
        use({
            "tridactyl/vim-tridactyl",
            opt = true,
            ft = { "tridactyl" },
        })

        -- ======= Experience =======
        -- Emmet Support for vim
        use({
            "mattn/emmet-vim",
            opt = true,
            ft = { "html" },
            config = function()
                require("plugins.emmet")
            end,
        })

        -- Code formatter
        use({
            "lukas-reineke/format.nvim",
            opt = false,
            config = function()
                require("plugins.format")
            end,
        })

        -- Autopairs
        use({
            "windwp/nvim-autopairs",
            opt = false,
            config = function()
                require("plugins.autopairs")
            end,
        })

        -- Multi Cursor
        use({
            "mg979/vim-visual-multi",
            opt = false,
            config = function()
                require("plugins.visual-multi")
            end,
        })

        -- vim easy motion
        use({
            "phaazon/hop.nvim",
            opt = false,
            config = function()
                require("hop").setup({
                    keys = "qwertyuipasdfghklzxcvbm",
                    term_seq_bias = 0.5,
                })
                vim.api.nvim_set_keymap("", "<space>z", ":HopChar1<CR>", {})
                vim.api.nvim_set_keymap("", "<space>x", ":HopChar2<CR>", {})
                vim.api.nvim_set_keymap("", "<space>n", ":HopPattern<CR>", {})
                vim.api.nvim_set_keymap("", "<space>l", ":HopLine<CR>", {})
            end,
        })

        -- Easy Commenting
        use({
            "tpope/vim-commentary",
            opt = false,
            config = function()
            end,
        })

        -- Vim surround
        use({
            "blackcauldron7/surround.nvim",
            opt = false,
            config = function()
                require("plugins.surround")
            end,
        })

        -- Align
        use({
            "junegunn/vim-easy-align",
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
            opt = false,
            config = function()
                require("plugins.dial")
            end,
        })

        -- Indenting
        use({
            "lukas-reineke/indent-blankline.nvim",
            branch = "lua",
            opt = false,
            config = function()
                require("plugins.indent-blankline")
            end,
        })

        -- Free Distraction-mode
        use({
            "kdav5758/TrueZen.nvim",
            opt = false,
            config = function()
                require("plugins.truezen")
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

        -- Find the enemy and replace them with dark power.
        use({
            "windwp/nvim-spectre",
            opt = false,
        })

        -- Browser Integration plugin
        use({
            "glacambre/firenvim",
            opt = false,
            run = function()
                vim.fn["firenvim#install"](0)
            end,
            config = function()
                require("plugins.firenvim")
            end,
        })

        -- ======= Files =======
        -- Fuzzy Finder
        use({
            "nvim-telescope/telescope.nvim",
            requires = {
                { "nvim-lua/popup.nvim" },
                { "nvim-lua/plenary.nvim" },
                { "nvim-telescope/telescope-fzy-native.nvim" },
                { "nvim-telescope/telescope-media-files.nvim" },
                { "nvim-telescope/telescope-frecency.nvim" },
            },
            opt = false,
            config = function()
                require("plugins.telescope")
            end,
        })

        -- Superfast Tree File
        use({
            "kyazdani42/nvim-tree.lua",
            opt = false,
            config = function()
                require("plugins.nvim-tree")
            end,
        })

        -- Open root previllage files
        use({
            "lambdalisue/suda.vim",
            opt = false,
            config = function()
                vim.g.suda_smart_edit = 1
                vim.g["suda#prompt"] = "Password : "
            end,
        })

        -- ======= Git =======
        -- show git stuff in signcolumn
        use({
            "lewis6991/gitsigns.nvim",
            opt = false,
            config = function()
                require("plugins.gitsigns")
            end,
        })

        -- ======= Misc =======
        -- Colorizer
        use({
            "norcalli/nvim-colorizer.lua",
            opt = false,
            config = function()
                require("colorizer").setup({
                    ["*"] = {
                        css = true,
                        css_fn = true,
                        mode = "background",
                    },
                })
                vim.api.nvim_set_keymap("n", "<leader>cc", ":ColorizerToggle<CR>", { noremap = true })
                vim.api.nvim_set_keymap(
                    "n",
                    "<leader>cd",
                    ":ColorizerDetachFromBuffer<CR>",
                    { noremap = true }
                )
                vim.api.nvim_set_keymap(
                    "n",
                    "<leader>ca",
                    ":ColorizerAttachToBuffer<CR>",
                    { noremap = true }
                )
                vim.api.nvim_set_keymap(
                    "n",
                    "<leader>cr",
                    ":ColorizerReloadAllBuffers<CR>",
                    { noremap = true }
                )
            end,
        })

        -- Dims inactive windows
        use({
            "sunjon/shade.nvim",
            opt = false,
            config = function()
                require("shade").setup({
                    overlay_opacity = 60,
                    opacity_step = 2,
                    keys = {
                        brightness_up = "bb",
                        brightness_down = "B",
                        toggle = "<Leader>s",
                    },
                })
            end,
        })

        -- Smooth Scrolling
        use({
            "psliwka/vim-smoothie",
            opt = false,
            config = function()
                -- Vim Smoothie
                vim.g.smoothie_enabled = 1
                vim.g.smoothie_update_interval = 25
                vim.g.smoothie_speed_constant_factor = 5
                vim.g.smoothie_speed_linear_factor = 5
                vim.g.smoothie_no_default_mappings = 1
                vim.api.nvim_set_keymap("", "C-D", "<Plug>(SmoothieDownwards)", {})
                vim.api.nvim_set_keymap("", "C-U", "<Plug>(SmoothieUpwards)", {})
                vim.api.nvim_set_keymap("", "J", "<Plug>(SmoothieDownwards)", {})
                vim.api.nvim_set_keymap("", "K", "<Plug>(SmoothieUpwards)", {})
                vim.api.nvim_set_keymap("", "<S-Down>", "<Plug>(SmoothieDownwards)", {})
                vim.api.nvim_set_keymap("", "<S-Up>", "<Plug>(SmoothieUpwards)", {})
                vim.api.nvim_set_keymap("", "<PageDown>", "<Plug>(SmoothieForwards)", {})
                vim.api.nvim_set_keymap("", "<PageUp>", "<Plug>(SmoothieBackwards)", {})
            end,
        })

        -- better window and buffer management
        use({
            "mhinz/vim-sayonara",
            cmd = "Sayonara",
        })

        -- vim which key
        use({
            "folke/which-key.nvim",
            opt = false,
            config = function()
                require("which-key").setup({
                    plugins = {
                        marks = true, -- shows a list of your marks on ' and `
                        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                    },
                    presets = {
                        operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                        motions = true, -- adds help for motions
                        text_objects = true, -- help for text objects triggered after entering an operator
                        windows = true, -- default bindings on <c-w>
                        nav = true, -- misc bindings to work with windows
                        z = true, -- bindings for folds, spelling and others prefixed with z
                        g = true, -- bindings for prefixed with g
                    },
                })
            end,
        })

        -- Translator
        use({
            "voldikss/vim-translator",
            opt = false,
            config = function()
                vim.g.translator_target_lang = "id"
                vim.g.translator_source_lang = "auto"
                vim.g.translator_default_engines = "google"
                vim.g.translator_history_enable = true
                vim.g.translator_window_type = "popup"
                vim.g.translator_window_max_width = 0.6
                vim.g.translator_window_max_height = 0.6
                vim.g.translator_window_borderchars =
                    { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
            end,
        })

        -- Session manager
        use({
            "rmagatti/session-lens",
            requires = {
                { "nvim-lua/popup.nvim" },
                { "nvim-lua/plenary.nvim" },
                { "rmagatti/auto-session" },
            },
            opt = false,
            config = function()
                require("plugins.session")
            end,
        })

        -- Check startup time
        use({ "tweekmonster/startuptime.vim" })

    end
    packer.startup(plugins)
end
