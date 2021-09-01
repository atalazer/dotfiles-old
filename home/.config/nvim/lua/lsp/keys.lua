local k = vim.keymap
local nnoremap = k.nnoremap
local inoremap = k.inoremap
local vnoremap = k.vnoremap

local M = {}

local buf = vim.lsp.buf
local diagnostic = vim.lsp.diagnostic
local codelens = vim.lsp.codelens
local telescope = require("telescope.builtin")

M.mappings = function()
    inoremap({ "<C-l>", buf.signature_help, { silent = true } })
    nnoremap({ "K", buf.hover, { silent = true } })
    nnoremap({ "<Leader>la", telescope.lsp_code_actions, { silent = true } })
    nnoremap({ "<Leader>gf", buf.formatting_seq_sync, { silent = true } })
    vnoremap({ "<Leader>gf", buf.range_formatting, { silent = true } })
    nnoremap({ "<Leader>ld", buf.definition, { silent = true } })
    nnoremap({ "<Leader>lc", codelens.run, { silent = true } })
    nnoremap({ "<Leader>lr", telescope.lsp_references, { silent = true } })
    nnoremap({ "<Leader>lR", buf.rename, { silent = true } })
    nnoremap({ "<Leader>lt", "<Cmd>TroubleToggle<CR>", { silent = true } })
    nnoremap({
        "<Leader>ll",
        function()
            diagnostic.show_line_diagnostics({
                show_header = false,
                border = Util.borders,
            })
        end,
        { silent = true },
    })
    nnoremap({
        "<Leader>l]",
        function()
            diagnostic.goto_next({
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
            diagnostic.goto_prev({
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
