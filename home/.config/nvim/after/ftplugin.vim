" Set filetypes
au BufNewFile,BufRead *.ejs,*.hbs set filetype=html
au BufNewFile,BufRead .prettierrc,.eslintrc,tsconfig.json set filetype=jsonc
au BufNewFile,BufRead *.svx,*.mdx set filetype=markdown
au BufNewFile,BufRead *.fish set filetype=fish

" Set tabsize for each filetype
au FileType php,javascript setlocal sw=4 ts=4
au FileType go,java setlocal sw=4 ts=4 sts=4 noexpandtab
au FileType c,cpp,python,rust setlocal sw=4 ts=4 sts=4
au FileType toml,yaml setlocal sw=2 ts=2 sts=2
au FileType html,xml,css setlocal sw=2 ts=2 sts=2

" Set commentstring for each filetype
au FileType xdefaults setlocal commentstring=\!\ %s

" Users
au BufEnter TODO,SCHEDULE setlocal filetype=markdown spell spelllang=id

" spelling in markdown and text
au FileType markdown,text setlocal conceallevel=0 spell spelllang=id
au BufEnter */posts/**.en.md setlocal spell spelllang=en

" automatically go to insert mode on terminal buffer
autocmd BufEnter term://* startinsert

" disable nvim-compe inside telescope
augroup Compe
  au!
  au WinLeave,FileType TelescopePrompt let g:compe_enabled = v:true
  au WinEnter,FileType TelescopePrompt let g:compe_enabled = v:false
augroup END

" VIM-vsnip
autocmd FileType * call vsnip#get_complete_items(bufnr())

" hide the cursor if we're inside NvimTree
augroup HideCursor
  au!
  au WinLeave,FileType NvimTree set guicursor=n-v-c-sm:block,i-ci-ve:ver2u,r-cr-o:hor20,
  au WinEnter,FileType NvimTree set guicursor=n-c-v:block-Cursor/Cursor-blinkon0,
augroup END
" au FileType NvimTree hi Cursor blend=100

