require("lspconfig").jedi_language_server.setup({
    root_dir = vim.loop.cwd,
    on_attach = Util.lsp_on_attach,
    on_init = Util.lsp_on_init,
    settings = {
        jedi = {
            enable = true,
            startupMessage = true,
            markupKindPreferred = "markdown",
            jediSettings = {
                autoImportModules = {},
                completion = { disableSnippets = false },
                diagnostics = { enable = true, didOpen = true, didSave = true, didChange = true },
            },
            workspace = { extraPaths = {} },
        },
    },
})
