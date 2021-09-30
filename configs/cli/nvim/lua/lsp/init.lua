local present1, lspconfig = pcall(require, "lspconfig")
local present2, lsp_installer = pcall(require, "nvim-lsp-installer")

if not (present1 or present2) then
    return
end

require("lsp.handlers")
require("lsp.kind").init()

local capabilities
if pcall(require("cmp_nvim_lsp")) then
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
else
    capabilities = vim.lsp.protocol.make_client_capabilities()
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
end

local servers = {
    bashls = { filetypes = { "bash", "sh", "zsh" } },
    clangd = {},
    cssls = { cmd = { "vscode-css-language-server", "--stdio" } },
    html = { cmd = { "vscode-html-language-server", "--stdio" } },
    -- jedi_language_server = require("lsp.server.jedi").config,
    jsonls = require("lsp.server.json").config,
    pylsp = {},
    rnix = {},
    sumneko_lua = require("lsp.server.sumneko_lua").config,
    svelte = require("lsp.server.svelte").config,
    texlab = require("lsp.server.texlab").config,
    tailwindcss = { filetypes = { "html", "css", "javascriptreact", "typescriptreact" } },
    tsserver = require("lsp.server.tsserver").config,
    vimls = {},
    yamlls = {},
    zk = require("lsp.server.zk").config,
    ["null-ls"] = {},
}

require("plugins.null-ls").setup()

for name, opts in pairs(servers) do
    opts = vim.tbl_extend("force", {
        on_attach = Util.lsp_on_attach,
        on_init = Util.lsp_on_init,
        capabilities = capabilities,
    }, opts)

    local server_exist, server = lsp_installer.get_server(name)

    if server_exist then
        if not server:is_installed() then
            server:install()
        end
        server:setup(opts)
    else
        lspconfig[name].setup(opts)
    end
end
