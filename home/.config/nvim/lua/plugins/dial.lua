vim.cmd("packadd dial.nvim")

local dial = require("dial")

dial.config.searchlist.normal = {
    "char#alph#small#word",
    "char#alph#capital#word",
    "char#alph#small#str",
    "char#alph#capital#str",
    "date#[%Y/%m/%d]",
    "date#[%Y-%m-%d]",
    "date#[%H:%M]",
    "number#decimal",
    "number#hex",
    "number#binary",
    "markup#markdown#header",
}
dial.config.searchlist.visual = {
    "char#alph#small#word",
    "char#alph#capital#word",
    "char#alph#small#str",
    "char#alph#capital#str",
    "date#[%Y/%m/%d]",
    "date#[%Y-%m-%d]",
    "date#[%H:%M]",
    "number#decimal",
    "number#hex",
    "number#binary",
    "markup#markdown#header",
}

nmap{"<C-i>", "<Plug>(dial-increment)"}
nmap{"<C-k>", "<Plug>(dial-decrement)"}
vmap{"<C-i>", "<Plug>(dial-increment)"}
vmap{"<C-k>", "<Plug>(dial-decrement)"}
vmap {"g<C-i>", "<Plug>(dial-increment-additional)"}
vmap {"g<C-k>", "<Plug>(dial-decrement-additional)"}

