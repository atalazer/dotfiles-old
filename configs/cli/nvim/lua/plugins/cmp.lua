local cmp = require("cmp")

cmp.setup({
    preselect = cmp.PreselectMode.None,
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
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "spell" },
    },

    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format("%s (%s)", require("lsp.kind").presets[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
                nvim_lua = "[L]",
                buffer = "[B]",
                spell = "[S]",
            })[entry.source.name] or vim_item.menu
            return vim_item
        end,
    },

    mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<A-e>"] = cmp.mapping.close(),
        -- ["<Tab>"] = cmp.mapping(function(fallback) _G.Util.tab_complete(fallback) end, {"i","s",}),
        -- ["<S-Tab>"] = cmp.mapping(function(fallback) _G.Util.s_tab_complete(fallback) end, {"i","s",}),
        ["<S-TAB>"] = cmp.mapping.select_prev_item(),
        ["<TAB>"] = cmp.mapping.select_next_item(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    },
})
