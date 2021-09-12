local M = {}
M.setup = function()
    vim.cmd([[
    nmap <C-a> <Plug>(dial-increment)
    nmap <C-x> <Plug>(dial-decrement)
    vmap <C-a> <Plug>(dial-increment)
    vmap <C-x> <Plug>(dial-decrement)
    vmap g<C-a> <Plug>(dial-increment-additional)
    vmap g<C-x> <Plug>(dial-decrement-additional)
    ]])
end

M.config = function()
    local dial = require("dial")

    dial.config.searchlist.normal = {
        "number#decimal",
        "number#hex",
        "number#binary",
        "color#hex",
        "date#[%H:%M]",
        "date#[%Y-%m-%d]",
        "char#alph#small#word",
        "char#alph#capital#word",
        "markup#markdown#header",
    }
end

return M
