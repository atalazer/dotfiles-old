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
    matchup = {
        enable = true,
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        config = {
            lua  = "-- %s",
            zsh   = "# %s",
            toml  = "# %s",
            xdefaults = "! %s"
        }
    },
})

