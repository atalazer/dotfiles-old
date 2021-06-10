" Set formatoptions
au BufRead,FileType * set formatoptions-=ro

" Set filetypes
augroup Filetypes
    au!
    au BufNewFile,BufRead *.ejs,*.hbs set filetype=html
    au BufNewFile,BufRead .prettierrc,.eslintrc,tsconfig.json set filetype=jsonc
    au BufNewFile,BufRead *.svx,*.mdx set ft=markdown
    au BufNewFile,BufRead *.svelte set ft=svelte
    au BufNewFile,BufRead *.nix set ft=nix
    au BufNewFile,BufRead *.fish set filetype=fish
augroup END

" Set filetypes
" Set tabsize for each filetype
augroup Indents
    au!
    au FileType php,javascript setlocal sw=4 ts=4
    au FileType go,java setlocal sw=4 ts=4 sts=4 noexpandtab
    au FileType c,cpp,python,rust setlocal sw=4 ts=4 sts=4
    au FileType html,xml,css setlocal sw=2 ts=2 sts=2
    au FileType toml,yaml,json setlocal sw=2 ts=2 sts=2
augroup END

augroup Markdown
    au FileType markdown,text setlocal conceallevel=0 spell spelllang=id
    au BufEnter */posts/**.en.md setlocal spell spelllang=en
augroup END

" Remove trailing whitespace on save
let g:strip_whitespace = v:true
augroup Whitespace
    au!
    au BufWritePre * if g:strip_whitespace | %s/\s\+$//e
augroup END

" automatically go to insert mode on terminal buffer
autocmd BufEnter term://* startinsert

" enable/disable wordwrap
augroup Goyo
    au!
    au User GoyoEnter setlocal linebreak laststatus=0 scrolloff=999 nocursorline
    au User GoyoLeave setlocal nolinebreak laststatus=2 scrolloff=3 cursorline
augroup END

" disable nvim-compe inside telescope
augroup Compe
    au!
    au WinLeave,FileType TelescopePrompt let g:compe_enabled = v:true
    au WinEnter,FileType TelescopePrompt let g:compe_enabled = v:false
augroup END

augroup Emmet
    au!
    autocmd FileType html,svelte,javascriptreact EmmetInstall
augroup END

" highlight yanked text for 250ms
augroup Yank
    au!
    au TextYankPost * silent! lua vim.highlight.on_yank { timeout = 250, higroup = "Visual" }
augroup END

" " hide the cursor if we're inside NvimTree
" augroup HideCursor
"   au!
"   au WinLeave,FileType NvimTree set guicursor=n-v-c-sm:block,i-ci-ve:ver2u,r-cr-o:hor20,
"   au WinEnter,FileType NvimTree set guicursor=n-c-v:block-Cursor/Cursor-blinkon0,
" augroup END
" au FileType NvimTree hi Cursor blend=100
