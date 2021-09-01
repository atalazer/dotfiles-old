local present1, lspconfig = pcall(require, "lspconfig")
local present2, lsp_installer = pcall(require, "nvim-lsp-installer")

if not (present1 or present2) then
    return
end

require("lsp.handlers")
require("lsp.kind").init()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.documentationFormat = {
    "markdown",
    "text",
}
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
    },
}

local servers = {
    bashls = {
        filetypes = { "bash", "sh", "zsh" },
    },
    cssls = {},
    clangd = {},
    html = {},
    jedi_language_server = require("lsp.server.jedi").config,
    jsonls = require("lsp.server.json").config,
    sumneko_lua = require("lsp.server.sumneko_lua").config,
    texlab = require("lsp.server.texlab").config,
    tailwindcss = {
        filetypes = { "html", "css", "javascriptreact", "typescriptreact" }
    },
    tsserver = require("lsp.server.tsserver").config,
    vimls = {},
    yamlls = {},
    ["null-ls"] = {},
}

require("plugins.null-ls").setup()

for name,opts in pairs(servers) do
    local exist, server = lsp_installer.get_server(name)
    if exist then
        if not server:is_installed() then
            server:install()
        end
        server:setup(vim.tbl_extend("force", {
            flags = { debounce_text_changes = 150 },
            on_attach = Util.lsp_on_attach,
            on_init = Util.lsp_on_init,
            capabilities = capabilities,
        }, opts))
    else
        lspconfig[name].setup(vim.tbl_extend("force", {
            flags = { debounce_text_changes = 150 },
            on_attach = Util.lsp_on_attach,
            on_init = Util.lsp_on_init,
            capabilities = capabilities,
        }, opts))
    end
end

