local M = {}

M.config = {
    on_attach = function(client)
        require("lsp.keys").mappings()

        client.server_capabilities.completionProvider.triggerCharacters = {
            ".",
            '"',
            "'",
            "`",
            "/",
            "@",
            "*",
            "#",
            "$",
            "+",
            "^",
            "(",
            "[",
            "-",
            ":",
        }
    end,
    on_init = Util.lsp_on_init,
    filetypes = { "svelte" },
    settings = {
        svelte = {
            plugin = {
                html = { completions = { enable = true, emmet = false } },
                svelte = { completions = { enable = true, emmet = false } },
                css = { completions = { enable = true, emmet = false } },
            },
        },
    },
}

return M
