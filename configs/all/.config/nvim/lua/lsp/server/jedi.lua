local M = {}

M.config = {
    root_dir = vim.loop.cwd,
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
        },
    },
}
return M
