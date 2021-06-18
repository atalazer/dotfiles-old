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
        transitive_opt = false,
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

        -- SQLite/LuaJIT binding for lua and neovim
        use({ "tami5/sql.nvim" })

        -- ======= User Interface =======
        -- Colorscheme
        use({ "nekonako/xresources-nvim", opt = false })

        -- vim-devicons written in lua
        use({
            "kyazdani42/nvim-web-devicons",
            opt = true,
            requires = { "yamatsum/nvim-nonicons" },
        })

        -- snazzy bufferline
        use({
            "akinsho/nvim-bufferline.lua",
            config = function()
                require("plugins.bufferline")
            end,
        })

        -- Beautiful Statusline
        use({
            "windwp/windline.nvim",
            config = function()
                require("wlsample.evil_line")
            end
        })

        -- ======= Experience =======
        -- Easy Commenting
        use({ "tpope/vim-commentary" })

        -- Align
        use({ "junegunn/vim-easy-align" })

        -- Vim easy motion
        use({
            "phaazon/hop.nvim",
            opt = true,
            cmd = { "HopWord", "HopPattern" },
            config = function()
                require("hop").setup({})
            end,
        })

        -- Sandwiched textobjects.
        use({ "machakann/vim-sandwich", opt = false })

        -- Highlight, Navigate, and Operate on sets of matching text
        use({
            "andymass/vim-matchup",
            opt = false,
            config = function()
                vim.g.matchup_matchparen_offscreen = { method = "popup" }
            end,
        })

        -- Code formatter
        use({
            "lukas-reineke/format.nvim",
            config = function()
                require("plugins.format")
            end,
        })

        -- gf like plugins
        use({
            "notomo/curstr.nvim",
            config = function()
                require("plugins.curstr")
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

        -- Neovim Autopair Plugin
        use({
            "windwp/nvim-autopairs",
            opt = false,
            config = function()
                require("plugins.autopairs")
            end
        })

        -- Colorizer
        use({
            "norcalli/nvim-colorizer.lua",
            opt = false,
            config = function()
                require("colorizer").setup({
                    ["*"] = {
                        names    = false,
                        RGB      = true,
                        RRGGBB   = true,
                        RRGGBBAA = true,
                        rgb_fn   = true,
                        hsl_fn   = true,
                        css      = true,
                        css_fn   = true,
                        mode = "background",
                    },
                    css = { names = true },
                    html = { names = true }
                })
            end,
        })

        -- ======= Languange =======
        -- Nvim Treesitter configurations and abstraction layer
        use({
            "nvim-treesitter/nvim-treesitter",
            requires = {
                { "nvim-treesitter/nvim-treesitter-textobjects" },
                { "nvim-treesitter/playground" },
                { "nvim-treesitter/nvim-treesitter-refactor" },
                { "windwp/nvim-ts-autotag" },
                { "JoosepAlviste/nvim-ts-context-commentstring" },
            },
            config = function()
                require("plugins.treesitter")
            end,
        })

        -- LaTeX Support with Texlab LSP
        use({
            "jakewvincent/texmagic.nvim",
            opt = true,
            ft = { "tex", "bib" },
            config = function()
                vim.g["tex_flavor"] = "latex"
                require("texmagic").setup({
                    engines = {
                        pdflatex = {
                            executable = "latexmk",
                            args = {
                                "-pdflatex",
                                "-interaction=nonstopmode",
                                "-synctex=1",
                                "-pv",
                                "%f"
                            },
                            isContinuous = false
                        },
                    }
                })
            end
        })

        -- Markdown Support
        use({
            "plasticboy/vim-markdown",
            opt = true,
            ft = { "markdown" },
            config = function()
                vim.g.vim_markdown_auto_insert_bullets = 0
                vim.g.vim_markdown_conceal = 0
                vim.g.vim_markdown_edit_url_in = "tab"
                vim.g.vim_markdown_folding_disabled = 1
                vim.g.vim_markdown_folding_level = 6
                vim.g.vim_markdown_follow_anchor = 1
                vim.g.vim_markdown_frontmatter = 1
                vim.g.vim_markdown_json_frontmatter = 1
                vim.g.vim_markdown_math = 1
                vim.g.vim_markdown_new_list_item_indent = 2
                vim.g.vim_markdown_no_extensions_in_markdown = 1
                vim.g.vim_markdown_strikethrough = 1
                vim.g.vim_markdown_toc_autofit = 1
                vim.g.vim_markdown_toml_frontmatter = 1
                vim.g.vim_markdown_fenced_languages = { "csharp = cs", "c++=cpp", "viml=vim", "bash=sh", "ini=dosini" }
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

        -- Markdown Previewer
        use({
            "iamcco/markdown-preview.nvim",
            run = "cd app && npm install",
            ft = { "markdown" },
            config = function()
                vim.g.mkdp_auto_start = 0
                vim.g.mkdp_auto_close = 0
                vim.g.mkdp_refresh_slow = 0
                vim.g.mkdp_browser = "firefox"
            end
        })

        use({ "editorconfig/editorconfig-vim", opt = false })

        -- ======= LSP, Completion and Snippet =======
        use({
            "neovim/nvim-lspconfig",
            opt = false,
            requires = {
                { "onsails/lspkind-nvim" },
                { "glepnir/lspsaga.nvim" },
                { "ray-x/lsp_signature.nvim" },
                { "folke/lsp-trouble.nvim" },
                { "simrat39/symbols-outline.nvim" },
            },
        })

        use({
            "jose-elias-alvarez/null-ls.nvim",
            opt = false,
            config = function()
                require("null-ls").setup({})
            end,
        })

        use({
            "steelsojka/headwind.nvim",
            opt = true,
            ft = { "html" },
            config = function()
                require("headwind").setup {
                    remove_duplicates = true,
                    run_on_save = true,
                    prepend_custom_classes = false,
                    use_treesitter = true,
                }
            end
        })

        use({
            "hrsh7th/nvim-compe",
            config = function()
                require("plugins.compe")
            end,
        })

        use({ "rafamadriz/friendly-snippets" })
        use({
            "hrsh7th/vim-vsnip",
            config = function()
                require("plugins.vsnip")
            end,
        })

        -- Emmet Support for vim
        use({
            "mattn/emmet-vim",
            opt = false,
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

        use({
            "kdheepak/lazygit.nvim",
            config = function()
                vim.g.lazygit_floating_window_winblend = 0
                vim.g.lazygit_floating_window_scaling_factor = 0.80
                vim.g.lazygit_floating_window_corner_chars = { "╭", "╮", "╰", "╯" }
                vim.g.lazygit_floating_window_use_plenary = 0
                vim.g.lazygit_use_neovim_remote = 0
            end
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

        -- Free Distraction Mode
        use({
            "junegunn/goyo.vim",
            opt = true,
            cmd = "Goyo",
            requires = {{"junegunn/limelight.vim", opt = true, cmd = "Limelight" }},
            config = function()
                vim.g.goyo_width = "120"
                vim.g.goyo_height = "90%"
                vim.cmd([[
                    autocmd! User GoyoEnter Limelight
                    autocmd! User GoyoLeave Limelight!
                ]])
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
