vim.cmd[[packadd lspsaga.nvim]]
vim.cmd[[packadd telescope.nvim]]

local k = require("astronauta.keymap")
local nnoremap = k.nnoremap
local inoremap = k.inoremap

local M = {}

local hover      = require("lspsaga.hover")
local signature  = require("lspsaga.signaturehelp")
local rename     = require("lspsaga.rename")
local diagnostic = require("lspsaga.diagnostic")
local provider   = require("lspsaga.provider")

M.lsp_mappings = function(type)
    inoremap({ "<C-l>s", signature.signature_help, { silent = true } })
    nnoremap({ "lk", hover.render_hover_doc, { silent = true } })
    nnoremap({ "ld", provider.preview_definition, { silent = true } })
    nnoremap({ "lD", vim.lsp.buf.definition, { silent = true } })
    nnoremap({ "ll", diagnostic.show_line_diagnostics, { silent = true } })
    nnoremap({ "lr", rename.rename, { silent = true } })
    nnoremap({ "la", ":Lspsaga code_action", { silent = true } })
    nnoremap({ "lF", require("telescope.builtin").lsp_references, { silent = true } })
    nnoremap({ "lf", provider.lsp_finder, { silent = true } })
    nnoremap({ "l]", diagnostic.lsp_jump_diagnostic_next, { silent = true } })
    nnoremap({ "l[", diagnostic.lsp_jump_diagnostic_prev, { silent = true } })
end

return M