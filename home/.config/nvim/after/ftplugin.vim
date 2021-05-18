" Set formatoptions
au FileType * setlocal formatoptions-=ro

" Set filetypes
au BufNewFile,BufRead *.ejs,*.hbs set filetype=html
au BufNewFile,BufRead .prettierrc,.eslintrc,tsconfig.json set filetype=jsonc
au BufNewFile,BufRead *.svx,*.mdx set filetype=markdown

" Set tabsize for each filetype
au FileType php,javascript setlocal sw=4 ts=4
au FileType go,java setlocal sw=4 ts=4 sts=4 noexpandtab
au FileType c,cpp,python,rust setlocal sw=4 ts=4 sts=4
au FileType toml,yaml setlocal sw=2 ts=2 sts=2
au FileType html,xml,css setlocal sw=2 ts=2 sts=2

" spelling in markdown and text
au FileType markdown,text setlocal conceallevel=0 
au BufEnter */posts/**.md,*/docs/**.md,TODO setlocal spell spelllang=id
au BufEnter */posts/**.en.md setlocal spell spelllang=en

" Users
au BufEnter TODO,SCHEDULE setlocal filetype=markdown spell spelllang=id

" firenvim stuff
au BufEnter github.com_*.txt setlocal filetype=markdown spell spelllang=en,id
au BufEnter **.sch.id_*.txt setlocal spell spelllang=id

" automatically go to insert mode on terminal buffer
autocmd BufEnter term://* startinsert

" disable nvim-compe inside telescope
augroup Compe
  au!
  au WinLeave,FileType TelescopePrompt let g:compe_enabled = v:true
  au WinEnter,FileType TelescopePrompt let g:compe_enabled = v:false
augroup END

" hide the cursor if we're inside NvimTree
augroup HideCursor
  au!
  au WinLeave,FileType NvimTree set guicursor=n-v-c-sm:block,i-ci-ve:ver2u,r-cr-o:hor20,
  au WinEnter,FileType NvimTree set guicursor=n-c-v:block-Cursor/Cursor-blinkon0,
augroup END
" au FileType NvimTree hi Cursor blend=100

