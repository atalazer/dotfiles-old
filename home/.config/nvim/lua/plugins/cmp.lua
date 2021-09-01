local cmp = require("cmp")

cmp.setup({
    completion = {
        completeopt = "menuone,noselect",
        keyword_length = 2,
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },

    documentation = {
        border = Util.borders,
    },

    sources = {
        { name = "buffer" },
        { name = "calc" },
        { name = "emoji" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "spell" },
    },

    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format("%s (%s)", require("lsp.kind").presets[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                nvim_lua = "[LUA]",
                buffer = "[BUF]",
                spell = "[SPL]",
            })[entry.source.name] or vim_item.menu
            return vim_item
        end,
    },

    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback) _G.Util.tab_complete(fallback) end, {"i","s",}),
        ["<S-Tab>"] = cmp.mapping(function(fallback) _G.Util.s_tab_complete(fallback) end, {"i","s",}),
    },
})
