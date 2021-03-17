-- Keymap
_Key = require("astronauta.keymap")
map  = _Key.map  ; noremap  = _Key.noremap
nmap = _Key.nmap ; nnoremap = _Key.nnoremap
imap = _Key.imap ; inoremap = _Key.inoremap
vmap = _Key.vmap ; vnoremap = _Key.vnoremap
xmap = _Key.xmap ; xnoremap = _Key.xnoremap
tmap = _Key.tmap ; tnoremap = _Key.tnoremap
cmap = _Key.tmap ; cnoremap = _Key.cnoremap

-- remove annoying exmode
nnoremap{"Q", "<nop>"}
nnoremap{":q", "<nop>"}

-- Files
nnoremap{"<C-s>", ":update<CR>"}
inoremap{"<C-s>", "<ESC>:update<CR>"}

nnoremap{"<C-q><C-q>", ":q!<CR>"}
nnoremap{"<leader>qq", ":q!<CR>"}
nnoremap{"<C-q><C-a>", ":qa<CR>"}
nnoremap{"<leader>qa", ":qa<CR>"}

-- Open Neovim Config
nnoremap{"<leader>ec", ":tabe ~/.config/nvim/init.lua<CR>"}
nnoremap{"<leader>er", ":luafile ~/.config/nvim/init.lua<CR>"}
nnoremap{"<Leader>l", "<CMD>luafile %<CR>", { silent = false}}

-- Exit Insert and Visual
inoremap{"<M-q>", "<ESC>"}
vnoremap{"<M-q>", "<ESC>"}
inoremap{"<C-e>", "<ESC>"}
vnoremap{"<C-e>", "<ESC>"}

-- Better Ctrl + Arrow
nmap{"C-Left"  , "b" , {silent = true}}
nmap{"C-Right" , "e" , {silent = true}}
vmap{"C-Left"  , "b" , {silent = true}}
vmap{"C-Right" , "e" , {silent = true}}

-- Alt+Delete
inoremap{"<M-BS>", "<C-w>"}
nnoremap{"<M-BS>", "i<C-w>"}
cnoremap{"<M-BS>", "<C-w>"}

-- Cut, Paste, Copy
vmap{"<C-x>", "d"}
vmap{"<C-v>", "p"}
vmap{"<C-c>", "y"}

-- Undo, Redo (broken)
nnoremap{"<C-z>", ":undo<CR>"}
inoremap{"<C-z>", "<Esc>:undo<CR>"}
nnoremap{"<C-y>", ":redo<CR>"}
inoremap{"<C-y>", "<Esc>:redo<CR>"}

-- Find
nnoremap{"<ESC><ESC>", ":nohlsearch<CR>"}

-- Indent
vnoremap{"<", "<gv"}
vnoremap{">", ">gv"}

-- ===================================== Workspace

-- Split
nnoremap{"<Leader>sd", ":vsplit<CR>"}
nnoremap{"<Leader>ss", ":split<CR>"}

-- Resize Pane
map{"<localleader>w", ":resize +5<CR>", {silent = true}}
map{"<localleader>a", ":vertical resize -5<CR>", {silent = true}}
map{"<localleader>s", ":resize -5<CR>", {silent = true}}
map{"<localleader>d", ":vertical resize +5<CR>", {silent = true}}

-- Smart way to move between windows
nnoremap{"<leader>w", "<C-W>k"}
nnoremap{"<leader>a", "<C-W>h"}
nnoremap{"<leader>s", "<C-W>j"}
nnoremap{"<leader>d", "<C-W>l"}

-- ===================================== Function
-- Vim Session
map{"<F2>", ":mksession! ~/.config/nvim/.last_session<cr>"}
map{"<F3>", ":source ~/.config/nvim/.last_session<cr>"}
nnoremap{"<F4>", "<cmd>!xdg-open %", { silent = true }}
map{"<F8>", ":set autochdir! autochdir?<CR>"}

