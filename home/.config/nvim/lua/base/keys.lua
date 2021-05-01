-- Keymap
local _Key = require("astronauta.keymap")
local nmap     = _Key.nmap
local nnoremap = _Key.nnoremap
local inoremap = _Key.inoremap
local vmap     = _Key.vmap
local vnoremap = _Key.vnoremap
local xmap     = _Key.xmap
local cnoremap = _Key.cnoremap

-- move vertically by visual line on wrapped lines
nnoremap({ "j", "gj" })
nnoremap({ "k", "gk" })
nmap({ "0", "^" })

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
nnoremap({ "<leader>l", ":luafile %<CR>" })

-- Better Ctrl + Arrow
nmap({ "C-Left", "b", { silent = true } })
vmap({ "C-Left", "b", { silent = true } })
nmap({ "C-Right", "w", { silent = true } })
vmap({ "C-Right", "w", { silent = true } })

-- Alt+Delete
inoremap({ "<M-BS>", "<C-w>" })
nnoremap({ "<M-BS>", "i<C-w>" })
cnoremap({ "<M-BS>", "<C-w>" })

-- copy/yank, cut, paste
nnoremap({ "Y", "y$" })
vnoremap({ "C-x", "\"+d" })
vnoremap({ "C-c", "\"+y" })
nnoremap({ "C-v", "\"+p" })

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

-- Movement between windows
nnoremap({ "<M-h>", "<C-w><C-h>" })
nnoremap({ "<M-j>", "<C-w><C-j>" })
nnoremap({ "<M-k>", "<C-w><C-k>" })
nnoremap({ "<M-l>", "<C-w><C-l>" })

-- Resize windows
nnoremap({ "<C-h>", "<CMD>vertical resize -2<CR>" })
nnoremap({ "<C-j>", "<CMD>resize +2<CR>" })
nnoremap({ "<C-k>", "<CMD>resize -2<CR>" })
nnoremap({ "<C-l>", "<CMD>vertical resize +2<CR>" })

-- ===================================== Spelling
nnoremap({ "sd", "]s" })
nnoremap({ "sa", "[s" })
nnoremap({ "S", "zg" })
nnoremap({ "sq", "z=" })

-- ===================================== Function
nnoremap({ "<F1>", ":mksession! ~/.config/nvim/sessions/last_session.vim<CR>", { silent = true } })
nnoremap({ "<F2>", ":source ~/.config/nvim/sessions/last_session.vim<CR>", { silent = true } })
nnoremap({ "<F4>", "<cmd>!xdg-open %<CR>", { silent = true } })

-- ===================================== Plugins
-- Sayonara
nnoremap({ "<C-q>", ":Sayonara<CR>" })
nnoremap({ "<leader>sa", ":Sayonara<CR>" })
nnoremap({ "<leader>q", ":Sayonara<CR>" })

-- vim-commentary
nmap({ "//", "gcc" })
vmap({ "//", "gcc<Esc>" })

-- Vim Easy Align
xmap({ "A", "<Plug>(EasyAlign)", { silent = true } })
nmap({ "A", "<Plug>(EasyAlign)", { silent = true } })

-- VIM Translate
-- " Echo translation in the cmdline
nmap({"tt", "<Plug>Translate"})
vmap({"tt", "<Plug>TranslateV"})
-- " Display translation in a window
nmap({"tw", "<Plug>TranslateW"})
vmap({"tw", "<Plug>TranslateWV"})
-- " Replace the text with translation
nmap({"tr", "<Plug>TranslateR"})
vmap({"tr", "<Plug>TranslateRV"})
-- " Translate the text in clipboard
nmap({"tx", "<Plug>TranslateX"})

-- Glow.nvim
nmap({"<leader>gg", ":Glow<CR>"})

-- TrueZen
nnoremap({ "<F9>", "<Cmd>TZAtaraxis<CR>", { silent = true } })
nnoremap({ "<F10>", "<Cmd>TZMinimalist<CR>", { silent = true } })

-- NvimTree
nnoremap({ "`", ":NvimTreeToggle<CR>" })
