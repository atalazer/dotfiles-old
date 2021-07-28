local null_ls = require("null-ls")
local h = require("null-ls.helpers")
local m = null_ls.methods
local b = null_ls.builtins

vim.env.PRETTIERD_DEFAULT_CONFIG = vim.fn.stdpath("config") .. "/.prettierrc"

null_ls.setup({
    sources = {
        b.code_actions.gitsigns,
        b.formatting.trim_whitespace.with({ 
            filetypes = { "sh", "bash", "zsh" } 
        }),
        b.formatting.shfmt.with({
            filetypes = { "sh", "bash", "zsh" },
            args = { "-i", vim.bo.shiftwidth or 2, "-s", "$FILENAME" },
        }),
        b.formatting.black,
        -- b.formatting.prettierd,
        b.formatting.prettier_d_slim,
        b.formatting.stylua.with({
            args = {
                "--config-path",
                vim.env.HOME .. "/.config/nvim/.stylua.toml",
                "-",
            },
        }),
    }
})

require("lspconfig")["null-ls"].setup({
    on_attach = function()
        print("LSP Attached!")

        local k = vim.keymap
        local nnoremap = k.nnoremap
        local buf = vim.lsp.buf
        nnoremap({ "<leader>gf", buf.formatting, { silent = true } })
    end,
})
