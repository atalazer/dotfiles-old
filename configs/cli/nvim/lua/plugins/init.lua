local packer_ok, packer = pcall(require, "packer")

if not packer_ok then
    return
end

return packer.startup({
    {
        { "wbthomason/packer.nvim", opt = true },
        { "lewis6991/impatient.nvim", rocks = "mpack" },
        { "nvim-lua/plenary.nvim" },

        {
            "rcarriga/nvim-notify",
            config = function()
                local notify = require("notify")
                notify.setup({
                    stages = "fade_in_slide_out",
                    timeout = 2000,
                    background_colour = "#161822",
                    icons = {
                        ERROR = " ",
                        WARN = " ",
                        HINT = " ",
                        INFO = " ",
                        DEBUG = " ",
                        TRACE = "✎",
                    },
                })
                vim.notify = notify
            end,
        },

        -- ======= User Interface =======
        -- Colorscheme
        -- { "rktjmp/lush.nvim" },
        {
            -- "nekonako/xresources-nvim",
            "~/Documents/GitHub/xresources-nvim",
            config = [[require("xresources").colorscheme()]],
        },
        {
            "folke/tokyonight.nvim",
            "Pocco81/Catppuccino.nvim",
            "EdenEast/nightfox.nvim",
            "Shatur/neovim-ayu",
            "yonlu/omni.vim",
        },

        -- vim-devicons written in lua
        {
            "kyazdani42/nvim-web-devicons",
        },

        -- Customizable neovim greeter like dashboard-nvim or vim-startify
        {
            "hhn-pham/alpha-nvim",
            config = [[require("plugins.alpha")]],
        },

        -- Beautiful Statusline with Animation
        {
            "windwp/windline.nvim",
            config = [[require("plugins.windline")]],
        },

        -- Snazzy bufferline
        {
            "akinsho/nvim-bufferline.lua",
            config = [[require("plugins.bufferline")]],
        },

        -- Customizable Sidebar
        {
            "GustavoKatel/sidebar.nvim",
            setup = function()
                vim.api.nvim_set_keymap("n", "~", "<CMD>SidebarNvimToggle<CR>", { noremap = true })
                vim.api.nvim_set_keymap("n", "<leader>ss", "<CMD>SidebarNvimToggle<CR>", { noremap = true })
            end,
            config = [[require("plugins.sidebar")]],
        },

        -- Superfast Tree File
        {
            "kyazdani42/nvim-tree.lua",
            cmd = "NvimTreeToggle",
            setup = function()
                vim.api.nvim_set_keymap("n", "`", "<CMD>NvimTreeToggle<CR>", { noremap = true })
                vim.api.nvim_set_keymap("n", "<leader>sa", "<CMD>NvimTreeToggle<CR>", { noremap = true })
            end,
            config = [[require("plugins.nvim-tree")]],
        },

        -- Indenting
        {
            "lukas-reineke/indent-blankline.nvim",
            setup = [[require("plugins.indent-blankline")]],
        },

        -- Vim Which Key But Lua!
        {
            "folke/which-key.nvim",
            config = [[require("plugins.which-key")]],
        },

        -- Fuzzy Finder
        {
            "nvim-telescope/telescope.nvim",
            config = [[require("plugins.telescope")]],
            module_pattern = { "telescope", "telescope.*" },
            cmd = "Telescope",
            keys = {
                { "n", "<Leader>f" },
            },
            wants = {
                "sqlite.lua",
                "plenary.nvim",
                "telescope-fzf-native.nvim",
                "telescope-media-files.nvim",
                "telescope-frecency.nvim",
            },
            requires = {
                "nvim-telescope/telescope-media-files.nvim",
                "nvim-telescope/telescope-frecency.nvim",
                { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
                {
                    "tami5/sqlite.lua",
                    setup = function()
                        vim.g.sqlite_clib_path = "/lib64/libsqlite3.so"
                    end,
                },
            },
        },

        -- ======= Languange =======
        -- EditorConfig for nvim
        { "gpanders/editorconfig.nvim" },

        -- Semantic highlight
        {
            "nvim-treesitter/nvim-treesitter",
            requires = {
                {
                    "nvim-treesitter/playground",
                    cmd = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" },
                },
                "nvim-treesitter/nvim-treesitter-refactor",
                "JoosepAlviste/nvim-ts-context-commentstring",
                "windwp/nvim-ts-autotag",
            },
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

        -- Vim Table mode
        {
            "dhruvasagar/vim-table-mode",
            ft = { "text", "markdown" },
        },

        -- ======= LSP, Completion and Snippet =======
        -- Lsp
        {
            "neovim/nvim-lspconfig",
            config = [[require("lsp")]],
            requires = {
                "williamboman/nvim-lsp-installer",
                "jose-elias-alvarez/null-ls.nvim",
                "ray-x/lsp_signature.nvim",
                {
                    "folke/lsp-trouble.nvim",
                    cmd = { "Trouble", "TroubleToggle" },
                    config = [[require("plugins.trouble")]],
                },
            },
        },

        -- Coq.nvim, completion
        -- {
        --     "ms-jpq/coq_nvim",
        --     branch = "coq",
        --     requires = {
        --         { "ms-jpq/coq.artifacts", branch = "artifacts" },
        --         { "ms-jpq/coq.thirdparty", branch = "3p" },
        --     },
        --     setup = require("plugins.coq").setup,
        --     config = require("plugins.coq").config,
        -- },

        -- Completion
        {
            "hrsh7th/nvim-cmp",
            config = [[require("plugins.cmp")]],
            requires = {
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-nvim-lsp",
                "f3fora/cmp-spell",
                "saadparwaiz1/cmp_luasnip",
            },
        },

        -- Snippet
        {
            "L3MON4D3/LuaSnip",
            requires = { "rafamadriz/friendly-snippets" },
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load({
                    paths = vim.fn.stdpath("config"),
                })

                vim.cmd([[
                    snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(1)<CR>
                    imap <silent><expr> <C-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-j>'
                    snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>
                    inoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>
                ]])
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

        -- ======= Experience =======
        -- Easy Commenting
        {
            "terrortylor/nvim-comment",
            keys = "gc",
            config = function()
                require("nvim_comment").setup({
                    marker_padding = true,
                    comment_empty = false,
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
            config = [[require("plugins.autopairs")]],
        },

        -- Vim easy motion
        {
            "phaazon/hop.nvim",
            cmd = { "HopWord", "HopPattern" },
            setup = function()
                vim.api.nvim_set_keymap("n", "<leader>z", "<CMD>HopWord<CR>", { noremap = true })
                vim.api.nvim_set_keymap("n", "<leader>x", "<CMD>HopPattern<CR>", { noremap = true })
            end,
            config = [[require("hop").setup()]],
        },

        {
            "ggandor/lightspeed.nvim",
            keys = {
                "<Plug>Lightspeed_f",
                "<Plug>Lightspeed_F",
                "<Plug>Lightspeed_t",
                "<Plug>Lightspeed_T",
            },
            setup = require("plugins.lightspeed").setup,
            config = require("plugins.lightspeed").config,
        },

        {
            "monaqa/dial.nvim",
            keys = {
                "<Plug>(dial-increment)",
                "<Plug>(dial-increment-additional)",
                "<Plug>(dial-decrement)",
                "<Plug>(dial-decrement-additiona)",
            },
            setup = require("plugins.dial").setup,
            config = require("plugins.dial").config,
        },

        -- gf like plugins
        {
            "notomo/curstr.nvim",
            setup = require("plugins.curstr").setup,
            config = require("plugins.curstr").config,
        },

        -- Show Color
        {
            "norcalli/nvim-colorizer.lua",
            cmd = "ColorizerToggle",
            setup = require("plugins.nvim-colorizer").setup,
            config = require("plugins.nvim-colorizer").config,
        },

        {
            "michaelb/sniprun",
            run = "bash install.sh",
            keys = { "<Plug>SnipRun", "<Plug>SnupClose" },
            cmd = "SnipRun",
            setup = function()
                vim.cmd([[
                nmap <leader>sc <Plug>SnipClose
                nmap <leader>sr <Plug>SnipRun
                vmap sr <Plug>SnipRun
                ]])
            end,
            config = function()
                require("sniprun").setup({
                    borders = Util.borders,
                    display = {
                        -- "Classic",
                        "Terminal",
                        "VirtualTextOk",
                    },
                })
            end,
        },

        -- ======= Git =======
        -- show git stuff in signcolumn
        {
            "lewis6991/gitsigns.nvim",
            wants = "plenary.nvim",
            event = "BufEnter",
            config = [[require("plugins.gitsigns")]],
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

        -- Open root previllage files
        {
            "lambdalisue/suda.vim",
            setup = function()
                vim.g.suda_smart_edit = 1
                vim.g["suda#prompt"] = "[Suda] Password : "
            end,
        },

        -- goyo.vim in lua
        {
            "folke/zen-mode.nvim",
            cmd = "ZenMode",
            setup = function()
                vim.api.nvim_set_keymap("n", "<leader>gz", ":ZenMode<CR>", { noremap = true, silent = true })

                local ZEN = vim.env.NVIMZEN
                if ZEN == 1 or ZEN == true then
                    vim.cmd("ZenMode")
                end
            end,
            config = [[require("plugins.zen-mode")]],
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
            run = [[vim.fn["mkdp#util#install"]()]],
            setup = function()
                vim.g.mkdp_auto_start = 0
                vim.g.mkdp_auto_close = 0
                vim.g.mkdp_refresh_slow = 0
                vim.g.mkdp_browser = "firefox"
            end,
        },

        -- Session management
        {
            "folke/persistence.nvim",
            config = function()
                require("persistence").setup({
                    dir = vim.fn.expand(vim.fn.stdpath("cache") .. "/sessions/"),
                    options = { "buffers", "curdir", "tabpages", "winsize" },
                })
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

        -- Discord Rich Presence for Neovim
        {
            "andweeb/presence.nvim",
            config = [[require("plugins.presence")]],
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
