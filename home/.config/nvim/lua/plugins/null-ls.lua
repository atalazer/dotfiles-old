local null_ls = require("null-ls")
local h = require("null-ls.helpers")
local m = null_ls.methods
local b = null_ls.builtins

vim.env.PRETTIERD_DEFAULT_CONFIG = vim.fn.stdpath("config") .. "/.prettierrc"

local shfmt = h.make_builtin({
    method = m.FORMATTING,
    filetypes = { "sh", "zsh", "bash" },
    generator_opts = {
        command = "shfmt",
        args = { "-i", vim.bo.shiftwidth or 2, "-s", "$FILENAME" },
        to_stdin = true,
    },
    factory = h.formatter_factory,
})

local sources = {
    shfmt,
    b.formatting.black,
    b.formatting.prettierd.with({
        filetypes = {
            "typescript",
            "javascript",
            "json",
            "css",
            "html",
        },
    }),
    b.formatting.stylua.with({
        args = {
            "--config-path",
            vim.env.HOME .. "/.config/nvim/.stylua.toml",
            "-",
        },
    }),
}

null_ls.setup({
    sources = sources,
})
