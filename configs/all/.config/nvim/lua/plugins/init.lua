local packer_ok, packer = pcall(require, "packer")

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
        { "nathom/filetype.nvim", config = [[require("plugins.filetype")]] },

        -- Set keybindings
        -- ------------------------
        { "b0o/mapx.nvim" },

        -- Neovim notify
        -- ------------------------
        {
            "rcarriga/nvim-notify",
            config = function()
                notify = require("notify")
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
            end,
        },

        -- All the lua functions I don't want to write twice.
        -- ------------------------
        { "nvim-lua/plenary.nvim" },

        -- SQLite bindings for lua
        -- -----------------------
        {
            "tami5/sqlite.lua",
            setup = function()
                vim.g.sqlite_clib_path = "/lib64/libsqlite3.so.0.8.6"
            end,
        },

        -- vim-devicons written in lua
        -- ------------------------
        { "kyazdani42/nvim-web-devicons" },

        -- ================================================== User Interface

        -- Colorscheme
        -- ------------------------
        {
            -- "atalazer/wally.nvim",
            "~/Documents/Programming/Repo/wally.nvim",
            run = "./setup.sh",
            setup = function()
                vim.g.wally_transparent = true
                vim.g.wally_wal_dir = "~/.cache/wal"
                vim.g.wally_sidebars = { "qf", "vista_kind", "terminal", "Nvimtree", "Trouble", "packer" }
            end,
            config = [[require("wally").colorscheme()]],
        },

        -- Customizable neovim greeter like dashboard-nvim or vim-startify
        -- ------------------------
        {
            "hhn-pham/alpha-nvim",
            config = [[require("plugins.alpha")]],
        },

        -- Beautiful Statusline with Animation
        -- ------------------------
        {
            "windwp/windline.nvim",
            config = function()
                require("plugins.windline")
                vim.defer_fn(function()
                    vim.cmd("WindLineFloatToggle")
                end, 300)
            end,
        },

        -- Snazzy bufferline
        -- ------------------------
        {
            "akinsho/nvim-bufferline.lua",
            config = [[require("plugins.bufferline")]],
        },

        -- Superfast Tree File
        -- ------------------------
        {
            "kyazdani42/nvim-tree.lua",
            setup = function()
                nnoremap("`", "<CMD>NvimTreeToggle<CR>", "Toggle Nvim Tree")
            end,
            config = [[require("plugins.nvim-tree")]],
        },

        -- Fuzzy Finder
        -- ------------------------
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
            },
        },

        -- FZF >< Lua
        -- ------------------------
        {
            "ibhagwan/fzf-lua",
            requires = { "vijaymarupudi/nvim-fzf" },
            config = [[require("plugins.fzf")]],
        },

        -- Vim Which Key But Lua!
        -- ------------------------
        {
            "folke/which-key.nvim",
            config = [[require("plugins.which-key")]],
        },

        -- Show Indentation
        -- ------------------------
        {
            "lukas-reineke/indent-blankline.nvim",
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

        -- yuck.vim for eww .yuck
        -- ------------------------
        { "elkowar/yuck.vim" },

        -- kmonad.vim for kmonad .kbd
        -- ------------------------
        { "kmonad/kmonad-vim" },

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

        -- Completion
        -- ------------------------
        {
            "hrsh7th/nvim-cmp",
            config = [[require("plugins.cmp")]],
            requires = {
                "f3fora/cmp-spell",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-calc",
                "hrsh7th/cmp-cmdline",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-path",
                "kdheepak/cmp-latex-symbols",
                "lukas-reineke/cmp-rg",
                "lukas-reineke/cmp-under-comparator",
                "saadparwaiz1/cmp_luasnip",
                "uga-rosa/cmp-dictionary",
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
            setup = [[require("plugins.emmet")]],
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
            "numToStr/Comment.nvim",
            config = [[require("plugins.comment").Comment()]],
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
            cmd = { "HopWord" },
            setup = function()
                nnoremap("<leader>w", "<CMD>HopWord<CR>", "Word")
            end,
            config = function()
                require("hop").setup({
                    keys = "asdfhjkl",
                    term_seq_bias = 0.5,
                })
            end,
        },

        -- Sneak
        -- ------------------------
        {
            "ggandor/lightspeed.nvim",
            config = [[require("plugins.lightspeed")]],
        },

        -- Increment and decrement
        -- ------------------------
        {
            "monaqa/dial.nvim",
            config = [[require("plugins.dial")]],
        },

        -- gf like plugins
        -- ------------------------
        {
            "notomo/curstr.nvim",
            config = [[require("plugins.curstr")]],
        },

        -- Show Color
        -- ------------------------
        {
            "RRethy/vim-hexokinase",
            run = "make hexokinase",
            setup = function()
                vim.g.Hexokinase_highlighters = { "backgroundfull" }
                vim.g.Hexokinase_optInPatterns = {
                    "full_hex",
                    -- "triple_hex",
                    "rgb",
                    "rgba",
                    "hsl",
                    "hsla",
                    -- "colour_names",
                }
                vim.g.Hexokinase_ftOptInPatterns = {
                    css = "full_hex,rgb,rgba,hsl,hsla,colour_names",
                    html = "full_hex,rgb,rgba,hsl,hsla,colour_names",
                }
            end,
        },

        -- Code runner
        -- ------------------------
        {
            "michaelb/sniprun",
            run = "sh install.sh",
            keys = { "<Plug>SnipRun", "<Plug>SnupClose" },
            cmd = "SnipRun",
            config = [[require("plugins.sniprun")]],
        },

        -- ====================================================== Git

        -- Show added, deleted, changed diff
        -- ------------------------
        {
            "lewis6991/gitsigns.nvim",
            wants = "plenary.nvim",
            event = "BufEnter",
            config = [[require("plugins.gitsigns")]],
        },

        -- Lazygit wrapper
        -- ------------------------
        {
            "kdheepak/lazygit.nvim",
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

        -- GitLinker
        -- ----------------------
        {
            "ruifm/gitlinker.nvim",
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
            setup = function()
                mapx.nname("<leader>g", "Git")
                nmap("<Leader>gg", "<CMD>G<CR>", "Main")
                nmap("<Leader>gh", "<CMD>diffget //2<CR>", "Merge Left (2-Way)")
                nmap("<Leader>gf", "<CMD>diffget //3<CR>", "Merge Right (3-Way)")
                nmap("<Leader>gc", "<CMD>G commit<CR>", "Commit")
                nmap("<Leader>gm", "<CMD>G merge<CR>", "Merge")
                nmap("<Leader>gb", "<CMD>G branch<CR>", "Branch")
            end,
        },

        -- ============================================== Misc

        -- Smooth Scrolling
        -- ------------------------
        {
            "karb94/neoscroll.nvim",
            config = [[require("plugins.neoscroll")]],
        },

        -- Better Window And Buffer Management
        -- ------------------------
        {
            "mhinz/vim-sayonara",
            setup = function()
                local opts = { silent = true }
                nnoremap("<C-w><C-w>", "<CMD>Sayonara<CR>", opts, "Close Window/Buffer/Vim")
            end,
        },

        -- Escape From Insert Mode Without Delay When Typing
        -- ------------------------
        {
            "max397574/better-escape.nvim",
            config = function()
                require("better_escape").setup({
                    mapping = { "jk" },
                    timeout = vim.o.timeoutlen,
                    keys = "<Esc><Esc>",
                })
            end,
        },

        -- Better whitespace
        -- ------------------------
        {
            "ntpeters/vim-better-whitespace",
            setup = function()
                vim.g.better_whitespace_enabled = 1
                vim.g.strip_whitespace_on_save = 1
                vim.g.better_whitespace_operator = "<leader>s"
                vim.g.better_whitespace_filetypes_blacklist = { "markdown" }
                vim.g.strip_max_file_size = 1000
                vim.g.strip_whitelines_at_eof = 1
                vim.g.better_whitespace_skip_empty_lines = 1
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

        -- headlines.nvim
        -- ------------------------
        {
            "lukas-reineke/headlines.nvim",
            config = function()
                vim.cmd([[highlight Headline1 guibg=#1e2718]])
                vim.cmd([[highlight Headline2 guibg=#21262d]])
                vim.cmd([[highlight CodeBlock guibg=#1c1c1c]])
                vim.fn.sign_define("Headline1", { linehl = "Headline1" })
                vim.fn.sign_define("Headline2", { linehl = "Headline2" })

                require("headlines").setup({
                    markdown = {
                        source_pattern_start = "^```",
                        source_pattern_end = "^```$",
                        dash_pattern = "^---+$",
                        headline_pattern = "^#+",
                        headline_signs = { "Headline1", "Headline2" },
                        -- headline_signs = { "Headline" },
                        -- codeblock_sign = "CodeBlock",
                        -- dash_highlight = "Dash",
                    },
                })
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
                vim.g.mkdp_browser = "surf"
            end,
        },

        -- Paste Image from clipboard
        -- -------------------------
        {
            "ekickx/clipboard-image.nvim",
            config = function()
                require("clipboard-image").setup({
                    default = {
                        img_dir = "img",
                        img_dir_txt = "img",
                        img_name = function()
                            return os.date("%Y%m%d-%H%M%S")
                        end,
                        affix = "%s",
                    },
                    markdown = {
                        img_dir = "img",
                        img_dir_txt = "img",
                        affix = "![Image](%s)",
                        img_name = function()
                            local name = vim.fn.input("Image Name: ")
                            return tostring(name)
                        end,
                    },
                })
            end,
        },

        -- Vim `silicon` client,
        -- generate Beautiful source code Screenshot
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

        -- Startuptime
        -- ------------------------
        {
            "tweekmonster/startuptime.vim",
            cmd = "StartupTime",
        },
    },
    config = {
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
