" Set filetypes
augroup Filetypes
  au!
  au BufNewFile,BufRead *.ejs,*.hbs set filetype=html
  au BufNewFile,BufRead .prettierrc,.eslintrc,tsconfig.json set filetype=jsonc
  au BufNewFile,BufRead *.svx,*.mdx,*.md set ft=markdown
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
  au FileType php,javascript,typescript,svelte setlocal sw=2 ts=2 sts=2
  au FileType toml,yaml,json setlocal sw=2 ts=2 sts=2
  au FileType nix setlocal sw=2 ts=2 sts=2
augroup END

augroup Posts
  au!
  au BufRead */posts/**.md setlocal spell spelllang=id
  au BufRead */School/**.md setlocal spell spelllang=id
  au BufRead */posts/**.en.md setlocal spell spelllang=en
augroup END

" automatically go to insert mode on terminal buffer
augroup Term
  au!
  au BufEnter term://* startinsert
  au BufEnter term://* set showtabline=0 laststatus=0 noruler nonumber norelativenumber nolist
  au BufLeave term://* set showtabline=2 laststatus=2 ruler number relativenumber list
augroup END

" augroup Capslock
"     au!
"     au InsertEnter 
" augroup END

" highlight yanked text for 250ms
augroup Yank
  au!
  au TextYankPost * silent! lua vim.highlight.on_yank { timeout = 250, higroup = "Visual" }
augroup END


" Set github text field to markdown (firenvim stuff)
au BufEnter github.com_*.txt set filetype=markdown

" Remove trailing whitespace on save
let g:strip_whitespace = v:false
augroup Whitespace
  au!
  au BufWritePre * if g:strip_whitespace | %s/\s\+$//e
augroup END

augroup Dashboard
  au!
  au FileType dashboard setlocal showtabline=0 laststatus=0 signcolumn=no nolist noruler | au WinLeave <buffer> setlocal showtabline=2 laststatus=2 signcolumn=yes list ruler
  au FileType dashboard map q :quit<CR> | au WinLeave <buffer> unmap q
augroup END

augroup Emmet
  au!
  au FileType html,javascript,typescript,javascriptreact,typescriptreact,svelte EmmetInstall
augroup END

" " hide the cursor if we're inside NvimTree
" augroup HideCursor
"   au!
"   au WinLeave,FileType NvimTree set guicursor=n-v-c-sm:block,i-ci-ve:ver2u,r-cr-o:hor20,
"   au WinEnter,FileType NvimTree set guicursor=n-c-v:block-Cursor/Cursor-blinkon0,
" augroup END
" au FileType NvimTree hi Cursor blend=100
