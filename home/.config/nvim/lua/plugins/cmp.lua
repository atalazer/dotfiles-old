local cmp = require("cmp")

cmp.setup({
    completion = {
        -- autocomplete = true,
        completeopt = "menu,menuone,noselect,noinsert",
        keyword_length = 3,
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
            vim_item.word = vim_item.word
            vim_item.abbr = vim_item.abbr
            vim_item.menu = ({
                -- nvim_lsp = "[LSP]",
                -- nvim_lua = "[LUA]",
                -- buffer = "[BUF]",
            })[entry.source.name] or vim_item.menu
            vim_item.kind = require("lsp.kind").presets[vim_item.kind] .. " (" .. vim_item.kind .. ")"
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
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        }),
    },
})

-- vim.api.nvim_set_keymap("i", "<CR>", "v:lua.Util.trigger_completion()", { noremap = true, expr = true })
