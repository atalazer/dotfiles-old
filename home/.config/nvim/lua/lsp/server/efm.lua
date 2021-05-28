local eslint = {
    lintCommand = "eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = { "%f:%l:%c: %m" },
}
local vint = {
    lintCommand = "vint -",
    lintStdin = true,
    lintFormats = { "%f:%l:%c: %m" },
}
local markdownlint = {
    lintCommand = "markdownlint -s",
    lintStdin = true,
    lintFormats = {
        "%f:%l %m",
        "%f:%l:%c %m",
        "%f: %l: %m",
    },
}
local yamllint = {
    lintCommand = "yamllint -f parsable -",
    lintStdin = true,
}
local shfmt = {
    formatCommand = "shfmt -ci -s -bn",
    formatStdin = true,
}
local stylua = {
    formatCommand = "stylua --config-path ~/.config/nvim/.stylua.toml",
    formatStdin = true,
}
local black = {
    formatCommand = "black --quiet -",
    formatStdin = true,
}

require("lspconfig").efm.setup({
    cmd = {
        "efm-langserver",
    },
    filetypes = {
        "javascript",
        "typescript",
        "python",
        "lua",
        "sh",
        "vim",
        "markdown",
        "yaml",
    },
    on_init = Util.lsp_on_init,
    on_attach = function(client)
        client.resolved_capabilities.rename = false
        client.resolved_capabilities.hover = false
        client.resolved_capabilities.document_formatting = true
        client.resolved_capabilities.completion = false
    end,
    settings = {
        rootMarkers = { ".git" },
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
        },
    },
})
