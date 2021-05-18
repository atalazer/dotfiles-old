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
                    width  = 0.80,
                    height = 0.80,
                    border = Util.border,
                })
            end,
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
            config = function()
                require("plugins.treesitter")
            end,
        })
        use({
            "code-biscuits/nvim-biscuits",
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

        -- Multi Cursor
        use({
            "mg979/vim-visual-multi",
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
            end,
        })

        -- Easy Commenting
        use({
            "tpope/vim-commentary",
            requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
        })

        -- Vim surround
        use({
            "blackcauldron7/surround.nvim",
            config = function()
                vim.g.surround_prefix = "s"
                vim.g.surround_mappings_style = "sandwich" -- "surround" or "sandwich"
                vim.g.surround_load_autogroups = true
                vim.g.surround_load_keymaps = true
                vim.g.surround_context_offset = 100
                vim.g.surround_quotes = { "'", "\"", "`" }
                vim.g.surround_brackets = { "(", "{", "[" }
                vim.g.surround_pairs = {
                    nestable = {
                        { "(", ")" },
                        { "[", "]" },
                        { "{", "}" },
                        { "<", ">" },
                    },
                    linear = {
                        { "'", "'" },
                        { "\"", "\"" },
                        { "`", "`" },
                    },
                }
                require("surround").setup({})
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

        -- Free Distraction-mode
        use({
            "folke/zen-mode.nvim",
            config = function()
                require("zen-mode").setup({
                    window = {
                        backdrop = 1.0,
                        width = 0.80,
                        height = 1.0,
                        options = {
                            signcolumn = "no",
                            foldcolumn = "0",
                        },
                    },
                })
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

        -- Browser Integration plugin
        use({
            "glacambre/firenvim",
            run = function()
                vim.fn["firenvim#install"](0)
            end,
            config = function()
                if vim.fn.exists("g:started_by_firenvim") == 1 then
                    vim.cmd([[set laststatus=0]])
                    vim.cmd([[set showtabline=0]])
                    vim.cmd([[set guifont=JetBrainsMono:h9]])
                end
                vim.g.firenvim_config = {
                    localSettings = {
                        [".*"] = {
                            takeover = "never",
                            priority = 1,
                        },
                    },
                }
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
                { "nvim-telescope/telescope-cheat.nvim" },
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

        -- Dims inactive windows
        use({
            "sunjon/shade.nvim",
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

        use({
            "kdav5758/NoCLC.nvim",
            config = function()
                require("no-clc").setup({
                    load_at_startup = true,
                    cursorline = true,
                    cursorcolumn = false,
                })
            end,
        })

        -- Highlight, list and search todo comments in your projects
        use({
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("todo-comments").setup({
                    signs = true,
                    keywords = {
                        FIX = { icon = " ", alt = { "FIXME", "BUG", "FIXIT", "FIX", "ISSUE" } },
                        TODO = { icon = " ", alt = { "TODOS", "TD" } },
                        WARN = { icon = " ", alt = { "WARNING", "XXX" } },
                        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                        NOTE = { icon = " ", alt = { "INFO" } },
                        HACK = { icon = " " },
                    },
                })
            end,
        })

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
        })

        -- vim which key
        use({
            "folke/which-key.nvim",
            config = function()
                require("plugins.which-key")
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
                vim.g.translator_window_borderchars = {
                    "─",
                    "│",
                    "─",
                    "│",
                    "┌",
                    "┐",
                    "┘",
                    "└",
                }
            end,
        })

        -- Session manager
        use({
            "rmagatti/session-lens",
            requires = {
                { "nvim-telescope/telescope.nvim" },
                { "nvim-lua/popup.nvim" },
                { "nvim-lua/plenary.nvim" },
                { "rmagatti/auto-session" },
            },
            opt = false,
            config = function()
                require("auto-session").setup({
                    auto_session_root_dir = os.getenv("HOME") .. "/.cache/nvim/sessions/",
                    auto_session_enable_last_session = false,
                    logLevel = "info",
                    pre_save_cmds = {},
                    post_save_cmds = {},
                    pre_restore_cmds = {},
                    post_restore_cmds = {},
                })
                require("telescope").load_extension("session-lens")
                require("telescope._extensions.session-lens").setup({
                    prompt_title = "Sessions List",
                    shorten_path = false,
                })
            end,
        })

        -- Check startup time
        use({ "tweekmonster/startuptime.vim" })
    end
    packer.startup(plugins)
end
