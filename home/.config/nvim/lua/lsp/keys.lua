vim.cmd[[packadd lspsaga.nvim]]

-- Keymap
local _Key = require("astronauta.keymap")
local nnoremap = _Key.nnoremap
local inoremap = _Key.inoremap

local lsp_prefix = "<leader>l"

local M = {}

local hover      = require("lspsaga.hover")
local signature  = require("lspsaga.signaturehelp")
local rename     = require("lspsaga.rename")
local diagnostic = require("lspsaga.diagnostic")
local provider   = require("lspsaga.provider")

M.mappings = function()
    inoremap({ "<C-l>s", signature.signature_help, { silent = true } })
    nnoremap({ lsp_prefix.."k", hover.render_hover_doc, { silent = true } })
    nnoremap({ lsp_prefix.."d", provider.preview_definition, { silent = true } })
    nnoremap({ lsp_prefix.."D", vim.lsp.buf.definition, { silent = true } })
    nnoremap({ lsp_prefix.."ff", vim.lsp.buf.formatting, { silent = true } })
    nnoremap({ lsp_prefix.."l", diagnostic.show_line_diagnostics, { silent = true } })
    nnoremap({ lsp_prefix.."r", rename.rename, { silent = true } })
    nnoremap({ lsp_prefix.."a", require("plugins.telescope").code_action, { silent = true } })
    nnoremap({ lsp_prefix.."F", require("telescope.builtin").lsp_references, { silent = true } })
    nnoremap({ lsp_prefix.."f", provider.lsp_finder, { silent = true } })
    nnoremap({ lsp_prefix.."[", diagnostic.lsp_jump_diagnostic_prev, { silent = true } })
    nnoremap({ lsp_prefix.."]", diagnostic.lsp_jump_diagnostic_next, { silent = true } })
    nnoremap({ lsp_prefix.."T", "<Cmd>LspTroubleToggle<CR>", { silent = true } })
    nnoremap({ lsp_prefix.."S", "<Cmd>SymbolsOutline<CR>", { silent = true } })
end

return M
