pcall(require, "lsp.diagnostic")
pcall(require, "lsp.popup")
pcall(require, "lsp.symbols")
pcall(require, "lsp.trouble")
pcall(require, "lsp.langserver")

vim.cmd("packadd lsp-colors.nvim")
require("lsp-colors").setup({
    Error       = "#db4b4b",
    Warning     = "#e0af68",
    Information = "#0db9d7",
    Hint        = "#10B981",
})
