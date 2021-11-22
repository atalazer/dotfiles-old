local fn, lsp = vim.fn, vim.lsp

lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, {
    border = Util.borders,
})

lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, {
    border = Util.borders,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    signs = true,
    update_in_insert = false,
    virtual_text = {
        prefix = "■ ",
        spacing = 4,
    },
})

local signs = {
    Error = " ",
    Warning = " ",
    Hint = " ",
    Information = " ",
}

for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end