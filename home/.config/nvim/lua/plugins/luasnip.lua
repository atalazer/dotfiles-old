local luasnip = require("luasnip")
local s = luasnip.s -- Snippet
local t = luasnip.t -- Text
local i = luasnip.i -- Input
local f = luasnip.f -- Function

luasnip.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    store_selection_keys = "",
    enable_autosnippets = false,
})

require("luasnip/loaders/from_vscode").load()

luasnip.snippets = {
    all = {
        luasnip.parser.parse_snippet({ trig = "todo" }, "TODO(atalazer): ${1:todo}"),
        luasnip.parser.parse_snippet({ trig = "fixme" }, "FIXME(atalazer): ${1:fixme}"),
        s({ trig = "date" }, { t({ vim.fn.strftime("%F-%T") }) }),
    },
    tex = {
        luasnip.parser.parse_snippet({ trig = "us" }, "\\usepackage{$0}"),
        luasnip.parser.parse_snippet({ trig = "bf" }, "\\textbf{$0}"),
        luasnip.parser.parse_snippet({ trig = "it" }, "\\textit{$0}"),
        luasnip.parser.parse_snippet({ trig = "tt" }, "\\texttt{$0}"),
        s({ trig = "beg" }, {
            t({ "\\begin{" }),
            i(1),
            t({ "}", "" }),
            i(0),
            t({ "", "\\end{" }),
            f(copy, { 1 }),
            t({ "}" }),
        }),
    },
}

vim.cmd([[
    snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(1)<CR>
    snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>
    imap <silent><expr> <C-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-k>'
    inoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>
    imap <silent><expr> <C-e> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]])
