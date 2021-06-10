local configs = require("lspconfig/configs")
local util = require("lspconfig/util")
local nvim_lsp = require("lspconfig")

local server_name = "tailwind-ls"

configs[server_name] = {
    default_config = {
        cmd = { "tailwindcss-language-server", "--stdio" },
        filetypes = { "css", "html", "svelte" },
        root_dir = util.root_pattern("tailwind.config.js", "package.json", ".git"),
        settings = {}
    },
    docs = {
        description = [[ ]],
        default_config = {
            cmd = [[ { "tailwindcss-language-server", "--stdio" } ]],
            filetypes = [[ { "css", "html", "svelte"} ]],
            root_dir = [[ tailwind.config.js, package.json, .git ]],
        },
    },
}

nvim_lsp[server_name].setup({
    on_init = Util.lsp_on_init,
    on_attach = function()
        print("LSP Attached!")

        require("lsp_signature").on_attach {
            bind = true,
            doc_lines = 2,
            hint_enable = false,
            handler_opts = {
                border = Util.borders
            }
        }
    end,
})
