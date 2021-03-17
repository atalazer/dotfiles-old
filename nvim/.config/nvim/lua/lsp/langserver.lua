vim.cmd[[packadd nvim-lspconfig]]

local lspconfig = require("lspconfig")
local keys = require("lsp.keys")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;

local custom_on_attach = function(client,bufnr)
    print("Language Server Protocol started!")

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap=true, silent=true }
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    keys.lsp_mappings()
end

local custom_on_init = function()
    print("Language Server Protocol Initialized")
end

require("lsp.custom.emmetls")
local sumneko_root = os.getenv("HOME") .. "/.local/bin/lsp/lua-language-server"

local servers = {
    bashls   = {},
    clangd   = {
        root_dir= function() vim.fn.getcwd() end,
    },
    html     = {},
    cssls    = {},
    emmetls  = {},
    tsserver = {},
    -- efm      = {},
    yamlls   = {},
    jsonls   = {},
    vimls    = {},
    pyls     = {
        root_dir= function() vim.fn.getcwd() end,
    },
    gopls    = {
        root_dir= function() vim.fn.getcwd() end,
    },
    -- rls      = {},
    rust_analyzer = {
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
        }
    },
    sumneko_lua = {
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
        }
    }
}

for name, opts in pairs(servers) do
    local client = lspconfig[name]
    client.setup{
        cmd          = opts.cmd          or client.cmd,
        filetypes    = opts.filetypes    or client.filetypes,
        on_attach    = opts.on_attach    or custom_on_attach,
        on_init      = opts.on_init      or custom_on_init,
        handlers     = opts.handlers     or client.handlers,
        root_dir     = opts.root_dir     or client.root_dir,
        capabilities = opts.capabilities or capabilities,
        settings     = opts.settings     or {}
    }
end

