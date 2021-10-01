" -------------------------------------
" Remove Annoying Exmode
nnoremap Q  <Nop>
nnoremap q: <Nop>

" -------------------------------------
" Source Lua/Vim Files
nnoremap <localleader>l   <CMD>source %<CR>

" Edit/Reload Init.Vim
nnoremap <leader>ec <CMD>tabe ~/.config/nvim/init.*<CR>
nnoremap <leader>er <CMD>source ~/.config/nvim/init.*<CR>

"  Save
nnoremap cs <CMD>write<CR>
nnoremap <C-s> <CMD>write<CR>
inoremap <C-s> <Esc><Esc>:write<CR>
vnoremap <C-s> <Esc><Esc>:write<CR>

" Undo
nnoremap u <CMD>undo<CR>
nnoremap <C-z> <CMD>undo<CR>
inoremap <C-z> <Esc><CMD>undo<CR>
vnoremap <C-z> <Esc><CMD>undo<CR>

" Redo
nnoremap U <CMD>redo<CR>
nnoremap <C-y> <CMD>redo<CR>
inoremap <C-y> <Esc><CMD>redo<CR>
vnoremap <C-y> <Esc><CMD>redo<CR>

" Change pwd and reload
nnoremap cd <CMD>cd %:p:h<CR>
nnoremap cc <CMD>e<CR>

" Saner command-line history
cnoremap <expr> <C-n> wildmenumode() ? "\<c-n>" : "\<down>"
cnoremap <expr> <C-p> wildmenumode() ? "\<c-p>" : "\<up>"

" Quickly edit your macros
nnoremap <leader>em  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" ------------------------------------- Navigation
" use hjkl in insert mode
inoremap <A-h> <Left>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-l> <Right>

" Better J for join lines
nnoremap J mzJ`z

" move vertically by visual line on wrapped lines
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
nnoremap <expr> <Down> v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> <Up> v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Better Y for copy current line
nnoremap Y yg$

" Quickly move current line
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Quickly add empty lines
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

"- Delete
nnoremap x "_x
nnoremap X V"_x
vnoremap x "_x

" Alt+Delete
inoremap <A-BS> <C-w>
nnoremap <A-BS> i<C-w>
cnoremap <A-BS> <C-w>
inoremap <A-d> <C-w>
nnoremap <A-d> i<C-w>
cnoremap <A-d> <C-w>

" m and M for PageUp and PageDown
nnoremap m <C-d>
nnoremap M <C-u>

" keep to center
nnoremap {  {zzzv
nnoremap }  }zzzv
nnoremap ]c ]czzzv
nnoremap [c [czzzv
nnoremap [j <C-o>zzzv
nnoremap ]j <C-i>zzzv
nnoremap ]s ]szzzv
nnoremap [s [szzzv

" ------------------------------------- Search
" Keep center
nnoremap n nzzzv
nnoremap N Nzzzv

" no highlight search
nnoremap <Esc><Esc> <CMD>nohlsearch<CR>
nnoremap <C-n> <CMD>nohlsearch<CR>

" ------------------------------------- Indent
" better indenting experience
vnoremap < <gv
vnoremap > >gv

" ------------------------------------ Spelling
nnoremap cU <CMD>s/\<./\u&/g<CR><CMD>nohlsearch<CR>
noremap cu <CMD>s/\<./\l&/g<CR><CMD>nohlsearch<CR>

" ------------------------------------- Workspace

" better movement between windows
nnoremap <A-h> <C-w><C-h>
nnoremap <A-j> <C-w><C-j>
nnoremap <A-k> <C-w><C-k>
nnoremap <A-l> <C-w><C-l>
nnoremap <A-Left> <C-w><C-h>
nnoremap <A-Down> <C-w><C-j>
nnoremap <A-Up> <C-w><C-k>
nnoremap <A-Right> <C-w><C-l>

" Cycle tab
" nnoremap KK <CMD>BufferLineCyclePrev<CR>
" nnoremap JJ <CMD>BufferLineCycleNext<CR>
nnoremap <C-k> <CMD>BufferLineCyclePrev<CR>
nnoremap <C-j> <CMD>BufferLineCycleNext<CR>

" Move tab
" nnoremap HH <CMD>BufferLineMovePrev<CR>
" nnoremap LL <CMD>BufferLineMoveNext<CR>
nnoremap <C-h> <CMD>BufferLineMovePrev<CR>
nnoremap <C-l> <CMD>BufferLineMoveNext<CR>

nnoremap <A-1> <CMD>lua require'bufferline'.go_to_buffer(1)<CR>
nnoremap <A-2> <CMD>lua require'bufferline'.go_to_buffer(2)<CR>
nnoremap <A-3> <CMD>lua require'bufferline'.go_to_buffer(3)<CR>
nnoremap <A-4> <CMD>lua require'bufferline'.go_to_buffer(4)<CR>
nnoremap <A-5> <CMD>lua require'bufferline'.go_to_buffer(5)<CR>

" ------------------------------------ Terminal
" move between window
tnoremap <A-h> <C-\><C-n><C-w><C-h>
tnoremap <A-j> <C-\><C-n><C-w><C-j>
tnoremap <A-k> <C-\><C-n><C-w><C-k>
tnoremap <A-l> <C-\><C-n><C-w><C-l>

" move buffer
tnoremap <C-h> <C-\><C-n>:bp<CR>
tnoremap <C-l> <C-\><C-n>:bn<CR>

" go to normal mode using double esc
tnoremap <Esc><Esc> <C-\\><C-n>

" ------------------------------------- Runner
nnoremap <Leader>rl <CMD>luafile %<CR>
nnoremap <Leader>rn <CMD>!node %<CR>
nnoremap <localleader>rp <CMD>!python %<CR>

" ------------------------------------- Function
nnoremap <F1> <CMD>lua Util.session.last()<CR><CMD>echo "Session Restored"<CR>
nnoremap <F2> <CMD>lua Util.session.save()<CR><CMD>echo "Session Saved"<CR>
nnoremap <F4> <CMD>!opener %<CR>
noremap <F3>
      \ :exe "let g:strip_whitespace = !g:strip_whitespace"<CR>
      \ :exe "echo 'Strip whitespace mode toggled!'"<CR>

" ----------------------------------------- Notes
nnoremap <Leader>ni <CMD>lua Util.notes.index()<CR>
nnoremap <Leader>nn <CMD>lua Util.notes.search()<CR>

