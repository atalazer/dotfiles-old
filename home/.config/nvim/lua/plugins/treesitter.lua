require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "javascript", "typescript", "tsx",
        "html", "css", "scss",
        "cpp", "c", "go", "rust",
        "python", "lua",
        "bash", "fish",
        "toml", "yaml", "latex",
        "json", "jsdoc", "jsonc",
        "query", "comment", "regex"
    },
    matchup = {
        enable = true,
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    autopairs = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        config = {
            lua  = "-- %s",
        }
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<Enter>",
            node_incremental = "<Enter>",
            node_decremental = "<BS>",
        },
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<Leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<Leader>A"] = "@parameter.inner",
            },
        },
        lsp_interop = {
            enable = true,
        },
    },
    refactor = {
        highlight_definitions = { enable = false },
        highlight_current_scope = { enable = false },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            },
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
                list_definitions_toc = "gO",
                goto_next_usage = "<M-(>",
                goto_previous_usage = "<M-)>",
            },
        },
    },
})

