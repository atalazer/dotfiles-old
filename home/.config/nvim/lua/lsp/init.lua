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
    local opts = {
        on_attach = Util.lsp_on_attach,
        on_init = Util.lsp_on_init,
        capabilities = capabilities,
        flags = { debounce_text_changes = 500 },
    }

    local custom_settings = {
        jedi_language_server = require("lsp.server.jedi").config,
        jsonls = require("lsp.server.json").config,
        sumneko_lua = require("lsp.server.sumneko_lua").config,
        texlab = require("lsp.server.texlab").config,
        tsserver = require("lsp.server.tsserver").config,
        ["null-ls"] = {},
    }

    for name, custom_opts in pairs(custom_settings) do
        if server.name == name then
            -- server:setup(vim.tbl_deep_extend("force", opts, custom_opts))
            server:setup(custom_opts)
        else
            server:setup(opts)
        end
    end

    require("plugins.null-ls").setup()
    -- vim.cmd("bufdo e")
    -- vim.cmd("do User LspAttachBuffers")
end)
