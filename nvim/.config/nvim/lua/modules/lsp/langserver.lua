vim.cmd[[packadd nvim-lspconfig]]
vim.cmd[[packadd completion-nvim]]

local lspconfig = require'lspconfig'
local keys = require("modules.lsp.keys")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;

local on_attach = function(client, bufnr)
    print("Language Server Protocol started!")
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    require'completion'.on_attach()
    local opts = { noremap=true, silent=true }

    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    keys.lsp_mappings()
end

--
-- VIM
--
local sumneko_root = os.getenv("HOME") .. "/.local/bin/lsp/lua-language-server"
lspconfig.sumneko_lua.setup{
    cmd = { sumneko_root .. "/bin/Linux/lua-language-server", "-E", sumneko_root .. "/main.lua" },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = { vim.split(package.path, ";"),}
            },
            diagnostics = {
                enable = true,
                disable = {
                    "ambiguity-1", "trailing-space",
                    "lowercase-global", "undefined-global",
                    "unused-local", "unused-function", "redefined-local",
                    "duplicate-index"
                },
                globals = {
                    "vim", "describe", "it", "before_each", "after_each",
                    "awesome"
                },
            },
            workspace = {
                preloadFileSize = 400,
            },
        }
    },
    on_attach = on_attach,
}
lspconfig.vimls.setup{
    on_attach = on_attach,
}

--
-- WEB DEVELOPMENT
--
lspconfig.html.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}
lspconfig.cssls.setup{
    on_attach = on_attach,
}
lspconfig.tsserver.setup{
    on_attach = on_attach,
}
require("modules.lsp.custom.emmetls")
lspconfig.emmetls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

--
-- SCRIPTING DEVELOPMENT
--
lspconfig.bashls.setup{
    on_attach = on_attach,
}
lspconfig.pyls.setup{
    root_dir= function() vim.fn.getcwd() end,
    on_attach = on_attach,
}

--
-- DEVELOPMENT MBUH
--
lspconfig.yamlls.setup{
    on_attach = on_attach,
}
lspconfig.jsonls.setup{
    on_attach = on_attach,
}

--
-- APPS DEVELOPMENT
--
lspconfig.clangd.setup{
    on_attach = on_attach,
    root_dir= function() vim.fn.getcwd() end,
}
lspconfig.gopls.setup{
    on_attach = on_attach,
    root_dir= function() vim.fn.getcwd() end,
}
lspconfig.rust_analyzer.setup{
    on_attach = on_attach,
    root_dir= function() vim.fn.getcwd() end,
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
            diagnostics = {
                enable = true,
                enableExperimental = false,
                disabled = {},
            },
            lens = {
                enable = true,
            },
            hoverAction = {
                enable = true,
            },
        }
    },
}
