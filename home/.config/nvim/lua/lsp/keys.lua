local k = vim.keymap
local nnoremap = k.nnoremap
local inoremap = k.inoremap
local vnoremap = k.vnoremap
local telescope = require("telescope.builtin")

local M = {}

M.mappings = function()
    inoremap({ "<C-l>", vim.lsp.buf.signature_help, { silent = true } })
    nnoremap({ "K", vim.lsp.buf.hover, { silent = true } })
    nnoremap({ "<Leader>la", telescope.lsp_code_actions, { silent = true } })
    nnoremap({ "<Leader>gf", vim.lsp.buf.formatting_seq_sync, { silent = true } })
    vnoremap({ "<Leader>gf", vim.lsp.buf.range_formatting, { silent = true } })
    nnoremap({ "<Leader>ld", vim.lsp.buf.definition, { silent = true } })
    nnoremap({ "<Leader>lc", vim.lsp.codelens.run, { silent = true } })
    nnoremap({ "<Leader>lr", telescope.lsp_references, { silent = true } })
    nnoremap({ "<Leader>lR", vim.lsp.buf.rename, { silent = true } })
    nnoremap({ "<Leader>lt", "<Cmd>TroubleToggle<CR>", { silent = true } })
    nnoremap({
        "<Leader>ll",
        function()
            vim.lsp.diagnostic.show_line_diagnostics({
                show_header = false,
                border = Util.borders,
            })
        end,
        { silent = true },
    })
    nnoremap({
        "<Leader>l]",
        function()
            vim.lsp.diagnostic.goto_next({
                popup_opts = {
                    show_header = false,
                    border = Util.borders,
                },
            })
        end,
        { silent = true },
    })
    nnoremap({
        "<Leader>l[",
        function()
            vim.lsp.diagnostic.goto_prev({
                popup_opts = {
                    show_header = false,
                    border = Util.borders,
                },
            })
        end,
        { silent = true },
    })
end

return M
