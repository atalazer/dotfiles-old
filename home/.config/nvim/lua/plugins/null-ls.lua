local M = {}

M.setup = function()
    local null_ls = require("null-ls")
    -- local h = require("null-ls.helpers")
    -- local m = null_ls.methods
    local b = null_ls.builtins

    vim.env.PRETTIERD_DEFAULT_CONFIG = vim.fn.stdpath("config") .. "/.prettierrc"

    null_ls.setup({
        debounce = 150,
        sources = {
            b.code_actions.gitsigns,
            b.diagnostics.eslint.with({
                command = "eslint_d",
            }),
            b.formatting.trim_whitespace.with({
                filetypes = { "sh", "bash", "zsh" },
            }),
            b.formatting.shfmt.with({
                filetypes = { "sh", "bash", "zsh" },
                args = { "-i", vim.bo.shiftwidth or 4, "-s", "$FILENAME" },
            }),
            b.formatting.black,
            b.formatting.prettierd.with({
                filetypes = {
                    "typescriptreact",
                    "typescript",
                    "javascriptreact",
                    "javascript",
                    "svelte",
                    "json",
                    "jsonc",
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
        },
    })
end

return M
