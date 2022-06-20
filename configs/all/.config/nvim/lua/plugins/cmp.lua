local cmp = require("cmp")

cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
        { name = "cmdline" },
    }),
})

cmp.setup({
    -- completion = {
    --     autocomplete = true,
    --     keyword_length = 2,
    -- },
    documentation = { border = Util.borders },
    experimental = {
        native_menu = false,
        ghost_text = true,
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = "buffer", max_item_count = 5, priority_weight = 70 },
        { name = "calc" },
        { name = "dictionary", keyword_length = 3 },
        { name = "latex_symbols" },
        { name = "luasnip", priority_weight = 100 },
        { name = "nvim_lsp", max_item_count = 20, priority_weight = 90 },
        { name = "path", priority_weight = 110 },
        { name = "rg", keyword_length = 3, max_item_count = 5, priority_weight = 60 },
        { name = "spell" },
    }),

    sorting = {
        comparators = {
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
                path = "[Path]",
                nvim_lua = "[LSP]",
                buffer = "[Buf]",
                spell = "[Spell]",
                dictionary = "[Dict]",
                luasnip = "[Snip]",
                rg = "[RG]",
                calc = "[Calc]",
            })[entry.source.name] or vim_item.menu
            return vim_item
        end,
    },
    mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-5),
        ["<C-f>"] = cmp.mapping.scroll_docs(5),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<A-e>"] = cmp.mapping.close(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            _G.Util.tab_complete(fallback)
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            _G.Util.s_tab_complete(fallback)
        end, {
            "i",
            "s",
        }),
        -- ["<S-TAB>"] = cmp.mapping.select_prev_item(),
        -- ["<TAB>"] = cmp.mapping.select_next_item(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
    },
})

-- cmp-dictionary
require("cmp_dictionary").setup({
    dic = {
        ["*"] = "/usr/share/dict/words",
        ["markdown"] = { "~/.config/nvim/spell/id" }
    },
    -- The following are default values, so you don't need to write them if you don't want to change them
    exact = 2,
    async = false,
    capacity = 5,
    debug = false,
})
