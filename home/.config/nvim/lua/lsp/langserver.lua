vim.cmd([[packadd nvim-lspconfig]])

local lspconfig = require("lspconfig")

local aerial = require("lsp.aerial")
local keys = require("lsp.keys")

local custom_on_attach = function(client)
    print("LSP started!")

    aerial.attach(client)
    aerial.mappings()
    keys.mappings()
end

local custom_on_init = function()
    print("Language Server Protocol Initialized")
end

local capabilities = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    return capabilities
end

local eslint = {
    lintCommand = "eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = { "%f:%l:%c: %m" },
}
local vint = {
    lintCommand = 'vint -',
    lintStdin = true,
    lintFormats = {'%f:%l:%c: %m'}
}
local markdownlint = {
    lintCommand = 'markdownlint -s',
    lintStdin = true,
    lintFormats = {
        '%f:%l %m',
        '%f:%l:%c %m',
        '%f: %l: %m'
    }
}
local yamllint = {
    lintCommand = 'yamllint -f parsable -',
    lintStdin = true,
}
local shfmt = {
    formatCommand = "shfmt -ci -s -bn",
    formatStdin = true
}
local stylua = {
    formatCommand = "stylua --config-path ~/.config/nvim/.stylua.toml",
    formatStdin = true
}
local black ={
    formatCommand = "black --quiet -",
    formatStdin = true
}

-- require("lsp.custom.emmetls")
local sumneko_root = os.getenv("HOME") .. "/.local/bin/lsp/lua-language-server"
-- local sumneko_cmd = sumneko_root .. "/bin/Linux/lua-language-server"
local sumneko_cmd = "lua-language-server"

local servers = {
    bashls = {},
    clangd = {
        root_dir = vim.loop.cwd,
    },
    html = {
        filetypes = { "html", "htmldjango" },
        capabilities = capabilities(),
    },
    cssls = {
        root_dir = vim.loop.cwd,
    },
    -- tsserver = {
    --     filetypes = { "javascript", "typescript", "typescriptreact" },
    --     root_dir = vim.loop.cwd,
    --     on_init = custom_on_init,
    -- },
    rome = {
        cmd = { "rome", "lsp" },
        filetypes = { "javascript", "typescript", "typescriptreact" },
        root_dir = vim.loop.cwd,
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
        filetypes = {
            "javascript", "typescript",
            "python", "lua", "sh", "vim",
            "markdown", "yaml"
        },
        on_attach = function(client)
            client.resolved_capabilities.rename = false
            client.resolved_capabilities.hover = false
            client.resolved_capabilities.document_formatting = true
            client.resolved_capabilities.completion = false
        end,
        settings = {
            rootMarkers = {".git"},
            languages = {
                javascript = { eslint },
                typescript = { eslint },
                typescriptreact = { eslint },
                python = { black },
                lua = { stylua },
                vim = { vint },
                sh = { shfmt },
                markdown = { markdownlint },
                yaml = { yamllint },
            }
        }
    },
    jedi_language_server = {
        root_dir = vim.loop.cwd,
        settings = {
            jedi = {
                enable = true,
                startupMessage = true,
                markupKindPreferred = 'markdown',
                jediSettings = {
                    autoImportModules = {},
                    completion = {disableSnippets = false},
                    diagnostics = {enable = true, didOpen = true, didSave = true, didChange = true}
                },
                workspace = {extraPaths = {}}
            }
        }
    },
    gopls = {
        root_dir = vim.loop.cwd,
    },
    rust_analyzer = {
        root_dir = vim.loop.cwd,
        capabilities = (function()
            -- for autoimports
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true
            capabilities.textDocument.completion.completionItem.resolveSupport = {
                properties = {
                    'documentation',
                    'detail',
                    'additionalTextEdits',
                }
            }
            return capabilities
        end)(),
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
                    enableExperimental = false,
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
                    },
                },
                completion = {
                    keywordSnippet = "Disable",
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
                        -- AwesomeWM
                        "awesome", "root", "client"
                    },
                },
                workspace = {
                    preloadFileSize = 400,
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                        [vim.fn.expand("/usr/share/awesome/lib")] = true,
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
        capabilities = opts.capabilities or capabilities(),
        settings = opts.settings or {},
    })
end