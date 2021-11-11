local present1, lspconfig = pcall(require, "lspconfig")
local present2, lsp_installer = pcall(require, "nvim-lsp-installer")

if not (present1 or present2) then
    return
end

require("lsp.handlers")
require("lsp.kind").init()

local coq_exist, coq = pcall(require, "coq")
local cmp_exist, cmp = pcall(require, "cmp_nvim_lsp")

local capabilities = vim.lsp.protocol.make_client_capabilities()

if cmp_exist then
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
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
    -- bashls = { filetypes = { "bash", "sh", "zsh" } },
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
    ["null-ls"] = {},
}

require("plugins.null-ls").setup()

for name, opts in pairs(servers) do
    -- Defaults opts
    opts = vim.tbl_extend("force", {
        on_attach = Util.lsp_on_attach,
        on_init = Util.lsp_on_init,
        capabilities = capabilities,
    }, opts)

    -- COQ.nvim
    if coq_exist then opts = coq.lsp_ensure_capabilities(opts) end

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
