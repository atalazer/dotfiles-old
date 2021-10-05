local packer_ok, packer = pcall(require, "packer")
local enabled = require("base.rc").plugin_enabled

if not packer_ok then
    return
end

return packer.startup({
    {
        -- ================================================ Base

        -- Package Manager that support lazy load!
        -- ------------------------
        { "wbthomason/packer.nvim", opt = true },

        -- Improve startup time for Neovim
        -- ------------------------
        { "lewis6991/impatient.nvim", rocks = "mpack" },

        -- A faster version of filetype.vim
        -- ------------------------
        { "nathom/filetype.nvim" },

        -- Set keybindings
        -- ------------------------
        { "b0o/mapx.nvim" },

        -- Neovim notify
        -- ------------------------
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

        -- All the lua functions I don't want to write twice.
        -- ------------------------
        { "nvim-lua/plenary.nvim" },

        -- vim-devicons written in lua
        -- ------------------------
        { "kyazdani42/nvim-web-devicons" },

        -- ================================================== User Interface

        -- Colorscheme
        -- ------------------------
        {
            "~/Documents/Programming/Repo/xresources-nvim",
            config = [[require("xresources").colorscheme()]],
        },

        -- Customizable neovim greeter like dashboard-nvim or vim-startify
        -- ------------------------
        {
            "hhn-pham/alpha-nvim",
            disable = not enabled.alpha,
            config = [[require("plugins.alpha")]],
        },

        -- Beautiful Statusline with Animation
        -- ------------------------
        {
            "windwp/windline.nvim",
            disable = not enabled.windline,
            -- config = [[require("plugins.windline")]],
            config = [[require("wlsample.evil_line")]],
        },

        -- Snazzy bufferline
        -- ------------------------
        {
            "akinsho/nvim-bufferline.lua",
            disable = not enabled.bufferline,
            config = [[require("plugins.bufferline")]],
        },

        -- Customizable Sidebar
        -- ------------------------
        {
            "GustavoKatel/sidebar.nvim",
            disable = not enabled.sidebar,
            config = [[require("plugins.sidebar")]],
        },

        -- Superfast Tree File
        -- ------------------------
        {
            "kyazdani42/nvim-tree.lua",
            disable = not enabled.nvim_tree,
            setup = function()
                nnoremap("`", "<CMD>NvimTreeToggle<CR>", "Toggle Nvim Tree")
                require("plugins.nvim-tree").setup()
            end,
            config = require("plugins.nvim-tree").config,
        },

        -- Fuzzy Finder
        -- ------------------------
        {
            "nvim-telescope/telescope.nvim",
            disable = not enabled.telescope,
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
                        vim.g.sqlite_clib_path = "/lib64/libsqlite3.so.0.8.6"
                    end,
                },
            },
        },

        -- FZF >< Lua
        -- ------------------------
        {
            "ibhagwan/fzf-lua",
            disable = not enabled.fzf,
            requires = { "vijaymarupudi/nvim-fzf" },
            config = [[require("plugins.fzf")]],
        },

        -- Vim Which Key But Lua!
        -- ------------------------
        {
            "folke/which-key.nvim",
            disable = not enabled.which_key,
            config = [[require("plugins.which-key")]],
        },

        -- Distraction-free coding for Neovim
        -- ------------------------
        {
            "folke/zen-mode.nvim",
            disable = not enabled.zenmode,
            cmd = "ZenMode",
            setup = function()
                nnoremap("<leader>gz", "<CR>ZenMode<CR>", "silent")
            end,
            config = [[require("plugins.zen-mode")]],
        },

        -- Dim inactive portions of the code you're editing using TreeSitter.
        -- ------------------------
        {
            "folke/twilight.nvim",
            disable = not enabled.twillight,
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

        -- Auto-Focusing and Auto-Resizing Splits/Windows for neovim
        -- --------------------------
        {
            "beauwilliams/focus.nvim",
            disable = not enabled.focus,
            config = function()
                require("focus").setup({
                    -- cursorline = true,
                    -- signcolumn = true,
                    -- number = true,
                    -- relativenumber = true,
                    -- hybridnumber = true,
                    compatible_filetrees = { "filetree", "nvimtree", "nerdtree", "chadtree", "fern" },
                    excluded_filetypes = { "toggleterm", "TelescopePrompt", "frecency", "fzf" },
                    excluded_buftypes = { "help", "prompt", "nofile" },
                })
            end,
        },

        -- Shade inactive windows
        -- ------------------------
        {
            "sunjon/shade.nvim",
            disable = not enabled.shade,
            config = function()
                require("shade").setup({
                    overlay_opacity = 50,
                    opacity_step = 1,
                    keys = {
                        brightness_up = "<C-Up>",
                        brightness_down = "<C-Down>",
                        toggle = "<Leader>cs",
                    },
                })
            end,
        },

        -- Show Indentation
        -- ------------------------
        {
            "lukas-reineke/indent-blankline.nvim",
            disable = not enabled.indent_blankline,
            config = [[require("plugins.indent-blankline")]],
        },

        -- ===================================================== Languange

        -- EditorConfig for nvim
        -- ------------------------
        { "gpanders/editorconfig.nvim" },

        -- Semantic highlight
        -- ------------------------
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
        -- ------------------------
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
        -- ------------------------
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
        -- ------------------------
        {
            "dhruvasagar/vim-table-mode",
            ft = { "text", "markdown" },
            cmd = { "TableModeRealign", "TableModeToggle" },
        },

        -- yuck.vim for eww
        -- ------------------------
        { "elkowar/yuck.vim" },

        -- ================================================= LSP, Completion and Snippet

        -- Neovim built-in Lsp
        -- ------------------------
        {
            "neovim/nvim-lspconfig",
            config = [[require("lsp")]],
            requires = {
                "williamboman/nvim-lsp-installer",
                "jose-elias-alvarez/null-ls.nvim",
                {
                    "folke/lsp-trouble.nvim",
                    cmd = { "Trouble", "TroubleToggle" },
                    config = [[require("plugins.trouble")]],
                },
            },
        },

        -- Coq.nvim, completion
        -- ------------------------
        {
            "ms-jpq/coq_nvim",
            disable = not enabled.coq,
            branch = "coq",
            requires = {
                { "ms-jpq/coq.artifacts", branch = "artifacts" },
                { "ms-jpq/coq.thirdparty", branch = "3p" },
            },
            setup = require("plugins.coq").setup,
            config = require("plugins.coq").config,
        },

        -- Completion
        -- ------------------------
        {
            "hrsh7th/nvim-cmp",
            disable = not enabled.cmp,
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
        -- ------------------------
        {
            "L3MON4D3/LuaSnip",
            requires = {
                { "rafamadriz/friendly-snippets" },
            },
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load({
                    paths = vim.fn.stdpath("config"),
                })
                vim.cmd([[
                    imap <silent><expr> <C-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-j>'
                    snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(1)<CR>
                    snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>
                    inoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>
                ]])
            end,
        },

        -- Emmet vim
        -- ------------------------
        {
            "mattn/emmet-vim",
            cmd = "EmmetInstall",
            setup = function()
                vim.g.user_emmet_install_global = 0
                vim.g.user_emmet_mode = "a"
                vim.g.user_emmet_leader_key = ","
            end,
        },

        -- Parinfer
        -- ------------------------
        {
            "eraserhd/parinfer-rust",
            run = "cargo build --release",
        },

        -- ======================================================= Experience

        -- Easy Commenting
        -- ------------------------
        {
            "winston0410/commented.nvim",
            keys = "gc",
            config = function()
                require("commented").setup({
                    comment_padding = " ",
                    keybindings = { n = "gc", v = "gc", nl = "gcc" },
                    prefer_block_comment = false,
                    set_keybindings = true,
                    ex_mode_cmd = "Comment",
                    hooks = {
                        before_comment = require("ts_context_commentstring.internal").update_commentstring,
                    },
                })
            end,
        },

        -- Align
        -- ------------------------
        {
            "junegunn/vim-easy-align",
            keys = "<Plug>(EasyAlign)",
            setup = function()
                nnoremap("ga", "<Plug>(EasyAlign)", "silent", "Align")
                xnoremap("ga", "<Plug>(EasyAlign)", "silent", "Align")
            end,
        },

        -- Better %
        -- ------------------------
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
        -- ------------------------
        {
            "windwp/nvim-autopairs",
            config = [[require("plugins.autopairs")]],
        },

        -- Vim easy motion
        -- ------------------------
        {
            "phaazon/hop.nvim",
            disable = not enabled.hop,
            cmd = { "HopWord" },
            setup = function()
                nnoremap("<leader>z", "<CMD>HopWord<CR>", "Word")
            end,
            config = function()
                require("hop").setup({
                    keys = "wasdfhjkl",
                    term_seq_bias = 0.5,
                })
            end,
        },

        -- Sneak
        -- ------------------------
        {
            "ggandor/lightspeed.nvim",
            disable = not enabled.lightspeed,
            setup = require("plugins.lightspeed").setup,
            config = require("plugins.lightspeed").config,
        },

        -- Increment and decrement
        -- ------------------------
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
        -- ------------------------
        {
            "notomo/curstr.nvim",
            setup = require("plugins.curstr").setup,
            config = require("plugins.curstr").config,
        },

        -- Show Color
        -- ------------------------
        {
            "RRethy/vim-hexokinase",
            disable = not enabled.hexokinase,
            run = "make hexokinase",
            setup = function()
                vim.g.Hexokinase_highlighters = { "backgroundfull" }
                vim.g.Hexokinase_optInPatterns = {
                    "full_hex",
                    "triple_hex",
                    "rgb",
                    "rgba",
                    "hsl",
                    "hsla",
                    "colour_names",
                }
                vim.g.Hexokinase_ftOptInPatterns = {
                    css = "full_hex,rgb,rgba,hsl,hsla,colour_names",
                    html = "full_hex,rgb,rgba,hsl,hsla,colour_names",
                }
            end,
        },

        -- Show Color
        -- ------------------------
        {
            "norcalli/nvim-colorizer.lua",
            disable = not enabled.colorizer,
            cmd = "ColorizerToggle",
            setup = require("plugins.nvim-colorizer").setup,
            config = require("plugins.nvim-colorizer").config,
        },

        -- Code runner
        -- ------------------------
        {
            "michaelb/sniprun",
            disable = not enabled.sniprun,
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

        -- ====================================================== Git

        -- Show added, deleted, changed diff
        -- ------------------------
        {
            "lewis6991/gitsigns.nvim",
            disable = not enabled.gitsigns,
            wants = "plenary.nvim",
            event = "BufEnter",
            config = [[require("plugins.gitsigns")]],
        },

        -- Lazygit wrapper
        -- ------------------------
        {
            "kdheepak/lazygit.nvim",
            disable = not enabled.lazygit,
            cmd = { "LazyGit" },
            setup = function()
                vim.g.lazygit_floating_window_winblend = 0
                vim.g.lazygit_floating_window_scaling_factor = 0.825
                vim.g.lazygit_floating_window_corner_chars = { "╭", "╮", "╰", "╯" }
                vim.g.lazygit_floating_window_use_plenary = 0
                vim.g.lazygit_use_neovim_remote = 0

                nnoremap("<leader>gt", "<CMD>LazyGit<CR>", "silent", "Open Lazy Git")
            end,
        },

        -- Magit clone for Neovim
        -- ----------------------
        {
            "TimUntersberger/neogit",
            disable = not enabled.neogit,
            cmd = "Neogit",
            requires = {
                {
                    "sindrets/diffview.nvim",
                    config = function()
                        require("diffview").setup()
                    end,
                },
            },
            config = [[require("plugins.neogit")]],
            setup = function()
                mapx.nname("<leader>g", "Git")
                nmap("<Leader>gg", "<CMD>Neogit<CR>", "Main Menu")
                nmap("<Leader>gc", "<CMD>Neogit commit<CR>", "Commit")
                nmap("<Leader>gd", "<CMD>Neogit diff<CR>", "Merge")
                nmap("<Leader>gb", "<CMD>Neogit branch<CR>", "Branch")
            end,
        },

        -- GitLinker
        -- ----------------------
        {
            "ruifm/gitlinker.nvim",
            disable = not enabled.gitlinker,
            config = function()
                require("gitlinker").setup({
                    mappings = "<leader>gw",
                })
            end,
        },

        -- Vim Fugitive
        -- ----------------------
        {
            "tpope/vim-fugitive",
            disable = not enabled.fugitive,
            setup = function()
                mapx.nname("<leader>g", "Git")
                nmap("<Leader>gg", "<CMD>G<CR>", "Main Menu")
                nmap("<Leader>gh", "<CMD>diffget //2<CR>", "Merge Left")
                nmap("<Leader>gf", "<CMD>diffget //3<CR>", "Merge Right")
                nmap("<Leader>gc", "<CMD>G commit<CR>", "Commit")
                nmap("<Leader>gm", "<CMD>G merge<CR>", "Merge")
                nmap("<Leader>gb", "<CMD>G branch<CR>", "Branch")
                nmap("<Leader>gw", "<CMD>GBrowse<CR>", "Branch")
            end,
        },

        -- ============================================== Misc

        -- Smooth Scrolling
        -- ------------------------
        {
            "karb94/neoscroll.nvim",
            disable = not enabled.neoscroll,
            config = [[require("plugins.neoscroll")]],
        },

        -- Better Window And Buffer Management
        -- ------------------------
        {
            "mhinz/vim-sayonara",
            setup = function()
                local opts = { silent = true }
                nnoremap("<A-w>", "<CMD>Sayonara<CR>", opts, "Close Window/Buffer/Vim")
                nnoremap("<A-q>", "<CMD>Sayonara<CR>", opts, "Close Window/Buffer/Vim")
                nnoremap("<A-j><A-k>", "<CMD>Sayonara<CR>", opts, "Close Window/Buffer/Vim")
            end,
        },

        -- Escape From Insert Mode Without Delay When Typing
        -- ------------------------
        {
            "max397574/better-escape.nvim",
            config = function()
                require("better_escape").setup({
                    mapping = { "jk", "jj" },
                    timeout = vim.o.timeoutlen,
                    keys = "<Esc>",
                })
            end,
        },

        -- Open Previllage Files
        -- ------------------------
        {
            "lambdalisue/suda.vim",
            setup = function()
                vim.g.suda_smart_edit = 1
                vim.g["suda#prompt"] = "[Suda] Password : "
            end,
        },

        -- Terminal Markdown Previewer
        -- ------------------------
        {
            "npxbr/glow.nvim",
            cmd = "Glow",
            ft = "markdown",
            setup = function()
                nnoremap("<leader>pm", "<CMD>Glow<CR>", "silent", "Preview File With Glow")
            end,
        },

        -- Markdown Previewer
        -- ------------------------
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

        -- Make You Better At Vim Movements.
        -- --------------------------
        { "ThePrimeagen/vim-be-good" },

        -- Generate Image Source Code
        -- ------------------------
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

        -- -- Himalaya, CLI email client
        -- -- ------------------------
        -- {
        --     "soywod/himalaya",
        --     rtp = "vim",
        --     disable = not enabled.himalaya,
        --     setup = function()
        --         vim.g.himalaya_mailbox_picker = "telescope"
        --         vim.g.himalaya_telescope_preview_enabled = 1
        --     end
        -- },

        -- Discord Rich Presence for Neovim
        -- ------------------------
        {
            "andweeb/presence.nvim",
            disable = not enabled.presence,
            config = [[require("plugins.presence")]],
        },

        -- Startuptime
        -- ------------------------
        {
            "tweekmonster/startuptime.vim",
            cmd = "StartupTime",
        },
    },
    config = {
        compile_path = vim.fn.stdpath("data") .. "/site/pack/loader/start/packer.nvim/plugin/packer_compiled.lua",
        auto_reload_compiled = true,
        git = {
            depth = 1,
            clone_timeout = 300,
        },
        display = {
            open_fn = function()
                return require("packer.util").float({ border = Util.borders })
            end,
            keybindings = {
                quit = "q",
                toggle_info = "<CR>",
                diff = "d",
                prompt_revert = "r",
            },
        },
    },
})
