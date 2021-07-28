local fn = vim.fn

_G.Util = {}

Util.t = function(cmd)
    return vim.api.nvim_replace_termcodes(cmd, true, true, true)
end

-- see lua/plugins/compe.lua for context
Util.trigger_completion = function()
    if fn.pumvisible() ~= 0 then
        if fn.complete_info()["selected"] ~= -1 then
            return fn["compe#confirm"]()
        end
    end

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

Util.lsp_on_attach = function(client)
    print("LSP Attached!")
    if client.resolved_capabilities.code_lens then
        vim.cmd [[
        augroup CodeLens
        au!
        au CursorHold,CursorHoldI * lua vim.lsp.codelens.refresh()
        augroup END
        ]]
    end
    require("lsp.keys").mappings()
end

Util.lsp_on_init = function()
    print("Language Server Protocol started!")
end

return Util
