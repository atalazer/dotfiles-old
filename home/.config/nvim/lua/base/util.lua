_G.Util = {}

Util.t = function(cmd)
    return vim.api.nvim_replace_termcodes(cmd, true, true, true)
end

-- see lua/plugins/compe.lua for context
Util.trigger_completion = function()
    -- if vim.fn.pumvisible() ~= 0 then
    --     if vim.fn.complete_info()["selected"] ~= -1 then
    --         return vim.fn["compe#confirm"]()
    --     end
    -- end

    return Util.t("<CR>")
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

Util.lsp_on_attach = function(client, bufnr)
    if client.name == "tsserver" then
        client.resolved_capabilities.document_formatting = false
    end

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
        title = client.name
    })
end

return Util
