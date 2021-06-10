require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "javascript", "typescript", "tsx",
        "html", "css", "scss",
        "cpp", "c", "go", "rust",
        "python", "lua",
        "bash", "fish",
        "toml", "yaml",
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

})

