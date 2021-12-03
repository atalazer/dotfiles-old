" Set current working directory
autocmd VimEnter * cd %:p:h

" Move to last cursor
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

" Check if file changed when its window is focus, more eager than 'autoread'
autocmd FocusGained * checktime

" Hide Cursorline on Unfocused Insert Mode
autocmd InsertLeave * set cursorline
autocmd InsertEnter * set nocursorline

" Hide Stuff on Unfocused Windows
autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline

" highlight yanked text for 250ms
autocmd TextYankPost * silent! lua vim.highlight.on_yank { timeout = 100 }
