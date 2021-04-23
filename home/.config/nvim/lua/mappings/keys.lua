-- Keymap
_Key = require("astronauta.keymap")
map = _Key.map
noremap = _Key.noremap
nmap = _Key.nmap
nnoremap = _Key.nnoremap
imap = _Key.imap
inoremap = _Key.inoremap
vmap = _Key.vmap
vnoremap = _Key.vnoremap
xmap = _Key.xmap
xnoremap = _Key.xnoremap
tmap = _Key.tmap
tnoremap = _Key.tnoremap
cmap = _Key.tmap
cnoremap = _Key.cnoremap

-- remove annoying exmode
nnoremap({ "Q", "<Nop>" })
nnoremap({ ":q", "<Nop>" })
nnoremap({ "A", "<Nop>" })

-- Files
nnoremap({ "<C-s>", ":update<CR>" })
inoremap({ "<C-s>", "<Esc>:update<CR>" })
vnoremap({ "<C-s>", "<Esc>:update<CR>" })

nnoremap({ "<C-q><C-q>", ":q!<CR>" })
nnoremap({ "<leader>qq", ":q!<CR>" })
nnoremap({ "<C-q><C-a>", ":qa<CR>" })
nnoremap({ "<leader>qa", ":qa<CR>" })

-- Open Neovim Config
nnoremap({ "<leader>ec", ":tabe ~/.config/nvim/init.lua<CR>" })
nnoremap({ "<leader>er", ":luafile ~/.config/nvim/init.lua<CR>" })

-- Better Ctrl + Arrow
nmap({ "C-Left", "b", { silent = true } })
nmap({ "C-Right", "e", { silent = true } })
vmap({ "C-Left", "b", { silent = true } })
vmap({ "C-Right", "e", { silent = true } })

-- Alt+Delete
inoremap({ "<M-BS>", "<C-w>" })
nnoremap({ "<M-BS>", "i<C-w>" })
cnoremap({ "<M-BS>", "<C-w>" })

-- Delete
nnoremap({ "x", "\"_x" })
nnoremap({ "X", "V\"_x" })
vnoremap({ "x", "\"_x" })

-- Undo, Redo (broken)
nnoremap({ "<C-z>", ":undo<CR>" })
inoremap({ "<C-z>", "<Esc>:undo<CR>" })
nnoremap({ "<C-y>", ":redo<CR>" })
inoremap({ "<C-y>", "<Esc>:redo<CR>" })

-- Find
nnoremap({ "<ESC><ESC>", ":nohlsearch<CR>" })
nmap{"0", "^"}

-- Indent
vnoremap({ "<", "<gv" })
vnoremap({ ">", ">gv" })

-- ===================================== Workspace

-- Tabs Buffer
nnoremap({ "<M-a>", ":BufferLineCyclePrev<CR>", { silent = true } })
nnoremap({ "<M-S-a>", ":bf<CR>", { silent = true } })
nnoremap({ "<M-d>", ":BufferLineCycleNext<CR>", { silent = true } })
nnoremap({ "<M-S-d>", ":bl<CR>", { silent = true } })
nnoremap({ "<M-w>", ":bp<CR>:bd #<CR>", { silent = true } })
nnoremap({ "<M-w><M-w>", ":bp<CR>:bd! #<CR>", { silent = true } })
nnoremap({ "<M-e>", ":BufferLineMoveNext<CR>", { silent = true } })
nnoremap({ "<M-q>", ":BufferLineMovePrev<CR>", { silent = true } })
nnoremap({ "<M-z>", ":BufferLineSortByDirectory<CR>", { silent = true } })

-- Split
nnoremap({ "<localleader>sd", ":vsplit<CR>" })
nnoremap({ "<localleader>ss", ":split<CR>" })

-- Resize Pane
nnoremap({ "W", "<CMD>resize +2<CR>" })
nnoremap({ "A", "<CMD>vertical resize -2<CR>" })
nnoremap({ "S", "<CMD>resize -2<CR>" })
nnoremap({ "D", "<CMD>vertical resize +2<CR>" })

-- Smart way to move between windows
nnoremap({ "<localleader>w", "<C-W>k" })
nnoremap({ "<localleader>a", "<C-W>h" })
nnoremap({ "<localleader>s", "<C-W>j" })
nnoremap({ "<localleader>d", "<C-W>l" })

-- Terminal
nnoremap({ "<leader>tt", "<CMD>terminal<CR>" })
tnoremap({ "<Esc>qq", "<C-\\><C-n>" })

-- ===================================== Spelling
nnoremap({ "sd", "]s" })
nnoremap({ "sa", "[s" })
nnoremap({ "ss", "zg" })
nnoremap({ "sw", "zw" })
nnoremap({ "sq", "z=" })

-- ===================================== Function
map({ "<F1>", ":mksession! ~/.config/nvim/.last_session<cr>", { silent = true } })
map({ "<F2>", ":source ~/.config/nvim/.last_session<cr>", { silent = true } })
nnoremap({ "<F4>", "<cmd>!xdg-open %<CR>", { silent = true } })

-- ===================================== Plugins
-- Sayonara
nnoremap({ "<C-q>", ":Sayonara<CR>" })
nnoremap({ "<leader>sa", ":Sayonara<CR>" })
nnoremap({ "<leader>q", ":Sayonara<CR>" })

-- Vim Smoothie
vim.g.smoothie_no_default_mappings = 1
-- vim.g.smoothie_experimental_mappings = 1
map({ "<S-k>", "<Plug>(SmoothieUpwards)" })
map({ "<S-Up>", "<Plug>(SmoothieUpwards)" })
map({ "<PageUp>", "<Plug>(SmoothieUpwards)" })
map({ "<S-j>", "<Plug>(SmoothieDownwards)" })
map({ "<S-Down>", "<Plug>(SmoothieDownwards)" })
map({ "<PageDown>", "<Plug>(SmoothieDownwards)" })

-- Vim Easy Align
xmap({ "A", "<Plug>(EasyAlign)", { silent = true } })
nmap({ "A", "<Plug>(EasyAlign)", { silent = true } })

-- Glow
nnoremap({ "<leader>gg", "<CMD>Glow<CR>" })

-- TrueZen
nnoremap({ "<F9>", "<Cmd>TZAtaraxis<CR>" })
nnoremap({ "<F10>", "<Cmd>TZMinimalist<CR>" })
