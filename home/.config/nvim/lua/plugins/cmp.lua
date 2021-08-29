local cmp = require("cmp")

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
    item = {
        custom = function(completion_item)
            if completion_item.kind == cmp.lsp.CompletionItemKind.Method or Function then
                completion_item.insertText = completion_item.insertText + "($0)"
                completion_item.insertTextFormat = cmp.lsp.InsertTextFormat.Snippet
            end
            return completion_item
        end,
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format(
                "%s (%s)",
                require("lsp.kind").presets[vim_item.kind],
                vim_item.kind
            )
            vim_item.menu = ({
                -- nvim_lsp = "[LSP]",
                -- nvim_lua = "[LUA]",
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
        ["<Tab>"] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
            elseif require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
            elseif require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
                fallback()
            end
        end,
    },
})

-- vim.api.nvim_set_keymap("i", "<CR>", "v:lua.Util.trigger_completion()", { noremap = true, expr = true })
