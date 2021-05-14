-- ========================================================
vim.cmd("packadd nvim-treesitter")
vim.cmd("packadd nvim-ts-context-commentstring")
vim.cmd("packadd nvim-ts-autotag")

require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "javascript", "typescript",
        "html", "css", "scss",
        "bash", "python", "lua",
        "toml", "yaml", "json",
        "comment", "regex"
    },
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = {
        enable = true,
        filetypes = { "html", "xml" },
    },
    autotag = {
        enable = true,
        filetypes = { "html" , "xml" },
    },
    context_commentstring = {
        enable = true,
        config = {
            css  = "// %s",
            lua  = "-- %s",
            sh, bash, zsh   = "# %s",
            toml  = "# %s",
        }
    },
})

