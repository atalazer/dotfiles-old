vim.cmd('packadd packer.nvim')
local ok, packer = pcall(require, "packer")

if ok then
    local use = packer.use
    packer.init({
        git = {
            clone_timeout = 150, -- Timeout, in seconds, for git clones
        },
        display = {
            open_cmd      = 'leftabove 70vnew [packer]',
            working_sym   = '⟳', -- The symbol for a plugin being installed/updated
            error_sym     = '✗', -- The symbol for a plugin with an error in installation/updating
            done_sym      = '✓', -- The symbol for a plugin which has completed installation/updating
            removed_sym   = '-', -- The symbol for an unused plugin which was removed
            moved_sym     = '→ ', -- The symbol for a plugin which was moved (e.g. from opt to start)
            header_sym    = '━', -- The symbol for the header line in packer's display
            keybindings   = { -- Keybindings for the display window
                quit          = 'q',
                toggle_info   = '<Space>',
                prompt_revert = 'r',
            }
        },
    })

    local plugins = function()
        use {'wbthomason/packer.nvim', opt = true}

        -- ------------------------------- UI Related
        use {'ayu-theme/ayu-vim' }
        use {'nekonako/xresources-nvim'}
        use {'tjdevries/colorbuddy.vim'}
        use {'Th3Whit3Wolf/onebuddy'}

        use {'kyazdani42/nvim-web-devicons', opt = true}            -- vim-devicons written in lua
        use {'romgrk/barbar.nvim', opt = true }                     -- Beautiful Tabline
        use {'akinsho/nvim-bufferline.lua', opt = true}
        use {'glepnir/galaxyline.nvim',
            branch = 'main', opt = true}                            -- Beautiful Statusline
        use {'adelarsq/neoline.vim', opt = true }
        use {'mhinz/vim-startify', opt = true}                      -- Startify
        use {'lukas-reineke/indent-blankline.nvim',
            branch = 'lua', opt = true }                            -- Indenting
        use {'glepnir/indent-guides.nvim', opt = true}
        use {'norcalli/nvim-colorizer.lua', opt = true }            -- Colorizer
        -- -------------------------------- LSP
        use {'neovim/nvim-lspconfig', opt = true}
        use {'glepnir/lspsaga.nvim', opt = true }
        use {'onsails/lspkind-nvim', opt = true}

        -- ------------------------------- Completion and Snippet
        use {'hrsh7th/nvim-compe', opt = true,
            requires = {'hrsh7th/vim-vsnip', 'hrsh7th/vim-vsnip-integ'},
        }                                                           -- Code Completion
        use {'nvim-lua/completion-nvim', opt = true,
            requires = {
                'steelsojka/completion-buffers',
                'kristijanhusak/completion-tags',
                'albertoCaroM/completion-tmux',
                'hrsh7th/vim-vsnip', 'hrsh7th/vim-vsnip-integ'
            }
        }
        -- ------------------------------- Languange
        use {'nvim-treesitter/nvim-treesitter', opt = true,
            run = ':TSUpdate',
            requires = {'nvim-treesitter/nvim-treesitter-textobjects'},
        }                                                           -- Semantic Highlighting
        use {'tami5/sql.nvim', opt = false}                         -- SQL Languange Support
        use {'plasticboy/vim-markdown', opt = true,
            ft = {'markdown'}
        }                                                           -- Markdown Languange Support
        use {'iamcco/markdown-preview.nvim', opt = true,
            ft = {'markdown'},
            run = 'cd app && yarn install',
            cmd = 'MarkdownPreview',
        }
        use {'junegunn/goyo.vim', opt = true,
            ft = {'text', 'markdown'},
        }                                                           -- Free Distraction-mode
        -- ------------------------------ Experience
        use {'editorconfig/editorconfig-vim', opt = true }
        use {'windwp/nvim-autopairs', opt = true }                  -- Autopairs
        use {'mg979/vim-visual-multi'}                              -- Multi Cursor
        use {'godlygeek/tabular'}                                   -- Align
        use {'phaazon/hop.nvim', opt = true}                        -- vim easy motion
        use {'b3nj5m1n/kommentary', opt = true}                     -- Eassy Commenting
        use {'sagarrakshe/toggle-bool', opt = true}                 -- Quick toggle boolean value
        use {'blackcauldron7/surround.nvim', opt = true}
        use {'lukas-reineke/format.nvim', opt = true }              -- Code formatter
        use {'glacambre/firenvim', opt = true,
            run = function() vim.fn['firenvim#install'](0) end,
        }                                                           -- Browser plugin
        -- ------------------------------- Files
        use {'kyazdani42/nvim-tree.lua', opt = true}                -- Superfast Tree File
        use {'nvim-telescope/telescope.nvim', opt = false,
            requires = {
                'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim',
                'nvim-telescope/telescope-media-files.nvim',
                'nvim-telescope/telescope-fzy-native.nvim',
                'nvim-telescope/telescope-frecency.nvim',
            },
        }                                                           -- Fuzzy Finder
        use {'lambdalisue/suda.vim', opt = true}                    -- Open root previllage files
        -- -------------------------------- Misc
        use {"tjdevries/astronauta.nvim", opt = false}       -- For keybindings
        use {'TaDaa/vimade', opt = true}                    -- Fade for unfocused window/buffer
        use {'psliwka/vim-smoothie', opt = false}           -- Smooth Scrolling
        use {'mhinz/vim-sayonara', cmd = "Sayonara",}       -- better window and buffer management
        use {'dstein64/vim-startuptime', opt = false}       -- Check startup time
        use {'liuchengxu/vim-which-key', opt = true}        -- Whick keys
    end

    packer.startup(plugins)
end

