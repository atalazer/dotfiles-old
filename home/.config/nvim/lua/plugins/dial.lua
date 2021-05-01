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

-- Keymap
local _Key = require("astronauta.keymap")
local nmap     = _Key.nmap
local vmap     = _Key.vmap

nmap{"<M-.>", "<Plug>(dial-increment)"}
vmap{"<M-.>", "<Plug>(dial-increment)"}
vmap {"g<M-.>", "<Plug>(dial-increment-additional)"}
nmap{"<M-,>", "<Plug>(dial-decrement)"}
vmap{"<M-,>", "<Plug>(dial-decrement)"}
vmap {"g<M-,>", "<Plug>(dial-decrement-additional)"}

