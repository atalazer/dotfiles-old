-- Get from: https://gist.github.com/ekickx/22a1ee5735aa80aca9a908121a04945f

_G.Dep_future_plugins = {}

-- Append 2nd table to 1st table
local tbl_append = function(tbl_1, tbl_2)
    local result = { unpack(tbl_1) }
    table.move(tbl_2, 1, #tbl_2, #result + 1, result)
    return result
end

local dep_load = function(plugins)
    _G.Dep_future_plugins = tbl_append(_G.Dep_future_plugins, plugins)
    require("dep")(_G.Dep_future_plugins)
end

-- Run dep_load `wait_time`ms later after we call it
local dep_defer_load = function(plugins, wait_time)
    wait_time = wait_time or 0
    vim.defer_fn(function()
        dep_load(plugins)
    end, wait_time)
end

dep_load({
    -- Neovim notify
    -- ------------------------
    {
        "rcarriga/nvim-notify",
        function()
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

    -- Colorscheme
    -- ------------------------
    {
        "atalazer/wally.nvim",
        function()
            vim.g.wally_transparent = true
            vim.g.wally_wal_dir = "~/.cache/wal"
            vim.g.wally_sidebars = { "qf", "vista_kind", "terminal", "Nvimtree", "Trouble", "packer" }
            require("wally").colorscheme()
        end,
    },

    -- Beautiful Statusline with Animation
    -- ------------------------
    {
        "windwp/windline.nvim",
        function()
            require("plugins._windline")
            vim.defer_fn(function()
                vim.cmd("WindLineFloatToggle")
            end, 300)
        end,
    },
})

dep_defer_load({
    -- Snazzy bufferline
    -- ------------------------
    {
        "akinsho/nvim-bufferline.lua",
        function()
            require("plugins._bufferline")
        end,
    },

    -- Superfast Tree File
    -- ------------------------
    {
        "kyazdani42/nvim-tree.lua",
        function()
            nnoremap("`", "<CMD>NvimTreeToggle<CR>", "Toggle Nvim Tree")
            require("plugins._nvim-tree")
        end,
    },

    -- Fuzzy Finder
    -- ------------------------
    {
        "nvim-telescope/telescope.nvim",
        function()
            require("plugins._telescope")
        end,
        requires = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                config = function()
                    vim.fn.system({"make"})
                end
            },
        },
    },

    -- Vim Which Key But Lua!
    -- ------------------------
    {
        "folke/which-key.nvim",
        function()
            require("plugins._which-key")
        end,
    },

    -- Show Indentation
    -- ------------------------
    {
        "lukas-reineke/indent-blankline.nvim",
        function()
            require("plugins._indent-blankline")
        end,
    },

    -- Semantic highlight
    -- ------------------------
    {
        "nvim-treesitter/nvim-treesitter",
        requires = {
            "nvim-treesitter/nvim-treesitter-refactor",
            "JoosepAlviste/nvim-ts-context-commentstring",
            "windwp/nvim-ts-autotag",
        },
    },

    -- Markdown Support
    -- ------------------------
    {
        "plasticboy/vim-markdown",
        function()
            vim.g.vim_markdown_folding_disabled = 1
            vim.g.vim_markdown_frontmatter = 1
            vim.g.vim_markdown_math = 1
        end,
    },

    -- Vim Table mode
    -- ------------------------
    {
        "dhruvasagar/vim-table-mode",
    },

    -- ================================================= LSP, Completion and Snippet
    -- Neovim built-in Lsp
    -- ------------------------
    {
        "neovim/nvim-lspconfig",
        function()
            require("lsp")
        end,
        requires = {
            "williamboman/nvim-lsp-installer",
            "jose-elias-alvarez/null-ls.nvim",
        },
    },

    {
        "folke/lsp-trouble.nvim",
        function()
            require("plugins._trouble")
        end,
        requires = "kyazdani42/nvim-web-devicons",
    },

    -- Completion
    -- ------------------------
    {
        "hrsh7th/nvim-cmp",
        function()
            require("plugins._cmp")
        end,
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
        function()
            require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.fn.stdpath("config") })
            vim.cmd([[
                    imap <silent><expr> <C-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-j>'
                    snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(1)<CR>
                    snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>
                    inoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>
                ]])
        end,
        requires = "rafamadriz/friendly-snippets",
    },

    -- Emmet vim
    -- ------------------------
    {
        "mattn/emmet-vim",
        function()
            require("plugins._emmet")
        end,
    },

    -- ======================================================= Experience

    -- Easy Commenting
    -- ------------------------
    {
        "numToStr/Comment.nvim",
        function()
            require("plugins._comment").Comment()
        end,
    },

    -- Align
    -- ------------------------
    {
        "junegunn/vim-easy-align",
        function()
            nnoremap("ga", "<Plug>(EasyAlign)", "silent", "Align")
            xnoremap("ga", "<Plug>(EasyAlign)", "silent", "Align")
        end,
    },

    -- Better %
    -- ------------------------
    {
        "andymass/vim-matchup",
        function()
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
        function()
            require("plugins._autopairs")
        end,
    },

    -- Vim easy motion
    -- ------------------------
    {
        "phaazon/hop.nvim",
        function()
            require("hop").setup({
                keys = "asdfhjkl",
                term_seq_bias = 0.5,
            })
            nnoremap("<leader>w", "<CMD>HopWord<CR>", "Word")
        end,
    },

    -- Sneak
    -- ------------------------
    {
        "ggandor/lightspeed.nvim",
        function()
            require("plugins._lightspeed")
        end,
    },

    -- Increment and decrement
    -- ------------------------
    {
        "monaqa/dial.nvim",
        function()
            require("plugins._dial")
        end,
    },

    -- gf like plugins
    -- ------------------------
    {
        "notomo/curstr.nvim",
        function()
            require("plugins._curstr")
        end
    },

    -- Show Color
    -- ------------------------
    {
        "RRethy/vim-hexokinase",
        function()
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
        config = function()
            vim.fn.system({"make", "hexokinase"})
        end
    },

    -- ====================================================== Git

    -- Show added, deleted, changed diff
    -- ------------------------
    {
        "lewis6991/gitsigns.nvim",
        function()
            require("plugins._gitsigns")
        end,
        requires = "nvim-lua/plenary.nvim",
    },

    -- Lazygit wrapper
    -- ------------------------
    {
        "kdheepak/lazygit.nvim",
        function()
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
        function()
            require("gitlinker").setup({
                mappings = "<leader>gw",
            })
        end,
    },

    -- Vim Fugitive
    -- ----------------------
    {
        "tpope/vim-fugitive",
        function()
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
        function()
            require("plugins._neoscroll")
        end,
    },

    -- Better Window And Buffer Management
    -- ------------------------
    {
        "mhinz/vim-sayonara",
        function()
            local opts = { silent = true }
            nnoremap("<C-w><C-w>", "<CMD>Sayonara<CR>", opts, "Close Window/Buffer/Vim")
        end,
    },

    -- Escape From Insert Mode Without Delay When Typing
    -- ------------------------
    {
        "max397574/better-escape.nvim",
        function()
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
        function()
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
        function()
            vim.g.suda_smart_edit = 1
            vim.g["suda#prompt"] = "[Suda] Password : "
        end,
    },

    -- Terminal Markdown Previewer
    -- ------------------------
    {
        "npxbr/glow.nvim",
        function()
            nnoremap("<leader>pm", "<CMD>Glow<CR>", "silent", "Preview File With Glow")
        end,
    },

    -- Markdown Previewer
    -- ------------------------
    {
        "iamcco/markdown-preview.nvim",
        function()
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
        function()
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

    -- Startuptime
    -- ------------------------
    {
        "tweekmonster/startuptime.vim",
    },
}, 300)
