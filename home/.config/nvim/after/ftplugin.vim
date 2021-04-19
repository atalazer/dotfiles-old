" Set filetypes
au BufNewFile,BufRead *.ejs,*.hbs setlocal filetype=html
au BufNewFile,BufRead .prettierrc,.eslintrc,tsconfig.json setlocal filetype=jsonc
au BufNewFile,BufRead TODO,*.svx,*.mdx setlocal filetype=markdown
au BufNewFile,BufRead *.zshrc,*.zsh,*.sh setlocal filetype=sh
au FileType bash,zsh,sh setlocal filetype=sh

" Set tabsize for each filetype
au FileType php,javascript setlocal sw=4 ts=4
au FileType go,java setlocal sw=4 ts=4 sts=4 noexpandtab
au FileType c,cpp,python,rust setlocal sw=4 ts=4 sts=4
au FileType lua,bash,vim setlocal sw=4 ts=4 sts=4
au FileType markdown,yaml setlocal sw=2 ts=2 sts=2

" spelling in markdown
au FileType markdown setlocal conceallevel=0 nospell
au BufEnter */blog/**.md,TODO setlocal spell spelllang=id
au BufEnter */blog/**.en.md setlocal spell spelllang=en

" Set text field to markdown (firenvim stuff)
au BufEnter github.com_*.txt setlocal filetype=markdown conceallevel=0 spell spelllang=en
au BufEnter **.sch.id_*.txt setlocal filetype=markdown conceallevel=0 spell spelllang=id

" enable/disable wordwrap
augroup Goyo
    au!
    au User GoyoEnter setlocal linebreak wrap
    au User GoyoLeave setlocal nolinebreak nowrap
augroup END

" hide the cursor if we're inside NvimTree
augroup HideCursor
    au!
    au WinLeave,FileType NvimTree set guicursor=n-v-c-sm:block,i-ci-ve:ver2u,r-cr-o:hor20,
    au WinEnter,FileType NvimTree set guicursor=n-c-v:block-Cursor/Cursor-blinkon0,
augroup END
" au FileType NvimTree hi Cursor blend=100
au FileType NvimTree setlocal nowrap
