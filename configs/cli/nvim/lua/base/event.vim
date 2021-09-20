" Set current working directory
autocmd VimEnter * cd %:p:h

" Move to last cursor
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

" Check if file changed when its window is focus, more eager than 'autoread'
autocmd FocusGained * checktime

" Cursorline
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

