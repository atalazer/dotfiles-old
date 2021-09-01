_G.Util = {}

Util.t = function(cmd)
    return vim.api.nvim_replace_termcodes(cmd, true, true, true)
end

Util.check_back_space = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

-- see lua/plugins/cmp.lua for context
-- Use nvim-autopairs cr instead
Util.trigger_completion = function()
    -- if vim.fn.pumvisible() ~= 0 then
    --     if vim.fn.complete_info()["selected"] ~= -1 then
    --         return vim.fn["compe#confirm"]()
    --     end
    -- end

    return Util.t("<CR>")
end

-- see lua/plugins/cmp.lua for context
Util.tab_complete = function(fallback)
    if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(Util.t("<C-n>"), "n")
    elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(Util.t("<Plug>luasnip-expand-or-jump"), "")
    elseif Util.check_back_space() then
        vim.fn.feedkeys(Util.t("<Tab>"), "n")
    else
        fallback()
    end
end

-- see lua/plugins/cmp.lua for context
Util.s_tab_complete = function(fallback)
    if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(Util.t("<C-p>"), "n")
    elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(Util.t("<Plug>luasnip-jump-prev"), "")
    else
        fallback()
    end
end

Util.borders = {
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
}

Util.lsp_on_attach = function(client)
    if client.resolved_capabilities.code_lens then
        vim.cmd([[
            augroup CodeLens
                au!
                au InsertEnter,InsertLeave * lua vim.lsp.codelens.refresh()
            augroup END
        ]])
    end

    require("lsp_signature").on_attach({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        doc_lines = 2, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
        floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
        hint_enable = false, -- virtual hint enable
        handler_opts = {
            border = Util.borders, -- double, single, shadow, none
        },
    })
    require("lsp.keys").mappings()
end

Util.lsp_on_init = function(client)
    -- print("Language Server Protocol started!")
    vim.notify("Language Server Client successfully started!", "info", {
        title = client.name:upper(),
    })
end

return Util
