local lspconfig = require("lspconfig")
local lsp_installer = require("nvim-lsp-installer")

require("lsp.handlers")
require("lsp.diagnostics")
require("lsp.kind").init()

local cmp_exist, cmp = pcall(require, "cmp")

local capabilities = vim.lsp.protocol.make_client_capabilities()

if cmp_exist then
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
end

local lsp_on_attach = function(client, _)
    require("lsp.keys").mappings()

    -- Formatting
    if client.resolved_capabilities.document_formatting then
        nnoremap("gF", "<CMD>lua vim.lsp.buf.formatting_sync()<CR>", opts)
    end
    if client.resolved_capabilities.document_range_formatting then
        vnoremap("gF", "<CMD>lua vim.lsp.buf.range_formatting()<CR>", opts)
        xnoremap("gF", "<CMD>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    -- Codelens
    if client.resolved_capabilities.code_lens then
        nnoremap("<Leader>cl", vim.lsp.codelens.run, opts)
        vim.cmd([[
        augroup CodeLens
            au!
            au InsertEnter,InsertLeave * lua vim.lsp.codelens.refresh()
        augroup END
        ]])
    end

    -- The blow command will highlight the current variable and its usages in the buffer.
    if client.resolved_capabilities.document_highlight then
        vim.cmd([[
        augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]])
    end

    vim.cmd([[ autocmd CursorHold <buffer> lua require('config.lsp').show_line_diagnostics() ]])
end

local lsp_on_init = function(client)
    local notify = notify or vim.notify
    notify("Language Server Client successfully started!", "info", {
        title = client.name,
    })
end

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "◍",
            server_pending = "◍",
            server_uninstalled = "◍",
        },
        keymaps = {
            toggle_server_expand = "<CR>",
            install_server = "i",
            update_server = "u",
            uninstall_server = "X",
        },
    },
    max_concurrent_installers = 2,
})

local servers = {
    bashls = { filetypes = { "bash", "sh", "zsh" } },
    -- clangd = {},
    cssls = { cmd = { "vscode-css-language-server", "--stdio" } },
    gopls = {},
    html = { cmd = { "vscode-html-language-server", "--stdio" } },
    -- jedi_language_server = require("lsp.server.jedi").config,
    jsonls = require("lsp.server.json").config,
    -- ltex = {},
    pylsp = {},
    rnix = {},
    sumneko_lua = require("lsp.server.sumneko_lua").config,
    svelte = require("lsp.server.svelte").config,
    texlab = require("lsp.server.texlab").config,
    tailwindcss = { filetypes = { "html", "css", "javascriptreact", "typescriptreact" } },
    tsserver = require("lsp.server.tsserver").config,
    -- vimls = {},
    -- yamlls = {},
    zk = require("lsp.server.zk").config,
}

require("plugins.null-ls").setup()

for name, opts in pairs(servers) do
    -- Defaults opts
    opts = vim.tbl_extend("force", {
        on_attach = lsp_on_attach,
        on_init = lsp_on_init,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 500,
        },
    }, opts)

    -- LSP Installer
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
