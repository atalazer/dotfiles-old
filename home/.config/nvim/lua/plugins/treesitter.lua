local tsc = require("nvim-treesitter.configs")

require("nvim-treesitter.install").compilers = { vim.fn.getenv("CC"), "cc", "gcc", "clang", "cl" }

tsc.setup({
    ensure_installed = {
        "javascript",
        "typescript",
        "svelte",
        "tsx",
        "html",
        "css",
        "scss",
        "cpp",
        "c",
        "go",
        "rust",
        "python",
        "lua",
        "bash",
        "toml",
        "yaml",
        "latex",
        "nix",
        "json",
        "jsonc",
        "query",
        "comment",
    },
    matchup = { enable = true },
    autopairs = { enable = true },
    autotag = { enable = true },
    highlight = { enable = true },
    indent = { enable = true },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<Enter>",
            node_incremental = "<Enter>",
            node_decremental = "<BS>",
        },
    },

    refactor = {
        highlight_definitions = { enable = false },
        highlight_current_scope = { enable = false },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "gR",
            },
        },
        navigation = {
            enable = false,
            keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
                list_definitions_toc = "gO",
                goto_next_usage = "<a-*>",
                goto_previous_usage = "<a-#>",
            },
        },
    },
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",

                -- Or you can define your own textobjects like this
                ["iF"] = {
                    python = "(function_definition) @function",
                    cpp = "(function_definition) @function",
                    c = "(function_definition) @function",
                    java = "(method_declaration) @function",
                },
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
        lsp_interop = {
            enable = true,
            border = "none",
            peek_definition_code = {
                ["df"] = "@function.outer",
                ["dF"] = "@class.outer",
            },
        },
    },
})

require("tsht").config.hint_keys = { "h", "j", "f", "d", "n", "v", "s", "l", "a" }

vim.cmd([[
  omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
  vnoremap <silent> m :lua require('tsht').nodes()<CR>
]])
