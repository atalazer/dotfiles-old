local M = {}

M.setup = function()
    local null_ls = require("null-ls")

    -- local h = require("null-ls.helpers")
    -- local m = null_ls.methods
    local b = null_ls.builtins

    vim.env.PRETTIERD_DEFAULT_CONFIG = vim.fn.stdpath("config") .. "/.prettierrc"

    null_ls.setup({
        sources = {
            -- b.code_actions.gitsigns,
            b.diagnostics.shellcheck,
            b.diagnostics.eslint.with({
                command = "eslint_d",
            }),
            b.formatting.black,
            b.formatting.nixfmt,
            b.formatting.prettier,
            -- b.formatting.prettierd,
            b.formatting.shfmt.with({
                filetypes = { "sh", "bash", "zsh" },
                args = { "-i", vim.bo.shiftwidth or 4, "-s", "$FILENAME" },
            }),
            b.formatting.stylua.with({
                args = {
                    "--config-path",
                    vim.env.HOME .. "/.config/nvim/.stylua.toml",
                    "-",
                },
            }),
            b.formatting.trim_whitespace.with({
                filetypes = { "sh", "bash", "zsh", "lua", "vim", "python" },
            }),
        },
    })
end

return M
