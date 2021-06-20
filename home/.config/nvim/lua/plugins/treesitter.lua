local tsc = require("nvim-treesitter.configs")

tsc.setup({
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
                goto_next_usage = "<a-*>",
                goto_previous_usage = "<a-#>",
            },
        },
    },
})

