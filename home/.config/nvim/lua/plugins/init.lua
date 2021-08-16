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
    {
        "wbthomason/packer.nvim",
        opt = true,
    },

    { "nvim-lua/popup.nvim", module = "popup" },
    { "nvim-lua/plenary.nvim", module = "plenary" },

    {
        "rcarriga/nvim-notify",
        after = "xresources-nvim",
        config = function()
            vim.notify = require("notify")
        end,
    },

    -- ======= User Interface =======
    -- Colorscheme
    {
        "~/Documents/GitHub/xresources-nvim",
        event = "VimEnter",
        config = function()
            require("xresources").colorscheme()
        end,
    },

    -- Dashboard
    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        cmd = { "Dashboard", "SessionLoad", "SessionSave" },
        setup = function()
            require("plugins.dashboard")
            local map = function(lhs, rhs)
                vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true })
            end
            map("<F1>", "<CMD>SessionLoad last<CR>")
            map("<F2>", "<CMD>SessionSave last<CR>")
            map("<leader>sl", "<CMD>SessionLoad last<CR>")
            map("<leader>ss", "<CMD>SessionSave last<CR>")
        end,
    },

    -- vim-devicons written in lua
    {
        "kyazdani42/nvim-web-devicons",
        module = "nvim-web-devicons",
        requires = {
            { "yamatsum/nvim-nonicons", after = "xresources-nvim" },
        },
        config = function()
            require("nvim-web-devicons").setup({ default = true })
        end,
    },

    -- Snazzy bufferline
    {
        "akinsho/nvim-bufferline.lua",
        event = { "BufReadPre", "BufNewFile" },
        wants = "nvim-web-devicons",
        config = function()
            require("plugins.bufferline")
        end,
    },

    -- Beautiful Statusline with Animation
    {
        "windwp/windline.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("wlsample.evil_line")
        end,
    },

    -- Indenting
    {
        "lukas-reineke/indent-blankline.nvim",
        after = "xresources-nvim",
        setup = function()
            require("plugins.indent-blankline")
        end,
    },

    -- ======= Experience =======
    -- Easy Commenting
    { "tpope/vim-commentary", keys = "gc" },

    -- Align
    {
        "junegunn/vim-easy-align",
        keys = "<Plug>(EasyAlign)",
        setup = function()
            vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", { noremap = false, silent = true })
            vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", { noremap = false, silent = true })
        end,
    },

    -- Sandwiched textobjects.
    { "machakann/vim-sandwich" },

    -- Neovim Autopair Plugin
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("plugins.autopairs")
        end,
    },

    -- Vim easy motion
    {
        "phaazon/hop.nvim",
        keys = "gh",
        cmd = { "HopWord", "HopPattern" },
        setup = function()
            vim.api.nvim_set_keymap("n", "ghp", "<CMD>HopPattern<CR>", { noremap = true })
            vim.api.nvim_set_keymap("n", "ghw", "<CMD>HopWord<CR>", { noremap = true })
        end,
        config = function()
            require("hop").setup({})
        end,
    },

    {
        "ggandor/lightspeed.nvim",
        event = "BufReadPost",
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
                limit_ft_matches = 5,
                full_inclusive_prefix_key = "<c-x>",
                labels = nil,
                cycle_group_fwd_key = nil,
                cycle_group_bwd_key = nil,
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

    -- Better %
    {
        "andymass/vim-matchup",
        after = "nvim-treesitter",
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

    -- ======= Languange =======
    -- Semantic highlight
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufRead", "BufNewFile" },
        run = ":TSUpdate",
        requires = {
            {
                "nvim-treesitter/nvim-treesitter-refactor",
                after = "nvim-treesitter",
            },
            -- {
            --     "nvim-treesitter/playground",
            --     after = "nvim-treesitter",
            --     cmd = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" },
            -- },
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
    -- {
    --     "alaviss/nim.nvim",
    --     opt = true,
    --     ft = "nim",
    -- },

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
        cmd = "Glow",
        setup = function()
            local map = function(lhs, rhs)
                vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true })
            end
            map("<leader>gg", "<CMD>Glow<CR>")
        end,
        ft = "markdown",
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

    -- ======= LSP, Completion and Snippet =======
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        requires = {
            {
                "jose-elias-alvarez/null-ls.nvim",
                module = "null-ls",
                after = "nvim-lspconfig",
            },
            {
                "ray-x/lsp_signature.nvim",
                module = "lsp_signature",
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

    -- {
    --     "L3MON4D3/LuaSnip",
    --     opt = true,
    --     module_pattern = { "luasnip", "luasnip.*" },
    --     wants = "friendly-snippets",
    --     requires = {
    --         "rafamadriz/friendly-snippets",
    --         opt = true,
    --     },
    --     config = function()
    --         require("plugins.luasnip")
    --     end,
    -- },

    -- {
    --     "hrsh7th/nvim-cmp",
    --     requires = {
    --         { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
    --         { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
    --         { "hrsh7th/cmp-calc", after = "nvim-cmp" },
    --         { "hrsh7th/cmp-path", after = "nvim-cmp" },
    --         { "hrsh7th/cmp-emoji", after = "nvim-cmp" },
    --         {
    --             "hrsh7th/cmp-nvim-lsp",
    --             after = "nvim-cmp",
    --             config = function()
    --                 require("cmp_nvim_lsp").setup()
    --             end,
    --         },
    --     },
    --     config = function()
    --         require("plugins.cmp")
    --     end,
    -- },

    {
        "ms-jpq/coq_nvim",
        branch = "coq",
        requires = {
            {
                "ms-jpq/coq.artifacts",
                branch = "artifacts",
            },
        },
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
        module_pattern = { "telescope", "telescope.*" },
        cmd = "Telescope",
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
                cmd = "Telescope",
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
        event = { "BufRead", "BufNewFile" },
        wants = "plenary.nvim",
        config = function()
            require("plugins.gitsigns")
        end,
    },

    {
        "kdheepak/lazygit.nvim",
        cmd = { "LazyGit" },
        setup = function()
            vim.g.lazygit_floating_window_winblend = 0
            vim.g.lazygit_floating_window_scaling_factor = 0.80
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
                vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true })
            end
            map("<leader>q", "<CMD>Sayonara!<CR>")
            map("<leader>qq", "<CMD>Sayonara<CR>")
            map("<M-w>", "<CMD>Sayonara<CR>")
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

    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        setup = function()
            local map = function(lhs, rhs)
                vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true })
            end
            map("<leader>gy", "<CMD>ZenMode<CR>")
        end,
        requires = {
            "folke/twilight.nvim",
            cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
        },
        config = function()
            require("zen-mode").setup({
                window = {
                    backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                    width = 120, -- width of the Zen window
                    height = 32, -- height of the Zen window
                    linebreak = true,
                    wrap = true,
                },
                plugins = {
                    options = {
                        enabled = true,
                        ruler = false,
                        showcmd = false,
                    },
                    gitsigns = { enabled = true }, -- disables git signs
                    tmux = { enabled = false }, -- disables the tmux statusline
                },
                on_open = function(win)
                    vim.api.nvim_win_set_option(win, "wrap", true)
                    vim.api.nvim_win_set_option(win, "linebreak", true)
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
