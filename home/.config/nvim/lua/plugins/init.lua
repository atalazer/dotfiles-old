local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
    return
end

return packer.startup({
    {
        {
            "wbthomason/packer.nvim",
            opt = true,
            setup = function()
                local map = function(lhs, rhs)
                    vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = false })
                end
                map("<Leader>pi", ":PackerInstall<CR>")
                map("<Leader>pd", ":PackerClean<CR>")
                map("<Leader>pu", ":PackerUpdate<CR>")
                map("<Leader>pc", ":PackerCompile<CR>")
                map("<Leader>ps", ":PackerSync<CR>")
                map("<Leader>pp", ":PackerCompile profile=true<CR>:PackerProfile<CR>")
            end,
        },
        {
            "lewis6991/impatient.nvim",
            rocks = "mpack",
        },

        {
            "nvim-lua/popup.nvim",
            module = "popup",
        },
        {
            "nvim-lua/plenary.nvim",
            module = "plenary",
        },

        {
            "rcarriga/nvim-notify",
            config = function()
                local notify = require("notify")
                notify.setup({
                    stages = "fade",
                    timeout = 2500,
                    background_colour = "#161822",
                })
                vim.notify = notify
            end,
        },

        -- ======= User Interface =======
        -- Colorscheme
        {
            -- "nekonako/xresources-nvim",
            "~/Documents/GitHub/xresources-nvim",
            event = "VimEnter",
            requires = {
                {
                    "folke/tokyonight.nvim",
                    setup = function()
                        vim.g.tokyonight_style = "storm"
                        vim.g.tokyonight_terminal_colors = true
                        vim.g.tokyonight_italic_comments = true
                        vim.g.tokyonight_italic_keywords = true
                        vim.g.tokyonight_italic_functions = true
                        vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "NvimTree" }
                    end,
                },
            },
            setup = function()
                vim.g.xresources_italic_comments = false
                vim.g.xresources_italic_keywords = true
                vim.g.xresources_italic_functions = false
                vim.g.xresources_italic_variables = false
                vim.g.xresources_sidebars = { "qf", "vista_kind", "terminal", "packer", "NvimTree" }
            end,
            config = function()
                local color_list = {
                    "xresources", -- 1  - Based on Xresources Config (e.g: ~/.Xresources)
                    "tokyonight", -- 2  - Tokyonight Colorscheme
                }
                local color = color_list[1]
                vim.cmd("colorscheme " .. color)
            end,
        },
        -- Dashboard
        {
            "glepnir/dashboard-nvim",
            cmd = { "Dashboard", "SessionLoad", "SessionSave" },
            setup = function()
                local map = function(lhs, rhs)
                    vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true })
                end
                map("<F1>", "<CMD>SessionLoad last<CR>")
                map("<F2>", "<CMD>SessionSave last<CR>")
            end,
            config = function()
                require("plugins.dashboard")
            end,
        },

        -- vim-devicons written in lua
        {
            "kyazdani42/nvim-web-devicons",
            module = "nvim-web-devicons",
            wants = "nvim-nonicons",
            requires = {
                { "yamatsum/nvim-nonicons", opt = true },
            },
            config = function()
                require("nvim-web-devicons").setup({ default = true })
            end,
        },

        -- Beautiful Statusline with Animation
        {
            "windwp/windline.nvim",
            event = { "BufReadPre", "BufNewFile" },
            config = function()
                require("plugins.windline")
            end,
        },

        -- Snazzy bufferline
        {
            "akinsho/nvim-bufferline.lua",
            event = { "BufReadPre", "BufNewFile" },
            config = function()
                require("plugins.bufferline")
            end,
        },

        -- Indenting
        {
            "lukas-reineke/indent-blankline.nvim",
            event = { "BufReadPre", "BufNewFile" },
            cmd = {
                "IndentBlanklineEnable",
                "IndentBlanklineDisable",
                "IndentBlanklineRefresh",
            },
            setup = function()
                require("plugins.indent-blankline")
            end,
        },

        -- vim which key
        {
            "folke/which-key.nvim",
            event = "BufWinEnter",
            config = function()
                require("plugins.which-key")
            end,
        },

        -- ======= LSP, Completion and Snippet =======
        {
            "neovim/nvim-lspconfig",
            event = { "BufReadPre", "BufNewFile" },
            requires = {
                {
                    "williamboman/nvim-lsp-installer",
                    module = "nvim-lsp-installer",
                    cmd = {
                        "LspInstall",
                        "LspUninstall",
                        "LspUninstallAll",
                        "LspPrintInstalled",
                    },
                },
                {
                    "jose-elias-alvarez/null-ls.nvim",
                    module = "null-ls",
                },
                {
                    "ray-x/lsp_signature.nvim",
                    module = "lsp_signature",
                },
                {
                    "folke/lsp-trouble.nvim",
                    cmd = { "Trouble", "TroubleToggle" },
                    config = function()
                        require("plugins.trouble")
                    end,
                },
            },
            config = function()
                require("lsp")
            end,
        },

        {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            requires = {
                {
                    "L3MON4D3/LuaSnip",
                    after = "nvim-cmp",
                    config = function()
                        require("plugins.luasnip")
                    end,
                },
                {
                    "rafamadriz/friendly-snippets",
                    after = "LuaSnip",
                },

                { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
                { "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" },
                { "hrsh7th/cmp-calc", after = "cmp-buffer" },
                { "hrsh7th/cmp-path", after = "cmp-nvim-lua" },
                { "hrsh7th/cmp-emoji", after = "cmp-calc" },
                { "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" },
                { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
                { "f3fora/cmp-spell", after = "cmp-buffer" },
            },
            config = function()
                require("plugins.cmp")
            end,
        },

        {
            "mattn/emmet-vim",
            cmd = "EmmetInstall",
            setup = function()
                vim.g.user_emmet_install_global = 0
                vim.g.user_emmet_mode = "a"
                vim.g.user_emmet_leader_key = ","
            end,
        },

        -- ======= Languange =======
        -- EditorConfig for vim
        {
            "editorconfig/editorconfig-vim",
            event = { "BufRead", "BufNewFile" },
            setup = function()
                vim.g.EditorConfig_exclude_patterns = { "fugitive://.*", "scp://.*", "term://.*" }
                vim.g.EditorConfig_disable_rules = { "trim_trailing_whitespace" }
                vim.cmd([[
                au FileType gitcommit let b:EditorConfig_disable = 1
                ]])
            end,
        },

        -- Semantic highlight
        {
            "nvim-treesitter/nvim-treesitter",
            event = { "BufRead", "BufNewFile" },
            run = ":TSUpdate",
            requires = {
                {
                    "nvim-treesitter/nvim-treesitter-textobjects",
                    after = "nvim-treesitter",
                },
                {
                    "mfussenegger/nvim-ts-hint-textobject",
                    module = "tsht",
                    after = "nvim-treesitter",
                },
                {
                    "nvim-treesitter/nvim-treesitter-refactor",
                    after = "nvim-treesitter",
                },
                {
                    "JoosepAlviste/nvim-ts-context-commentstring",
                    after = "nvim-treesitter",
                },
                {
                    "windwp/nvim-ts-autotag",
                    after = { "nvim-treesitter", "nvim-autopairs" },
                },
            },
            config = function()
                require("plugins.treesitter")
            end,
        },

        -- LaTeX Support with Texlab LSP
        {
            "jakewvincent/texmagic.nvim",
            ft = { "tex", "bib", "latex" },
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
                                "%f",
                            },
                            isContinuous = false,
                        },
                    },
                })
            end,
        },

        -- Svelte support
        {
            "leafOfTree/vim-svelte-plugin",
            ft = "svelte",
        },

        -- nim Support
        {
            "alaviss/nim.nvim",
            ft = "nim",
        },

        -- Markdown Support
        {
            "plasticboy/vim-markdown",
            ft = "markdown",
            setup = function()
                vim.g.vim_markdown_folding_disabled = 1
                vim.g.vim_markdown_frontmatter = 1
                vim.g.vim_markdown_math = 1
            end,
        },

        -- Markdown Notebook Navigation And Management
        {
            "jakewvincent/mkdnflow.nvim",
            ft = "markdown",
            config = function()
                require("mkdnflow").setup({
                    default_mappings = true,
                    create_dirs = true,
                    links_relative_to = "current",
                    filetypes = { md = true, rmd = true, markdown = true },
                    evaluate_prefix = true,
                    new_file_prefix = [[os.date('%Y-%m-%d_')]],
                })
            end,
        },

        -- Vim Table mode
        {
            "dhruvasagar/vim-table-mode",
            ft = { "text", "markdown" },
        },

        -- ======= Experience =======

        -- Easy Commenting
        {
            "terrortylor/nvim-comment",
            keys = "gc",
            config = function()
                require("nvim_comment").setup({
                    marker_padding = true,
                    comment_empty = true,
                    create_mappings = true,
                    line_mapping = "gcc",
                    operator_mapping = "gc",
                    hook = function()
                        require("ts_context_commentstring.internal").update_commentstring()
                    end,
                })
            end,
        },

        -- Align
        {
            "junegunn/vim-easy-align",
            keys = "<Plug>(EasyAlign)",
            setup = function()
                vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", { noremap = false, silent = true })
                vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", { noremap = false, silent = true })
            end,
        },

        -- Better %
        {
            "andymass/vim-matchup",
            event = "CursorMoved",
            setup = function()
                vim.g.matchup_matchparen_offscreen = {
                    method = "popup",
                    fullwidth = true,
                    highlight = "Normal",
                }
            end,
        },

        -- Neovim Autopair Plugin
        {
            "windwp/nvim-autopairs",
            after = "nvim-cmp",
            config = function()
                require("plugins.autopairs")
            end,
        },

        -- Vim easy motion
        {
            "phaazon/hop.nvim",
            cmd = { "HopWord", "HopPattern" },
            setup = function()
                vim.api.nvim_set_keymap("n", "<Space>z", "<CMD>HopWord<CR>", { noremap = true })
                vim.api.nvim_set_keymap("n", "<Space>x", "<CMD>HopPattern<CR>", { noremap = true })
            end,
            config = function()
                require("hop").setup({})
            end,
        },

        {
            "ggandor/lightspeed.nvim",
            keys = {
                "<Plug>Lightspeed_f",
                "<Plug>Lightspeed_F",
                "<Plug>Lightspeed_t",
                "<Plug>Lightspeed_T",
            },
            setup = function()
                vim.cmd([[
                nmap <expr> f reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"
                nmap <expr> F reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"
                nmap <expr> t reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"
                nmap <expr> T reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"
                ]])
            end,
            config = function()
                require("lightspeed").setup({
                    jump_to_first_match = true,
                    jump_on_partial_input_safety_timeout = 400,
                    highlight_unique_chars = false,
                    grey_out_search_area = true,
                    match_only_the_start_of_same_char_seqs = true,
                    limit_ft_matches = 8,
                    full_inclusive_prefix_key = "<c-x>",
                })
            end,
        },

        {
            "monaqa/dial.nvim",
            keys = {
                "<Plug>(dial-increment)",
                "<Plug>(dial-increment-additional)",
                "<Plug>(dial-decrement)",
                "<Plug>(dial-decrement-additiona)",
            },
            setup = function()
                vim.cmd([[
                nmap <C-a> <Plug>(dial-increment)
                nmap <C-x> <Plug>(dial-decrement)
                vmap <C-a> <Plug>(dial-increment)
                vmap <C-x> <Plug>(dial-decrement)
                vmap g<C-a> <Plug>(dial-increment-additional)
                vmap g<C-x> <Plug>(dial-decrement-additional)
                ]])
            end,
            config = function()
                local dial = require("dial")
                dial.config.searchlist.normal = {
                    "number#decimal",
                    "number#hex",
                    "number#binary",
                    "color#hex",
                    "date#[%H:%M]",
                    "date#[%Y-%m-%d]",
                    "char#alph#small#word",
                    "char#alph#capital#word",
                    "markup#markdown#header",
                }
            end,
        },

        -- gf like plugins
        {
            "notomo/curstr.nvim",
            event = "CursorMoved",
            setup = function()
                local nnoremap = vim.keymap.nnoremap
                nnoremap({
                    "gf",
                    '<Cmd>lua require("curstr").execute("openable", { action = "open" })<CR>',
                    { silent = true },
                })
                nnoremap({
                    ".,",
                    '<Cmd>lua require("curstr").execute("togglable")<CR>',
                    { silent = true },
                })
            end,
            config = function()
                require("plugins.curstr")
            end,
        },

        -- Show Color
        {
            "norcalli/nvim-colorizer.lua",
            cmd = "ColorizerToggle",
            setup = function()
                local map = function(lhs, rhs)
                    vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true })
                end
                map("<leader>cc", "<CMD>ColorizerToggle<CR>")
            end,
            config = function()
                require("colorizer").setup({
                    "*", -- Highlight all files, but customize some others.
                    css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
                    html = { names = false }, -- Disable parsing "names" like Blue or Gray
                })
            end,
        },

        {
            "michaelb/sniprun",
            run = "bash install.sh",
            keys = { "<Plug>SnipRun", "<Plug>SnupClose" },
            cmd = "SnipRun",
            setup = function()
                vim.cmd([[
                nmap <leader>sr <Plug>SnipRun
                vmap sr <Plug>SnipRun
                nmap <leader>sc <Plug>SnipClose
                ]])
            end,
            config = function()
                require("sniprun").setup({
                    borders = Util.borders,
                    display = {
                        "Terminal",
                        "VirtualTextOk",
                    },
                    repl_enable = {
                        "Bash_original",
                        "Python3_original",
                    },
                })
            end,
        },

        -- ======= Files =======
        -- Fuzzy Finder
        {
            "nvim-telescope/telescope.nvim",
            module_pattern = { "telescope", "telescope.*" },
            cmd = "Telescope",
            keys = {
                { "n", "<Leader>f" },
            },
            wants = {
                "popup.nvim",
                "plenary.nvim",
                "telescope-fzf-native.nvim",
                "telescope-media-files.nvim",
                "telescope-frecency.nvim",
            },
            requires = {
                {
                    "nvim-telescope/telescope-fzf-native.nvim",
                    opt = true,
                    run = "make",
                },
                {
                    "nvim-telescope/telescope-frecency.nvim",
                    opt = true,
                    requires = {
                        "tami5/sql.nvim",
                        module_pattern = { "sql", "sql.*" },
                    },
                },
                {
                    "nvim-telescope/telescope-media-files.nvim",
                    opt = true,
                },
            },
            config = function()
                require("plugins.telescope")
            end,
        },

        -- Superfast Tree File
        {
            "kyazdani42/nvim-tree.lua",
            cmd = "NvimTreeToggle",
            setup = function()
                vim.api.nvim_set_keymap("n", "`", "<CMD>NvimTreeToggle<CR>", { noremap = true })
            end,
            config = function()
                require("plugins.nvim-tree")
            end,
        },

        -- Open root previllage files
        {
            "lambdalisue/suda.vim",
            cmd = { "SudaRead", "SudaWrite" },
            setup = function()
                vim.g.suda_smart_edit = 1
                vim.g["suda#prompt"] = "Password : "
            end,
        },

        -- ======= Git =======
        -- show git stuff in signcolumn
        {
            "lewis6991/gitsigns.nvim",
            wants = { "plenary.nvim" },
            event = { "BufRead", "BufNewFile" },
            config = function()
                require("plugins.gitsigns")
            end,
        },

        {
            "kdheepak/lazygit.nvim",
            cmd = { "LazyGit" },
            setup = function()
                vim.g.lazygit_floating_window_winblend = 0
                vim.g.lazygit_floating_window_scaling_factor = 0.825
                vim.g.lazygit_floating_window_corner_chars = { "╭", "╮", "╰", "╯" }
                vim.g.lazygit_floating_window_use_plenary = 0
                vim.g.lazygit_use_neovim_remote = 0

                local map = function(lhs, rhs)
                    vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true })
                end
                map("<leader>gt", "<CMD>LazyGit<CR>")
            end,
        },

        -- ======= Misc =======
        -- Smooth Scrolling
        {
            "psliwka/vim-smoothie",
            event = "WinScrolled",
            setup = function()
                vim.g.smoothie_update_interval = 30
                vim.g.smoothie_speed_constant_factor = 10
                vim.g.smoothie_speed_linear_factor = 10
            end,
        },

        -- better window and buffer management
        {
            "mhinz/vim-sayonara",
            cmd = "Sayonara",
            setup = function()
                local map = function(lhs, rhs)
                    vim.api.nvim_set_keymap("", lhs, rhs, { noremap = true, silent = true })
                end
                map("<leader>q", "<CMD>Sayonara!<CR>")
                map("<leader>qq", "<CMD>Sayonara<CR>")
                map("<M-w>", "<CMD>Sayonara<CR>")
            end,
        },

        -- goyo.vim in lua
        {
            "folke/zen-mode.nvim",
            cmd = "ZenMode",
            setup = function()
                local map = function(lhs, rhs)
                    vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true })
                end
                map("<leader>gz", ":ZenMode<CR>")
            end,
            config = function()
                require("plugins.zen-mode")
            end,
        },

        -- limelight.vim in lua
        {
            "folke/twilight.nvim",
            cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
            config = function()
                require("twilight").setup({
                    dimming = {
                        alpha = 0.30,
                        color = { "Normal", "#ffffff" },
                        inactive = false,
                    },
                    context = 5,
                    treesitter = true,
                    expand = {
                        "function",
                        "method",
                        "if_statement",
                        "table",
                    },
                    exclude = {},
                })
            end,
        },

        -- Terminal Markdown Previewer
        {
            "npxbr/glow.nvim",
            cmd = "Glow",
            ft = "markdown",
            setup = function()
                local map = function(lhs, rhs)
                    vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true })
                end
                map("<leader>gg", "<CMD>Glow<CR>")
            end,
        },

        -- Markdown Previewer
        {
            "iamcco/markdown-preview.nvim",
            cmd = "MarkdownPreview",
            ft = "markdown",
            run = function()
                vim.fn["mkdp#util#install"]()
            end,
            setup = function()
                vim.g.mkdp_auto_start = 0
                vim.g.mkdp_auto_close = 0
                vim.g.mkdp_refresh_slow = 0
                vim.g.mkdp_browser = "firefox"
            end,
        },

        -- Vim Silicon, Generate Image Source Code
        {
            "segeljakt/vim-silicon",
            cmd = "Silicon",
            setup = function()
                vim.g.silicon = {
                    ["shadow-color"] = "#434434",
                    ["line-pad"] = 3,
                    ["pad-horiz"] = 30,
                    ["pad-vert"] = 30,
                    ["shadow-blur-radius"] = 5,
                    ["shadow-offset-x"] = 8,
                    ["shadow-offset-y"] = 8,
                    ["line-number"] = true,
                    ["round-corner"] = true,
                    ["window-controls"] = true,
                }
                vim.g.silicon.theme = "Dracula"
                vim.g.silicon.font = "FiraCode Nerd Font"
                vim.g.silicon.background = "#f8f8f2"
                vim.g.silicon.output = os.getenv("HOME") .. "/Pictures/Screenshots/silicon-{time:%Y-%m-%d-%H%M%S}.png"
            end,
        },

        -- Startuptime
        {
            "tweekmonster/startuptime.vim",
            cmd = "StartupTime",
        },
    },
    config = {
        compile_path = vim.fn.stdpath("data") .. "/site/pack/loader/start/packer.nvim/plugin/packer_compiled.lua",
        git = {
            clone_timeout = 300,
        },
        display = {
            open_fn = function()
                return require("packer.util").float({ border = Util.borders })
            end,
        },
    },
})
