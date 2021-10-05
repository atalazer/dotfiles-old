" Set filetypes
" ----------------------
augroup Filetypes
  au!
  au BufNewFile,BufRead *.ejs,*.hbs set filetype=html
  au BufNewFile,BufRead .prettierrc,.eslintrc,tsconfig.json set filetype=jsonc
  au BufNewFile,BufRead *.svx,*.mdx,*.md set ft=markdown
  au BufNewFile,BufRead *.svelte set ft=svelte
  au BufNewFile,BufRead *.nix set ft=nix
  au BufNewFile,BufRead *.nim set ft=nim
  au BufNewFile,BufRead *.fish set filetype=fish
  au BufNewFile,BufRead *.yuck set filetype=yuck
augroup END

" set commentstring
augroup CommentString
" ----------------------
  au!
  au FileType toml,yaml set commentstring=#%s
augroup END

" Set tabsize for each filetype
" ----------------------
augroup Indents
  au!
  au FileType html,xml,css set sw=2 ts=2 sts=2
  au FileType php,javascript,typescript set sw=2 ts=2 sts=2
  au FileType toml,yaml,json set sw=2 ts=2 sts=2
augroup END

" Blog
" ----------------------
augroup Posts
  au!
  au BufRead */posts/**.md setlocal spell spelllang=id
  au BufRead */School/**.md setlocal spell spelllang=id
  au BufRead */posts/**.en.md setlocal spell spelllang=en
augroup END

" Term
" ----------------------
augroup Term
  au!
  au BufEnter term://* startinsert
  au BufEnter term://* set showtabline=0 laststatus=0 noruler nonumber norelativenumber nolist
  au BufLeave term://* set showtabline=2 laststatus=2 ruler number relativenumber list
augroup END

" Remove trailing whitespace on save
" ----------------------
let g:strip_whitespace = v:false
augroup Whitespace
  au!
  au BufWritePre * if g:strip_whitespace | %s/\s\+$//e
augroup END

" ===================================================== Plugins
augroup Emmet
  au!
  au FileType html,javascript,typescript,javascriptreact,typescriptreact,svelte EmmetInstall
augroup END

augroup Alpha
  au!
  au FileType alpha set showtabline=0 laststatus=0 nolist cmdheight=1 | 
        \ autocmd BufUnload <buffer> set showtabline=2 laststatus=2 list cmdheight=2
augroup END
