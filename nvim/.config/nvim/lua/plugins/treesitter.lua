vim.cmd[[packadd nvim-treesitter]]
vim.cmd[[packadd nvim-treesitter-textobjects]]

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
                ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner",
            },
        },
        lsp_interop = {
            enable = true,
        },
    },
}
