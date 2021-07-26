" prevent typo when pressing `wq` or `q`
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))

" Set current working directory
autocmd VimEnter * cd %:p:h

" Move to last cursor
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Check if file changed when its window is focus, more eager than 'autoread'
autocmd FocusGained * checktime

" Set filetypes
augroup Filetypes
    au!
    au BufNewFile,BufRead *.ejs,*.hbs set filetype=html
    au BufNewFile,BufRead .prettierrc,.eslintrc,tsconfig.json set filetype=jsonc
    au BufNewFile,BufRead *.svx,*.mdx set ft=markdown
    au BufNewFile,BufRead *.svelte set ft=svelte
    au BufNewFile,BufRead *.nix set ft=nix
    au BufNewFile,BufRead *.nim set ft=nim
    au BufNewFile,BufRead *.fish set filetype=fish
augroup END

" Set filetypes
" Set tabsize for each filetype
augroup Indents
    au!
    au FileType html,xml,css setlocal sw=2 ts=2 sts=2
    au FileType php,javascript setlocal sw=2 ts=2
    au FileType toml,yaml,json setlocal sw=2 ts=2 sts=2
augroup END

augroup Posts
    au!
    au BufRead */posts/**.md setlocal spell spelllang=id
    au BufRead */posts/**.en.md setlocal spell spelllang=en
augroup END

" automatically go to insert mode on terminal buffer
augroup Term
    au!
    au BufEnter term://* startinsert
    au BufEnter term://* set showtabline=0 laststatus=0 noruler nonumber norelativenumber nolist
    au BufLeave term://* set showtabline=2 laststatus=2 ruler number relativenumber list
augroup END

" highlight yanked text for 250ms
augroup Yank
    au!
    au TextYankPost * silent! lua vim.highlight.on_yank { timeout = 250, higroup = "Visual" }
augroup END

" Remove trailing whitespace on save
let g:strip_whitespace = v:false
augroup Whitespace
    au!
    au BufWritePre * if g:strip_whitespace | %s/\s\+$//e
augroup END

augroup Dashboard
    au!
    au FileType dashboard set showtabline=0 laststatus=0 signcolumn=no nolist noruler | au WinLeave <buffer> set showtabline=2 laststatus=2 signcolumn=yes list ruler
    au FileType dashboard map q :quit<CR> | au WinLeave <buffer> unmap q
augroup END

augroup Goyo
    au!
    au User GoyoEnter setlocal showtabline=0 laststatus=0 scrolloff=999 signcolumn=no nolist noruler
    au User GoyoEnter IndentBlanklineDisable
    au User GoyoLeave setlocal showtabline=2 laststatus=2 scrolloff=3 signcolumn=yes list ruler
    au User GoyoLeave IndentBlanklineEnable
augroup END

" disable nvim-compe inside telescope
augroup Compe
    au!
    au WinLeave,FileType TelescopePrompt let g:compe_enabled = v:true
    au WinEnter,FileType TelescopePrompt let g:compe_enabled = v:false
augroup END

augroup Emmet
    au!
    au FileType html,css,markdown EmmetInstall
    au BufRead *.html,*.css,*.md EmmetInstall
augroup END

" " hide the cursor if we're inside NvimTree
" augroup HideCursor
"   au!
"   au WinLeave,FileType NvimTree set guicursor=n-v-c-sm:block,i-ci-ve:ver2u,r-cr-o:hor20,
"   au WinEnter,FileType NvimTree set guicursor=n-c-v:block-Cursor/Cursor-blinkon0,
" augroup END
" au FileType NvimTree hi Cursor blend=100
