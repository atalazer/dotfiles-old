local nvim_lsp = require("lspconfig")

pcall(require, "lsp.diagnostic")
pcall(require, "lsp.popup")
pcall(require, "lsp.trouble")

local capabilities = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    return capabilities
end

local servers = {
    sumneko_lua = require("lsp.server.lua").config,
    jedi_language_server = require("lsp.server.python").config,
    texlab = require("lsp.server.tex").config,
    tsserver = require("lsp.server.javascript").config,
    jsonls = require("lsp.server.json").config,
    html = { cmd = { "vscode-html-language-server", "--stdio" }},
    cssls = { cmd = { "vscode-css-language-server", "--stdio" }},
    tailwindcss = {
        filetypes = { "css", "html", "sass", "scss" },
    },
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
}

for name, opts in pairs(servers) do
    local client = nvim_lsp[name]
    if opts.extra_setup then
        opts.extra_setup()
    end
    client.setup({
        cmd = opts.cmd or client.cmd,
        filetypes = opts.filetypes or client.filetypes,
        on_attach = opts.on_attach or Util.lsp_on_attach,
        on_init = opts.on_init or Util.lsp_on_init,
        handlers = opts.handlers or client.handlers,
        root_dir = opts.root_dir or client.root_dir,
        capabilities = opts.capabilities or capabilities(),
        settings = opts.settings or {},
    })
end
