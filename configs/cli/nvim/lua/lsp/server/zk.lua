local M = {}


M.config = {
    cmd = { "zk", "lsp" },
    filetypes = { "markdown" },
    on_attach = function(client, bufnr)
        nnoremap("<CR>", "<CMD>lua vim.lsp.buf.definition()<CR>", "silent", "Open File Under Cursor")
        vnoremap("<CR>", "<CMD>'<,'>lua vim.lsp.buf.range_code_action()<CR>", "silent", "Code Action")
        nnoremap("K", "<CMD>lua vim.lsp.buf.hover()<CR>", "silent", "Hover")
        nnoremap("gzi", "<CMD>lua require'lspconfig'.zk.index()<CR>", "silent", "Go To Index")
        nnoremap("gzn", "<CMD>lua require'lspconfig'.zk.new({ title = vim.fn.input('Title: ') })<CR>", "silent", "New Note")
        nnoremap("gzr", "<CMD>lua vim.lsp.buf.references()<CR>", "silent")
    end,
}

return M
