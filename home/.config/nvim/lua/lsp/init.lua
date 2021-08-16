local lspconfig = require("lspconfig")

require("lsp.handlers")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
    },
}

local servers = {
    sumneko_lua = require("lsp.server.lua").config,
    jedi_language_server = require("lsp.server.python").config,
    texlab = require("lsp.server.tex").config,
    tsserver = require("lsp.server.javascript").config,
    jsonls = require("lsp.server.json").config,
    html = { cmd = { "vscode-html-language-server", "--stdio" } },
    cssls = { cmd = { "vscode-css-language-server", "--stdio" } },
    tailwindcss = { filetypes = { "html", "javascript", "typescript", "typescriptreact", "javascriptreact" }, },
    bashls = {},
    vimls = {},
    clangd = {},
    gopls = {},
    nimls = {},
    yamlls = {
        settings = {
            redhat = { telemetry = { enabled = false } },
            yaml = {
                format = {
                    enable = true,
                    singleQuote = false,
                    bracketSpacing = true,
                },
                editor = {
                    tabSize = 2,
                },
            },
        },
    },
    ["null-ls"] = {},
}

require("plugins.null-ls").setup()

for name, opts in pairs(servers) do
    if type(opts) == "function" then
        opts()
    else
        local client = lspconfig[name]
        client.setup(vim.tbl_extend("force", {
            flags = { debounce_text_changes = 150 },
            on_attach = Util.lsp_on_attach,
            on_init = Util.lsp_on_init,
            capabilities = capabilities,
        }, opts))
    end
end
