local lsp_installer = require("nvim-lsp-installer")

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
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
    },
}

local required_servers = {
    "bashls",
    "cssls",
    "clangd",
    "html",
    "jedi_language_server",
    "jsonls",
    "sumneko_lua",
    "tailwindcss",
    "tsserver",
    "texlab",
    "vimls",
    "yamlls",
}

for _, server_name in ipairs(required_servers) do
    local exist, server = lsp_installer.get_server(server_name)
    if exist then
        if not server:is_installed() then
            server:install()
        end
    end
end

lsp_installer.on_server_ready(function(server)
    local default_opts = {
        flags = { debounce_text_changes = 150 },
        on_attach = Util.lsp_on_attach,
        on_init = Util.lsp_on_init,
        capabilities = capabilities,
    }

    local custom_server_settings = {
        jedi_language_server = require("lsp.server.python").config,
        jsonls = require("lsp.server.json").config,
        sumneko_lua = require("lsp.server.lua").config,
        texlab = require("lsp.server.tex").config,
        tsserver = require("lsp.server.javascript").config,
        ["null-ls"] = default_opts,
    }

    for server_name, custom_opts in pairs(custom_server_settings) do
        if server.name == server_name then
            server:setup(custom_opts)
        end
    end

    server:setup(default_opts)
    require("plugins.null-ls").setup()
    vim.cmd([[ do User LspAttachBuffers ]])
end)
