vim.cmd[[packadd nvim-treesitter]]
vim.cmd [[packadd nvim-ts-autotag]]

local ts_config = require("nvim-treesitter.configs")
ts_config.setup {
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
        filetypes = {
            "javascript",
            "html", "xml", "markdown",
        },
    },
}
