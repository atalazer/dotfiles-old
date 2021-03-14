vim.cmd[[packadd barbar.nvim]]
vim.cmd[[packadd nvim-web-devicons]]

vim.g.bufferline = {
    animation = true,
    auto_hide = false,

    icons = true,
    icon_separator_active = '',
    icon_separator_inactive = '',
    icon_close_tab = '',
    icon_close_tab_modified = ' ',

    closable = true,
    clickable = true,

    semantic_letters = true,
    maximum_padding = 2
}

-- Barbar.nvim
nnoremap{"<M-d>", ":BufferNext<CR>"}
nnoremap{"<M-e>", ":BufferMoveNext<CR>"}
nnoremap{"<M-a>", ":BufferPrevious<CR>"}
nnoremap{"<M-q>", ":BufferMovePrevious<CR>"}
nnoremap{"<M-w>", ":BufferClose<CR>"}
nnoremap{"<M-w><M-w>", ":BufferClose!<CR>"}

nnoremap{"<M-1>", ":BufferGoto 1<CR>"}
nnoremap{"<M-2>", ":BufferGoto 2<CR>"}
nnoremap{"<M-3>", ":BufferGoto 3<CR>"}
nnoremap{"<M-4>", ":BufferGoto 4<CR>"}
nnoremap{"<M-5>", ":BufferGoto 5<CR>"}
nnoremap{"<M-6>", ":BufferGoto 6<CR>"}
nnoremap{"<M-7>", ":BufferGoto 7<CR>"}
nnoremap{"<M-8>", ":BufferGoto 8<CR>"}
nnoremap{"<M-9>", ":BufferGoto 9<CR>"}
nnoremap{"<M-0>", ":BufferGoto 10<CR>"}

