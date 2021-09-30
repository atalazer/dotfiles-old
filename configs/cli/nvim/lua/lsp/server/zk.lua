local M = {}


M.config = {
    cmd = { "zk", "lsp" },
    filetypes = { "markdown" },
    on_attach = function(client, bufnr)
        -- Key mappings
        local map = function(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        local keymap_opts = { noremap = true, silent = false }
        map("n", "<CR>", "<cmd>lua vim.lsp.buf.definition()<CR>", keymap_opts)
        map("v", "<CR>", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", keymap_opts)
        map("n", ";l", "<cmd>lua vim.lsp.buf.hover()<CR>", keymap_opts)
        map("n", "gzi", ":lua require'lspconfig'.zk.index()<CR>", keymap_opts)
        map("n", "gzn", ":lua require'lspconfig'.zk.new({ title = vim.fn.input'Title: ' })<CR>", keymap_opts)
        map("n", "gzr", "<cmd>lua vim.lsp.buf.references()<CR>", keymap_opts)
    end,
}

return M
