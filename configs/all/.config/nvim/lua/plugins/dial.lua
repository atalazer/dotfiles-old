local inc_key = "<C-a>"
local dec_key = "<C-x>"

nmap(inc_key, "<Plug>(dial-increment)")
vmap(inc_key, "<Plug>(dial-increment)")
vmap("g"..inc_key, "<Plug>(dial-increment-additional)")

nmap(dec_key, "<Plug>(dial-decrement)")
vmap(dec_key, "<Plug>(dial-decrement)")
vmap("g"..dec_key, "<Plug>(dial-decrement-additional)")

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
