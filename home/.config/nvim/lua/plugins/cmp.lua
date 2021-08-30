local cmp = require("cmp")

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

vim.o.completeopt = "menu,menuone,noselect,noinsert"
cmp.setup({
    completion = {
        -- autocomplete = true,
        completeopt = "menu,menuone,noselect,noinsert",
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
        ["<Tab>"] = cmp.mapping(function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(t("<C-n>"), "n")
            elseif require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
            elseif check_back_space() then
                vim.fn.feedkeys(t("<Tab>"), "n")
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(t("<C-p>"), "n")
            elseif require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
})
