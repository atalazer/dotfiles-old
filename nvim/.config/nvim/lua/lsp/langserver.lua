vim.cmd([[packadd nvim-lspconfig]])

local keys = require("lsp.keys")
local aerial = require("lsp.aerial")

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local custom_on_attach = function(client)
    print("Language Server Protocol started!")

    aerial.attach(client)
    aerial.mappings()
    keys.lsp_mappings()
end

local custom_on_init = function()
    print("Language Server Protocol Initialized")
end

require("lsp.custom.emmetls")
local sumneko_root = os.getenv("HOME") .. "/.local/bin/lsp/lua-language-server"
-- local sumneko_cmd = sumneko_root .. "/bin/Linux/lua-language-server"
local sumneko_cmd = "lua-language-server"

local servers = {
    bashls = {},
    clangd = {
        root_dir = function()
            vim.fn.getcwd()
        end,
    },
    html = {},
    cssls = {},
    emmetls  = {},
    -- tsserver = {},
    rome = {
        filetypes = { "javascript", "json", "typescript" },
        root_dir = function()
            vim.fn.getcwd()
        end,
    },
    yamlls = {},
    jsonls = {},
    vimls = {},
    efm = {
        cmd = {
            "efm-langserver",
            "-c",
            " ~/.config/efm-langserver/config.yaml",
        },
        on_attach = function(client)
            client.resolved_capabilities.rename = false
            client.resolved_capabilities.hover = false
            client.resolved_capabilities.document_formatting = true
            client.resolved_capabilities.completion = false
        end,
        on_init = custom_on_init,
        init_options = { documentFormatting = true },
        filetypes = { "lua", "vim", "markdown", "javascript", "html", "css" },
        settings = {
            languages = {
                lua = {
                    { formatCommand = "stylua --config-path ~/.config/nvim/.stylua.toml", formatStdin = true },
                },
            },
        },
    },
    pyls = {
        root_dir = function()
            vim.fn.getcwd()
        end,
    },
    gopls = {
        root_dir = function()
            vim.fn.getcwd()
        end,
    },
    -- rls      = {},
    rust_analyzer = {
        root_dir = function()
            vim.fn.getcwd()
        end,
        settings = {
            ["rust-analyzer"] = {
                cargo = {
                    loadOutDirsFromCheck = true,
                },
                procMacro = {
                    enable = true,
                },
                diagnostics = {
                    enable = true,
                    enableExperimental = true,
                    disabled = {},
                },
            },
        },
    },
    sumneko_lua = {
        cmd = {
            sumneko_cmd,
            "-E",
            sumneko_root .. "/main.lua",
        },
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                    path = {
                        vim.split(package.path, ";"),
                        "?.lua",
                        "?/init.lua",
                        "?/?.lua",
                    },
                },
                completion = {
                    callSnippet = "Disable",
                    keywordSnippet = "Disable",
                    displayContext = 5,
                },
                diagnostics = {
                    enable = true,
                    disable = {
                        "ambiguity-1",
                        "trailing-space",
                        "lowercase-global",
                        "undefined-global",
                        "unused-local",
                        "unused-function",
                        "redefined-local",
                    },
                    globals = {
                        -- VIM
                        "vim",
                        "use",
                        -- AwesomeWM
                        "awesome",
                        "client",
                        "root",
                    },
                },
                workspace = {
                    preloadFileSize = 400,
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                        [vim.fn.expand("/usr/share/awesome/lib")] = true,
                    },
                    ignoreDir = {
                        ".vscode",
                    },
                },
            },
        },
    },
}

for name, opts in pairs(servers) do
    local client = lspconfig[name]
    client.setup({
        cmd = opts.cmd or client.cmd,
        filetypes = opts.filetypes or client.filetypes,
        on_attach = opts.on_attach or custom_on_attach,
        on_init = opts.on_init or custom_on_init,
        handlers = opts.handlers or client.handlers,
        root_dir = opts.root_dir or client.root_dir,
        capabilities = opts.capabilities or capabilities,
        settings = opts.settings or {},
    })
end
