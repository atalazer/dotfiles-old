" -------------------------------------
" Remove Annoying Exmode
nnoremap Q  <Nop>
nnoremap q: <Nop>

" Disable arrow key
map <Up> <Nop>
map <Down> <Nop>
map <Right> <Nop>
map <Left> <Nop>

" -------------------------------
" Map Control-; to :
nnoremap <C-;> :

" -------------------------------------
" Source Lua/Vim Files
nnoremap <localleader>l :source %<CR>

" Edit/Reload Init.Vim
nnoremap <leader>ec <CMD>tabe ~/.config/nvim/init.*<CR>
nnoremap <leader>er <CMD>source ~/.config/nvim/init.*<CR>

"  Save
nnoremap <C-s> <CMD>update<CR>
inoremap <C-s> <Esc><Esc><CMD>update<CR>
vnoremap <C-s> <Esc><Esc><CMD>update<CR>

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

" Saner command-line history
cnoremap <expr> <C-n> wildmenumode() ? "\<c-n>" : "\<down>"
cnoremap <expr> <C-p> wildmenumode() ? "\<c-p>" : "\<up>"

" ------------------------------------- Navigation
" use hjkl in insert mode
inoremap <A-h> <Left>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-l> <Right>

" Better J for join lines
nnoremap J mzJ`z

" B for break line
function! Breakline()
  s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
  call histdel("/", -1)
endfunction
nnoremap <silent> B :<C-u>call Breakline()<CR>

" move vertically by visual line on wrapped lines
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
" nnoremap <expr> <Down> v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
" nnoremap <expr> <Up> v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Better Y for copy current line
nnoremap Y y$

" Quickly move current line
nnoremap [e :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e :<c-u>execute 'move +'. v:count1<cr>
vnoremap J  :m '>+1<CR>gv=gv
vnoremap K  :m '<-2<CR>gv=gv

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

" Control+Delete
inoremap <C-BS> <C-w>
nnoremap <C-BS> i<C-w>
cnoremap <C-BS> <C-w>

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
nnoremap <C-n> <CMD>nohlsearch<CR>

" ------------------------------------- Indent
" better indenting experience
vnoremap < <gv
vnoremap > >gv

" ------------------------------------ Sorting
vnoremap gs :'<,'>sort<CR>

" ------------------------------------ Spelling
nnoremap csU <CMD>s/\<./\u&/g<CR><CMD>nohlsearch<CR>
nnoremap csu <CMD>s/\<./\l&/g<CR><CMD>nohlsearch<CR>

" ------------------------------------- Workspace

" better movement between windows
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-Left> <C-w><C-h>
nnoremap <C-Down> <C-w><C-j>
nnoremap <C-Up> <C-w><C-k>
nnoremap <C-Right> <C-w><C-l>

" ------------------------------------ Terminal
" move between window
tnoremap <C-h> <C-\><C-n><C-w><C-h>
tnoremap <C-j> <C-\><C-n><C-w><C-j>
tnoremap <C-k> <C-\><C-n><C-w><C-k>
tnoremap <C-l> <C-\><C-n><C-w><C-l>
tnoremap <C-Left> <C-\><C-n><C-w><C-h>
tnoremap <C-Down> <C-\><C-n><C-w><C-j>
tnoremap <C-Up> <C-\><C-n><C-w><C-k>
tnoremap <C-Right> <C-\><C-n><C-w><C-l>

" move buffer
tnoremap <C-PageUp> <C-\><C-n>:bp<CR>
tnoremap <C-PageDown> <C-\><C-n>:bn<CR>

" go to normal mode
tnoremap <C-w><C-w> <C-\\><C-n>

" ------------------------------------- Runner
nnoremap <Leader>rl <CMD>luafile %<CR>
nnoremap <Leader>rn <CMD>!node %<CR>
nnoremap <localleader>rp <CMD>!python %<CR>
