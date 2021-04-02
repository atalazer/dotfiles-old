" Set formatoptions
au FileType * setlocal formatoptions-=ro

" Set filetypes
au BufNewFile,BufRead *.ejs,*.hbs set filetype=html
au BufNewFile,BufRead .prettierrc,.eslintrc,tsconfig.json set filetype=jsonc
au BufNewFile,BufRead *.svx,*.mdx set ft=markdown

" Set tabsize for each filetype
au FileType php,javascript setlocal sw=4 ts=4
au FileType go,java setlocal sw=4 ts=4 sts=4 noexpandtab
au FileType c,cpp,python,rust setlocal sw=4 ts=4 sts=4
au FileType lua,bash,vim setlocal sw=4 ts=4 sts=4
au FileType markdown,yaml setlocal sw=2 ts=2 sts=2

" enable spelling in markdown
au FileType markdown setlocal conceallevel=0 nospell
au BufEnter */blog/**.md setlocal spell spelllang=id
au BufEnter */blog/**.en.md setlocal spell spelllang=en

" Set github text field to markdown (firenvim stuff)
au BufEnter github.com_*.txt set filetype=markdown
au BufEnter **.sch.id_*.txt setlocal filetype=markdown conceallevel=0 spell spelllang=id

" Remove trailing whitespace on save
au BufWritePre * %s/\s\+$//e

" automatically go to insert mode on terminal buffer
autocmd TermOpen * startinsert

" enable/disable wordwrap
augroup Goyo
    au!
    au User GoyoEnter setlocal linebreak wrap
    au User GoyoLeave setlocal nolinebreak nowrap
augroup END

" disable nvim-compe inside telescope
augroup Compe
    au!
    au BufEnter * let g:compe_enabled = v:true
    au FileType TelescopePrompt let g:compe_enabled = v:false
augroup END

" hide the cursor if we're inside NvimTree
augroup HideCursor
    au!
    au WinLeave,FileType NvimTree set guicursor=n-v-c-sm:block,i-ci-ve:ver2u,r-cr-o:hor20,
    au WinEnter,FileType NvimTree set guicursor=n-c-v:block-Cursor/Cursor-blinkon0,
augroup END
au FileType NvimTree hi Cursor blend=100