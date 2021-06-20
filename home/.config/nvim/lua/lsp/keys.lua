local k = vim.keymap
local nnoremap = k.nnoremap
local inoremap = k.inoremap

local M = {}

local buf        = vim.lsp.buf
local hover      = require("lspsaga.hover")
local signature  = require("lspsaga.signaturehelp")
local rename     = require("lspsaga.rename")
local diagnostic = require("lspsaga.diagnostic")
local provider   = require("lspsaga.provider")

M.mappings = function()
    inoremap({ "<C-l>", signature.signature_help, { silent = true } })
    nnoremap({ "<leader>lk", hover.render_hover_doc, { silent = true } })
    nnoremap({ "<leader>lr", rename.rename, { silent = true } })
    nnoremap({ "<leader>lf", provider.lsp_finder, { silent = true } })
    nnoremap({ "<leader>ld", provider.preview_definition, { silent = true } })
    nnoremap({ "<leader>ll", diagnostic.show_line_diagnostics, { silent = true } })
    nnoremap({ "<leader>l[", diagnostic.lsp_jump_diagnostic_prev, { silent = true } })
    nnoremap({ "<leader>l]", diagnostic.lsp_jump_diagnostic_next, { silent = true } })
    nnoremap({ "<leader>lD", buf.definition, { silent = true } })
    nnoremap({ "<leader>gf", buf.formatting, { silent = true } })
    nnoremap({ "<leader>la", require("telescope.builtin").lsp_code_actions, { silent = true } })
    nnoremap({ "<leader>lF", require("telescope.builtin").lsp_references, { silent = true } })
    nnoremap({ "<leader>lT", "<Cmd>TroubleToggle<CR>", { silent = true } })
    nnoremap({ "<leader>lS", "<Cmd>SymbolsOutline<CR>", { silent = true } })
end

return M
