local M = {}

local telescope_exist, telescope = pcall(require, "telescope.builtin")
local fzf_exist, fzf = pcall(require, "fzf-lua")

M.mappings = function()
    local diagnostic = require("lsp.diagnostics").diagnostic
    local opts = { silent = true }

    local code_action = function()
        if telescope_exist then
            telescope.lsp_code_actions()
        elseif fzf_exist then
            fzf.lsp_code_actions()
        else
            vim.lsp.buf.code_action()
        end
    end

    local lsp_reference = function()
        if telescope_exist then
            telescope.lsp_references()
        elseif fzf_exist then
            fzf.lsp_references()
        else
            vim.lsp.buf.references()
        end
    end

    inoremap("<C-k>", vim.lsp.buf.signature_help, opts)
    nnoremap("K", vim.lsp.buf.hover, opts)
    nnoremap("<Leader>ca", code_action, opts)
    nnoremap("gD", vim.lsp.buf.definition, opts)
    nnoremap("gr", lsp_reference, opts)
    nnoremap("gR", vim.lsp.buf.rename, opts)

    -- Workspace
    nnoremap("<Leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    nnoremap("<Leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    nnoremap("<Leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)

    -- Diagnostics
    nnoremap("gd", diagnostic.line, opts)
    nnoremap("]d", diagnostic.next, opts)
    nnoremap("[d", diagnostic.prev, opts)
    nnoremap("<Leader>q", "<Cmd>TroubleToggle<CR>", opts)
    -- nnoremap("<Leader>q", diagnostic.qflist, opts)
end

return M
