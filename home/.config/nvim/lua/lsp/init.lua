vim.cmd("packadd nvim-lspconfig")
vim.cmd("packadd lsp-colors.nvim")
vim.cmd("packadd symbols-outline.nvim")

local nvim_lsp = require("lspconfig")

pcall(require, "lsp.diagnostic")
pcall(require, "lsp.popup")
pcall(require, "lsp.trouble")

pcall(require, "lsp.server.lua")
pcall(require, "lsp.server.efm")
pcall(require, "lsp.server.python")
pcall(require, "lsp.server.tailwindcss")

require("lsp-colors").setup({
    Error = "#db4b4b",
    Warning = "#e0af68",
    Information = "#0db9d7",
    Hint = "#10B981",
})

require("symbols-outline").setup({
    highlight_hovered_item = true,
    show_guides = true,
})

local capabilities = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    return capabilities
end

local servers = {
    bashls = {},
    vimls = {},
    clangd = {},
    html = {},
    cssls = {},
    rome = {
        cmd = { "rome", "lsp" },
        filetypes = { "javascript", "typescript", "typescriptreact" },
        root_dir = vim.loop.cwd,
    },
    yamlls = {},
    jsonls = {},
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
