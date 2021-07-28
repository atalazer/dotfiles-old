local packpath = vim.fn.stdpath("data") .. "/site/pack"

-- Ensures a given github.com/USER/REPO is cloned in the pack/packer/start directory.
local ensure = function(user, repo)
    local install_path = string.format("%s/packer/opt/%s", packpath, repo)
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.cmd(string.format(
            [[
            !git clone https://github.com/%s/%s %s
            packadd %s
        ]],
            user,
            repo,
            install_path,
            repo
        ))
    end
end

-- Bootstrap essential plugins required for installing and loading the rest.
ensure("wbthomason", "packer.nvim")

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
    profile = {
        enable = true,
    },
})

local plugins = {
    -- ======= Base =======
    -- Package Manager
    {
        "wbthomason/packer.nvim",
        opt = true,
    },

    { "nvim-lua/popup.nvim", module = "popup" },
    { "nvim-lua/plenary.nvim", module = "plenary" },

    -- ======= User Interface =======
    -- Colorscheme
    {
        "~/Work/Repos/xresources-nvim",
        event = "VimEnter",
        config = function()
            require("xresources").colorscheme()
        end,
    },

    -- Dashboard
    {
        "glepnir/dashboard-nvim",
        cmd = { "Dashboard", "SessionLoad", "SessionSave" },
        config = function()
            require("plugins.dashboard")
        end,
    },

    -- vim-devicons written in lua
    {
        "kyazdani42/nvim-web-devicons",
        module = "nvim-web-devicons",
        requires = {
            { "yamatsum/nvim-nonicons", after = "nvim-web-devicons" },
        },
        config = function()
            require("nvim-web-devicons").setup({ default = true })
        end,
    },

    -- Snazzy bufferline
    {
        "akinsho/nvim-bufferline.lua",
        event = "BufReadPre",
        wants = "nvim-web-devicons",
        config = function()
            require("plugins.bufferline")
        end,
    },

    -- Beautiful Statusline with Animation
    {
        "windwp/windline.nvim",
        event = "BufReadPre",
        config = function()
            require("plugins.windline")
        end,
    },

    -- Indenting
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPre",
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
        event = "InsertEnter",
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

    -- gf like plugins
    {
        "notomo/curstr.nvim",
        config = function()
            require("plugins.curstr")
        end,
    },

    -- Show Color
    {
        "norcalli/nvim-colorizer.lua",
        event = "ColorScheme",
        config = function()
            require("colorizer").setup({
                "*", -- Highlight all files, but customize some others.
                css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
                html = { names = false }, -- Disable parsing "names" like Blue or Gray
            })
        end,
    },

    -- Sort html tailwind class
    {
        "steelsojka/headwind.nvim",
        opt = true,
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
    -- Semantic highlight
    {
        "nvim-treesitter/nvim-treesitter",
        opt = true,
        run = ":TSUpdate",
        requires = {
            {
                "nvim-treesitter/nvim-treesitter-refactor",
                after = "nvim-treesitter",
            },
            {
                "nvim-treesitter/playground",
                after = "nvim-treesitter",
                cmd = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" },
            },
            {
                "JoosepAlviste/nvim-ts-context-commentstring",
                after = "vim-commentary",
            },
            {
                "windwp/nvim-ts-autotag",
                after = "nvim-autopairs",
            },
        },
        config = function()
            require("plugins.treesitter")
        end,
    },

    -- LaTeX Support with Texlab LSP
    {
        "jakewvincent/texmagic.nvim",
        opt = true,
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

    -- nim Support
    {
        "alaviss/nim.nvim",
        opt = true,
        ft = "nim",
    },

    -- Org.mode for nvim
    {
        "kristijanhusak/orgmode.nvim",
        opt = true,
        ft = "org",
        config = function()
            require("orgmode").setup({
                org_agenda_files = { "~/Sync/Notes/Org/*", "~/Documents/Notes/Org/*" },
                org_default_notes_file = "~/Sync/Notes/Org/Notes.org",
            })
        end,
    },

    -- Markdown Support
    {
        "plasticboy/vim-markdown",
        opt = true,
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
        opt = true,
        ft = { "text", "markdown" },
    },

    -- Terminal Markdown Previewer
    {
        "npxbr/glow.nvim",
        ft = "markdown",
        cmd = "Glow",
    },

    -- Markdown Previewer
    {
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
        ft = "markdown",
        setup = function()
            vim.g.mkdp_auto_start = 0
            vim.g.mkdp_auto_close = 0
            vim.g.mkdp_refresh_slow = 0
            vim.g.mkdp_browser = "firefox"
        end,
    },

    -- ======= LSP, Completion and Snippet =======
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        wants = { "lspsaga.nvim", "lspkind-nvim", "lsp-trouble.nvim", "symbols-outline.nvim" },
        requires = {
            {
                "glepnir/lspsaga.nvim",
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
        wants = "nvim-web-devicons",
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
        after = "nvim-lspconfig",
        wants = "plenary.nvim",
        config = function()
            require("plugins.null-ls")
        end,
    },

    {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        wants = { "orgmode.nvim", "vim-vsnip" },
        requires = {
            {
                "hrsh7th/vim-vsnip",
                event = "InsertCharPre",
                requires = { "rafamadriz/friendly-snippets", event = "InsertCharPre" },
                setup = function()
                    vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/snippets"
                    vim.g.vsnip_filetypes = {}

                    local keymap = vim.api.nvim_set_keymap
                    keymap("i", "<C-]>", 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<C-]>"', { expr = true })
                    keymap("s", "<C-]>", 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<C-]>"', { expr = true })
                    keymap("i", "<C-[>", 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-[>"', { expr = true })
                    keymap("s", "<C-[>", 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-[>"', { expr = true })
                end,
            },
        },
        config = function()
            require("plugins.compe")
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

    -- ======= Files =======
    -- Fuzzy Finder
    {
        "nvim-telescope/telescope.nvim",
        module = "telescope",
        cmd = "Telescope",
        keys = {
            "<Leader>f",
        },
        wants = {
            "popup.nvim",
            "plenary.nvim",
            "telescope-fzf-native.nvim",
            "telescope-media-files.nvim",
            "telescope-frecency.nvim",
        },
        config = function()
            require("plugins.telescope")
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        cmd = "Telescope",
        run = "make",
    },
    {
        "nvim-telescope/telescope-frecency.nvim",
        cmd = "Telescope",
        requires = "tami5/sql.nvim",
    },
    {
        "nvim-telescope/telescope-media-files.nvim",
        cmd = "Telescope",
    },

    -- Superfast Tree File
    {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        wants = "nvim-web-devicons",
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
        event = "BufReadPre",
        wants = "plenary.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
        },
        config = function()
            require("plugins.gitsigns")
        end,
    },

    {
        "kdheepak/lazygit.nvim",
        cmd = { "LazyGit", "LazyGitFilter" },
        setup = function()
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
    },

    -- vim which key
    {
        "folke/which-key.nvim",
        event = "BufWinEnter",
        config = function()
            require("plugins.which-key")
        end,
    },

    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        wants = "twilight.nvim",
        requires = {
            "folke/twilight.nvim",
            cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
        },
        config = function()
            require("zen-mode").setup({
                plugins = {
                    gitsigns = { enabled = false },
                    kitty = {
                        enabled = true,
                        font = "+2", -- font size increment
                    },
                },
                on_open = function(win)
                    vim.cmd("TwilightEnable")
                    vim.cmd("IndentBlanklineDisable")
                end,
                on_close = function()
                    vim.cmd("TwilightDisable")
                    vim.cmd("IndentBlanklineEnable")
                end,
            })
        end,
    },

    -- Vim Silicon, Generate Image Source Code
    {
        "segeljakt/vim-silicon",
        cmd = "Silicon",
        setup = function()
            vim.g.silicon = {
                theme = "Dracula",
                font = "JetBrainsMono Nerd Font",
                background = "#a999ff",
                ["shadow-color"] = "#434434",
                ["line-pad"] = 2,
                ["pad-horiz"] = 40,
                ["pad-vert"] = 50,
                ["shadow-blur-radius"] = 0,
                ["shadow-offset-x"] = 0,
                ["shadow-offset-y"] = 0,
                ["line-number"] = true,
                ["round-corner"] = true,
                ["window-controls"] = true,
            }
            vim.g.silicon["output"] = os.getenv("HOME") .. "/Pictures/Screenshots/silicon-{time:%Y-%m-%d-%H%M%S}.png"
        end,
    },

    -- Startuptime
    {
        "tweekmonster/startuptime.vim",
        cmd = "StartupTime",
    },
}

packer.startup(function(use)
    for _, v in pairs(plugins) do
        use(v)
    end
end)
