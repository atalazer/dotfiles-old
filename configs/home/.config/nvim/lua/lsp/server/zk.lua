local M = {}

M.config = {
    cmd = { "zk", "lsp" },
    filetypes = { "markdown" },
    on_attach = function(--[[ client, bufnr --]])
        nnoremap("<CR>", vim.lsp.buf.definition, "silent", "Open File Under Cursor")
        vnoremap("<CR>", vim.lsp.buf.range_code_action, "silent", "Code Action")
        nnoremap("K", vim.lsp.buf.hover, "silent", "Hover")
        nnoremap("gzr", vim.lsp.buf.references, "silent")
        nnoremap("gzi", require("lspconfig").zk.index, "silent", "Go To Index")
        nnoremap("gzn", function()
            require("lspconfig").zk.new({ title = vim.fn.input("Title: ") })
        end, "silent", "New Note")
    end,
}

return M
