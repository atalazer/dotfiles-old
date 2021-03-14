vim.cmd[[packadd vimade]]
vim.g.vimade = {
    fadelevel = 0.7,
    enablesign = 1,
    detecttermcolors = 1,
    usecursorhold = 1,
    enabletreesitter =1
}
vim.api.nvim_exec([[
if has('gui_running') == 0 && has('nvim') == 0
   call feedkeys(":silent execute '!' | redraw!\<CR>")
endif
]], true)
