local remap = vim.api.nvim_set_keymap

local cmp = require("cmp")

cmp.setup({
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
        { name = "path" },
        { name = "calc" },
        { name = "emoji" },
        { name = "luasnip" },
        { name = "nvim_lsp" },
    },

    mapping = {
        ["<S-Tab>"] = cmp.mapping.prev_item(),
        ["<Tab>"] = cmp.mapping.next_item(),
        ["<C-p>"] = cmp.mapping.prev_item(),
        ["<C-n>"] = cmp.mapping.next_item(),
        ["<C-d>"] = cmp.mapping.scroll(-4),
        ["<C-f>"] = cmp.mapping.scroll(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    },

})

local map = function(lhs, rhs)
    vim.api.nvim_set_keymap("i", lhs, rhs, { silent = true, noremap = true, expr = true })
end

map("<CR>", "v:lua.Util.trigger_completion()")
