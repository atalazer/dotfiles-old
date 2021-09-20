local M = {}

M.config = {
    cmd = { "zk", "lsp" },
    filetypes = { "markdown" },
    on_attach = function(client, bufnr)
        -- Default LSP Mappings
        require("lsp.keys").mappings()

        -- Key mappings
        local buf_set_keymap = function(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        local keymap_opts = { noremap = true, silent = false }
        buf_set_keymap("n", "<CR>", "<cmd>lua vim.lsp.buf.definition()<CR>", keymap_opts)
        buf_set_keymap("v", "<CR>", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", keymap_opts)
        buf_set_keymap("n", ";l", "<cmd>lua vim.lsp.buf.hover()<CR>", keymap_opts)
        buf_set_keymap("n", "gzi", ":lua require'lspconfig'.zk.index()<CR>", keymap_opts)
        buf_set_keymap("n", "gzn", ":lua require'lspconfig'.zk.new({ title = vim.fn.input'Title: ' })<CR>", keymap_opts)
        buf_set_keymap("n", "gzr", "<cmd>lua vim.lsp.buf.references()<CR>", keymap_opts)
    end,
}

return M
