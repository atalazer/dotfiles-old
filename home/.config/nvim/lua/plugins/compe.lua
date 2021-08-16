require("compe").setup({
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 2,
    preselect = "disable",
    allow_prefix_unmatch = true,
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 25,
    max_menu_width = 15,
    max_kind_width = 10,
    documentation = {
        border = Util.borders,
    },

    source = {
        buffer = {
            enable = true,
            priority = 1,
        },
        calc = {
            enable = true,
            priority = 99999,
            filetypes = { "tex", "markdown", "text" },
        },
        emoji = {
            enable = true,
            filetypes = { "markdown", "text" },
            priority = 1,
        },
        path = {
            enable = true,
            priority = 99999,
        },
        spell = {
            enable = true,
            filetypes = { "text", "markdown" },
            priority = 99999,
        },
        treesitter = false,
        nvim_lua = false,

        -- Requires Plugin
        luasnip = {
            enable = true,
            priority = 10002,
        },
        nvim_lsp = {
            enable = true,
            priority = 10001,
        },
    },
})

local map = function(lhs, rhs)
    vim.api.nvim_set_keymap("i", lhs, rhs, { silent = true, noremap = true, expr = true })
end

map("<CR>", "v:lua.Util.trigger_completion()")
map("<Tab>", 'pumvisible() ? "<C-n>" : "<Tab>"')
map("<S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>"')
map("<C-Space>", "compe#complete()")
map("<C-e>", "compe#close('<C-e>')")

-- vim.cmd([[autocmd User CompeConfirmDone silent! lua vim.lsp.buf.signature_help()]])
