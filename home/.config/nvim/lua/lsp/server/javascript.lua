local M = {}

M.config = {
    filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
    init_options = {
        documentFormatting = false,
    },
    on_init = Util.lsp_on_init,
    on_attach = Util.lsp_on_attach,
    root_dir = vim.loop.cwd,
}

return M
