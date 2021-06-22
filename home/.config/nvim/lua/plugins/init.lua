vim.cmd("packadd packer.nvim")

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
    return
end

packer.init({
    transitive_opt = false,
    git = {
        clone_timeout = 300, -- 5 minutes, I have horrible internet
    },
    display = {
        open_fn = function()
            return require("packer.util").float({ border = Util.borders })
        end,
    },
})

local plugins = {
    -- ======= Base =======
    -- Package Manager
    { "wbthomason/packer.nvim", opt = true },

    -- SQLite/LuaJIT binding for lua and neovim
    { "tami5/sql.nvim" },

    -- ======= User Interface =======
    -- Colorscheme
    {
        -- "nekonako/xresources-nvim",
        "~/Work/Repos/xresources-nvim",
        event = "VimEnter",
        config = function()
            require("xresources").colorscheme()
        end,
    },

    -- {
    --     "rktjmp/lush.nvim",
    --     event = "VimEnter",
    --     requires = { "~/Work/Repos/wally.nvim" },
    --     config = function()
    --         require("lush")(require("lush_theme.wally")) -- activate the colourscheme
    --     end,
    -- },

    -- vim-devicons written in lua
    {
        "kyazdani42/nvim-web-devicons",
        after = "xresources-nvim",
        config = function()
            require("nvim-web-devicons").setup({ default = true })
        end,
        requires = {
            -- requires nonicons font installed
            { "yamatsum/nvim-nonicons", after = "nvim-web-devicons" },
        },
    },

    -- Beautiful Statusline with Animation
    {
        "windwp/windline.nvim",
        after = { "xresources-nvim", "nvim-web-devicons" },
        config = function()
            require("wlsample.evil_line")
        end,
    },

    -- Snazzy bufferline
    {
        "akinsho/nvim-bufferline.lua",
        after = { "xresources-nvim", "nvim-web-devicons" },
        config = function()
            require("plugins.bufferline")
        end,
    },

    -- Indenting
    {
        "lukas-reineke/indent-blankline.nvim",
        branch = "lua",
        after = "xresources-nvim",
        config = function()
            require("plugins.indent-blankline")
        end,
    },

    -- ======= Experience =======
    -- Easy Commenting
    { "tpope/vim-commentary", keys = "gc" },

    -- Align
    { "junegunn/vim-easy-align", keys = "<Plug>(EasyAlign)" },

    -- Sandwiched textobjects.
    { "machakann/vim-sandwich", keys = "s" },

    -- Neovim Autopair Plugin
    {
        "windwp/nvim-autopairs",
        after = "nvim-treesitter",
        config = function()
            require("plugins.autopairs")
        end,
    },

    -- Vim easy motion
    {
        "phaazon/hop.nvim",
        cmd = { "HopWord", "HopPattern" },
        config = function()
            require("hop").setup({})
        end,
    },

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

    -- gf like plugins
    {
        "notomo/curstr.nvim",
        event = "CursorHold",
        config = function()
            require("plugins.curstr")
        end,
    },

    {
        "norcalli/nvim-colorizer.lua",
        event = "BufRead",
        config = function()
            require("colorizer").setup({
                ["*"] = {
                    names = false,
                    RGB = true,
                    RRGGBB = true,
                    RRGGBBAA = true,
                    rgb_fn = true,
                    hsl_fn = true,
                    css = true,
                    css_fn = true,
                    mode = "background",
                },
                css = { names = true },
                html = { names = true },
            })
        end,
    },

    {
        "steelsojka/headwind.nvim",
        ft = "html",
        config = function()
            require("headwind").setup({
                remove_duplicates = true,
                run_on_save = true,
                use_treesitter = true,
            })
        end,
    },

    -- ======= Languange =======
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        requires = {
            {
                "nvim-treesitter/nvim-treesitter-refactor",
                after = "nvim-treesitter"
            },
            {
                "nvim-treesitter/playground",
                after = "nvim-treesitter",
                cmd = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" },
            },
            {
                "JoosepAlviste/nvim-ts-context-commentstring",
                after = "vim-commentary"
            },
            {
                "windwp/nvim-ts-autotag",
                after = "nvim-autopairs"
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

    {
        "plasticboy/vim-markdown",
        ft = "markdown",
        config = function()
            vim.g.vim_markdown_folding_disabled = 1
            vim.g.vim_markdown_frontmatter = 1
            vim.g.vim_markdown_math = 1
        end,
    },

    -- Vim Table mode
    {
        "dhruvasagar/vim-table-mode",
        ft = { "text", "markdown" } ,
    },

    -- Terminal Markdown Previewer
    {
        "npxbr/glow.nvim",
        branch = "main",
        run = ":GlowInstall",
        ft = "markdown",
    },

    -- Markdown Previewer
    {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = "markdown",
        config = function()
            vim.g.mkdp_auto_start = 0
            vim.g.mkdp_auto_close = 0
            vim.g.mkdp_refresh_slow = 0
            vim.g.mkdp_browser = "firefox"
        end,
    },

    -- ======= LSP, Completion and Snippet =======
    {
        "neovim/nvim-lspconfig",
        event = "BufRead",
        requires = {
            {
                "glepnir/lspsaga.nvim",
                after = "nvim-lspconfig",
            },

            {
                "ray-x/lsp_signature.nvim",
                after = "nvim-lspconfig",
            },

            {
                "onsails/lspkind-nvim",
                after = "nvim-lspconfig",
            },
        },
        config = function()
            require("lsp")
        end,
    },

    {
        "folke/lsp-trouble.nvim",
        cmd = { "Trouble", "TroubleToggle" },
        config = function()
            require("plugins.trouble")
        end,
    },
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        config = function()
            require("symbols-outline").setup({
                highlight_hovered_item = true,
                show_guides = true,
            })
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        ft = {
            "typescript", "javascript",
            "json", "markdown",
            "css", "html",
            "lua", "python",
            "sh", "bash", "zsh"
        },
        config = function()
            require("plugins.null-ls")
        end,
    },

    {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function()
            require("plugins.compe")
        end,
    },

    {
        "hrsh7th/vim-vsnip",
        event = "InsertCharPre",
        requires = { "rafamadriz/friendly-snippets", after = "vim-vsnip" },
        config = function()
            require("plugins.vsnip")
        end,
    },

    {
        "mattn/emmet-vim",
        cmd = "EmmetInstall",
        config = function()
            vim.g.user_emmet_install_global = 0
            vim.g.user_emmet_mode = "a"
            vim.g.user_emmet_leader_key = ","
        end,
    },

    -- ======= Files =======
    -- Fuzzy Finder
    {
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                after = "telescope.nvim",
                run = "make",
            },
            {
                "nvim-telescope/telescope-media-files.nvim",
                after = "telescope.nvim"
            },
            {
                "nvim-telescope/telescope-frecency.nvim",
                after = "telescope.nvim"
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
        config = function()
            require("plugins.nvim-tree")
        end,
    },

    -- Open root previllage files
    {
        "lambdalisue/suda.vim",
        cmd = { "SudaRead", "SudaWrite" },
        config = function()
            vim.g.suda_smart_edit = 1
            vim.g["suda#prompt"] = "Password : "
        end,
    },

    -- ======= Git =======
    -- show git stuff in signcolumn
    {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        config = function()
            require("plugins.gitsigns")
        end,
    },

    {
        "kdheepak/lazygit.nvim",
        cmd = { "LazyGit", "LazyGitFilter" },
        config = function()
            vim.g.lazygit_floating_window_winblend = 0
            vim.g.lazygit_floating_window_scaling_factor = 0.80
            vim.g.lazygit_floating_window_corner_chars = { "╭", "╮", "╰", "╯" }
            vim.g.lazygit_floating_window_use_plenary = 0
            vim.g.lazygit_use_neovim_remote = 0
        end,
    },

    -- ======= Misc =======
    -- Smooth Scrolling
    {
        "psliwka/vim-smoothie",
        after = "xresources-nvim",
        config = function()
            vim.g.smoothie_update_interval = 30
            vim.g.smoothie_speed_constant_factor = 10
            vim.g.smoothie_speed_linear_factor = 10
        end,
    },

    -- better window and buffer management
    {
        "mhinz/vim-sayonara",
        cmd = "Sayonara",
    },

    -- Highlight, list and search todo comments in your projects
    {
        "folke/todo-comments.nvim",
        cmd = { "TodoQuickFix", "TodoTelescope", "TodoTrouble" },
        config = function()
            require("plugins.todo-comments")
        end,
    },

    -- vim which key
    {
        "folke/which-key.nvim",
        event = "BufRead",
        config = function()
            require("plugins.which-key")
        end,
    },

    -- Free Distraction Mode
    {
        "junegunn/goyo.vim",
        cmd = "Goyo",
        requires = {
            {
                "junegunn/limelight.vim",
                cmd = "Limelight"
            },
        },
        config = function()
            vim.g.goyo_width = "120"
            vim.g.goyo_height = "90%"
            vim.cmd([[
                autocmd! User GoyoEnter Limelight
                autocmd! User GoyoLeave Limelight!
            ]])
        end,
    },

    -- Startuptime
    {
        "tweekmonster/startuptime.vim",
        cmd = "StartupTime"
    },
}

packer.startup(function(use)
    for _, v in pairs(plugins) do
        use(v)
    end
end)
