local present, luasnip = pcall(require, "luasnip")
if not present then
   return
end

local s = luasnip.s -- Snippet
local t = luasnip.t -- Text
local i = luasnip.i -- Input
local f = luasnip.f -- Function

luasnip.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    -- store_selection_keys = "",
    -- enable_autosnippets = false,
})

require("luasnip/loaders/from_vscode").load()

-- vim.cmd([[
--     snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(1)<CR>
--     snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>
--     imap <silent><expr> <C-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-k>'
--     inoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>
--     imap <silent><expr> <C-e> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
-- ]])
