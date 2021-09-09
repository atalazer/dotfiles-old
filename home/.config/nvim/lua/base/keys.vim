" -------------------------------------
" remove annoying exmode
nnoremap Q  <Nop>
nnoremap q: <Nop>

" --------------------------------------
inoremap jj <Esc><Esc>
inoremap <Esc> <Esc><Esc>

" -------------------------------------
nnoremap <leader>qa :quitall<CR>
nnoremap <C-s>      :write<CR>
inoremap <C-s>      <Esc>:write<CR>
vnoremap <C-s>      <Esc>:write<CR>

" source lua/vim files
nnoremap <localleader>l   <Cmd>source %<CR>

" reload file
nnoremap <localleader>ss  <Cmd>e!<CR>

" edit/reload init.vim
nnoremap <leader>ec :tabe ~/.config/nvim/init.lua<CR>
nnoremap <leader>er :source ~/.config/nvim/init.vim<CR>

" -------------------------------------
" move vertically by visual line on wrapped lines
nnoremap j gj
nnoremap k gk
nnoremap <Down> g<Down>
nnoremap <Up> g<Up>


"- Alt+Delete
inoremap <M-BS> <C-w>
nnoremap <M-BS> i<C-w>
cnoremap <M-BS> <C-w>

"- copy/yank, cut, paste
nnoremap Y y$
vnoremap C-x "+d
vnoremap C-c "+y
nnoremap C-v "+p

"- Delete
nnoremap x  "_x
nnoremap X V"_x
vnoremap x  "_x

"- Undo, Redo (broken)
nnoremap <C-z> :undo<CR>
inoremap <C-z> <Esc>:undo<CR>
nnoremap <C-y> :redo<CR>
inoremap <c-y> <esc>:redo<cR>

" -------------------------------------
" keeps jumplist after searching
nnoremap / ms/
nnoremap ? ms?

" Saner behavior for n and N
nnoremap <expr> n  'Nn'[v:searchforward]
xnoremap <expr> n  'Nn'[v:searchforward]
onoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> <C-g>  'Nn'[v:searchforward]
xnoremap <expr> <C-g>  'Nn'[v:searchforward]
onoremap <expr> <C-g>  'Nn'[v:searchforward]

nnoremap <expr> N  'nN'[v:searchforward]
xnoremap <expr> N  'nN'[v:searchforward]
onoremap <expr> N  'nN'[v:searchforward]
nnoremap <expr> <C-G>  'nN'[v:searchforward]
xnoremap <expr> <C-G>  'nN'[v:searchforward]
onoremap <expr> <C-G>  'nN'[v:searchforward]

" Saner command-line history
cnoremap <expr> <c-n> wildmenumode() ? "\<c-n>" : "\<down>"
cnoremap <expr> <c-p> wildmenumode() ? "\<c-p>" : "\<up>"

" no highlight search
nnoremap <Esc><Esc> :nohlsearch<CR>

" -------------------------------------
" better indenting experience
vnoremap < <gv
vnoremap > >gv

" -------------------------------------
" Quickly move current line
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

" Quickly add empty lines
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" Quickly edit your macros
nnoremap <leader>em  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" -------------------------------------
" run lua
nnoremap <Leader>rl <CMD>luafile %<CR>

" run node
nnoremap <Leader>rn <CMD>!node %<CR>

" run python
nnoremap({ "<localleader>rp", "<Cmd>!python %<CR>" })

" ------------------------------------- Function
nnoremap <F4> <cmd>!xdg-open %<CR>
noremap <F3>
      \ :exe "let g:strip_whitespace = !g:strip_whitespace"<CR>
      \ :exe "echo 'Strip whitespace mode toggled!'"<CR>

"- ===================================== Workspace

"- Tabs Buffer
nnoremap <M-k> :BufferLineCyclePrev<CR>
nnoremap <M-j> :BufferLineCycleNext<CR>
nnoremap <M-[> :BufferLineCyclePrev<CR>
nnoremap <M-]> :BufferLineCycleNext<CR>
nnoremap <M-PageUp> :BufferLineCyclePrev<CR>
nnoremap <M-PageDown> :BufferLineCycleNext<CR>

nnoremap <M-K> :BufferLineMovePrev<CR>
nnoremap <M-J> :BufferLineMoveNext<CR>

nnoremap <M-1> :lua require'bufferline'.go_to_buffer(1)<CR>
nnoremap <M-2> :lua require'bufferline'.go_to_buffer(2)<CR>
nnoremap <M-3> :lua require'bufferline'.go_to_buffer(3)<CR>
nnoremap <M-4> :lua require'bufferline'.go_to_buffer(4)<CR>
nnoremap <M-5> :lua require'bufferline'.go_to_buffer(5)<CR>
nnoremap <M-6> :lua require'bufferline'.go_to_buffer(6)<CR>
nnoremap <M-7> :lua require'bufferline'.go_to_buffer(7)<CR>
nnoremap <M-8> :lua require'bufferline'.go_to_buffer(8)<CR>
nnoremap <M-9> :lua require'bufferline'.go_to_buffer(9)<CR>
nnoremap <M-0> :lua require'bufferline'.go_to_buffer(10)<CR>

"- Movement between windows
nnoremap <M-Left>     <C-w><C-h>
nnoremap <M-Down>     <C-w><C-j>
nnoremap <M-Up>       <C-w><C-k>
nnoremap <M-Right>    <C-w><C-l>

"- Resize windows
nnoremap <M-S-Left>   <CMD>vertical resize -2<CR>
nnoremap <M-S-Down>   <CMD>resize +2<CR>
nnoremap <M-S-Up>     <CMD>resize -2<CR>
nnoremap <M-S-Right>  <CMD>vertical resize +2<CR>

" ------------------------------------ Spelling
nnoremap csU :s/\<./\u&/g<CR>:nohlsearch<CR>
nnoremap csu :s/\<./\l&/g<cR>:nohlsearch<cR>
"
