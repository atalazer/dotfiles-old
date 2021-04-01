vim.cmd[[packadd nvim-treesitter]]
vim.cmd[[packadd nvim-ts-autotag]]

require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "c", "rust", "go", "cpp",
        "python", "lua",
        "javascript", "html", "css",
        "json", "yaml", "toml",
        "bash",
    },
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
}
