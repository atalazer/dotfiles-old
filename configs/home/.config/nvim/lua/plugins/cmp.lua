local cmp = require("cmp")

cmp.setup({
    -- completion = { keyword_length = 3 },
    documentation = { border = Util.borders },
    experimental = {
        native_menu = false,
        ghost_text = false,
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = "buffer", option = { keyword_length = 3,  } },
        { name = "calc" },
        { name = "cmdline" },
        { name = "dictionary", option = { keyword_length = 2 } },
        { name = "latex_symbols" },
        { name = "luasnip", option = { use_show_condition = false } },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "rg" },
        { name = "spell" },
    }),

    sorting = {
        comparators = {
            function(...) return require("cmp_buffer"):compare_locality(...) end,
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require("cmp-under-comparator").under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format("%s (%s)", require("lsp.kind").presets[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
                nvim_lua = "[LSP]",
                buffer = "[Buf]",
                spell = "[Spell]",
                dictionary = "[Dict]",
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


cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" }
    }
})

cmp.setup.cmdline(":", {
    sources = cmp.config.sources(
    { { name = "path" } },
    { { name = "cmdline" } })
})
