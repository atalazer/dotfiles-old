local _Key = vim.keymap
local map = _Key.map
local nmap = _Key.nmap
local nnoremap = _Key.nnoremap
local inoremap = _Key.inoremap
local vnoremap = _Key.vnoremap
local xmap = _Key.xmap
local cnoremap = _Key.cnoremap

-- Unmap
map({"Q", "<Nop>"})
map({"q:", "<Nop>"})

-- move vertically by visual line on wrapped lines
nnoremap({ "j", "gj" })
nnoremap({ "k", "gk" })
nnoremap({ "<Down>", "gj" })
nnoremap({ "<Up>", "gk" })

-- Files
nnoremap({ "<C-s>", ":update<CR>" })
inoremap({ "<C-s>", "<Esc>:update<CR>" })
vnoremap({ "<C-s>", "<Esc>:update<CR>" })
nnoremap({ "cd", ":cd %:p:h<CR>", { silent = true } })

-- Open Neovim Config
nnoremap({ "<leader>ec", ":tabe ~/.config/nvim/init.lua<CR>" })
nnoremap({ "<leader>er", ":luafile ~/.config/nvim/init.lua<CR>" })

-- Run/Source File
nnoremap({ "<localleader>l", "<Cmd>luafile %<CR>"})
nnoremap({ "<localleader>sl", "<Cmd>luafile %<CR>"})
nnoremap({ "<localleader>ss", "<Cmd>e!<CR>"})
nnoremap({ "<localleader>sv", "<Cmd>source %<CR>"})
nnoremap({ "<localleader>rl", "<Cmd>!lua %<CR>"})
nnoremap({ "<localleader>rp", "<Cmd>!python %<CR>"})

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
inoremap({ "<c-y>", "<esc>:redo<cR>" })

-- Find
nnoremap({ "<Esc><Esc>", ":nohlsearch<CR>" })

-- Indent
vnoremap({ "<", "<gv" })
vnoremap({ ">", ">gv" })

-- ===================================== Spelling
nnoremap({ "csU", "<Cmd>s/\\<./\\u&/g | nohlsearch<CR>", { silent = true } })
nnoremap({ "csu", "<Cmd>s/\\<./\\l&/g | nohlsearch<CR>", { silent = true } })

-- ===================================== Workspace

-- Tabs Buffer
nnoremap({ "<M-[>",      ":BufferLineCyclePrev<CR>", { silent = true } })
nnoremap({ "<M-]>",      ":BufferLineCycleNext<CR>", { silent = true } })
nnoremap({ "<M-{>",      ":BufferLineMovePrev<CR>", { silent = true } })
nnoremap({ "<M-}>",      ":BufferLineMoveNext<CR>", { silent = true } })
nnoremap({ "<M-w>",      ":Sayonara<CR>", { silent = true } })
nnoremap({ "<M-w><M-w>", ":Sayonara!<CR>", { silent = true } })

-- Movement between windows
nnoremap({ "<M-Left>",  "<C-w><C-h>" })
nnoremap({ "<M-Down>",  "<C-w><C-j>" })
nnoremap({ "<M-Up>",    "<C-w><C-k>" })
nnoremap({ "<M-Right>", "<C-w><C-l>" })

-- Resize windows
nnoremap({ "<M-S-Left>",  "<CMD>vertical resize -2<CR>" })
nnoremap({ "<M-S-Down>",  "<CMD>resize +2<CR>" })
nnoremap({ "<M-S-Up>",    "<CMD>resize -2<CR>" })
nnoremap({ "<M-S-Right>", "<CMD>vertical resize +2<CR>" })

-- ===================================== Function
nnoremap({ "<F1>", ":mksession! ~/.cache/nvim/sessions/last.vim<CR>", { silent = true } })
nnoremap({ "<F2>", ":source ~/.cache/nvim/sessions/last.vim<CR>", { silent = true } })
nnoremap({ "<F4>", "<cmd>!xdg-open %<CR>", { silent = true } })

nnoremap({
    "<F3>",
    ":let g:strip_whitespace = !g:strip_whitespace | echo 'Strip whitespace mode toggled!'<CR>",
    { silent = true },
})

-- ===================================== Plugins
-- Sayonara
nnoremap({ "<leader>q",  ":Sayonara<CR>" })
nnoremap({ "<leader>qq", ":Sayonara!<CR>" })
nnoremap({ "<leader>qa", ":qa<CR>" })

-- Bufferline
nnoremap({ "<M-1>", ":lua require'bufferline'.go_to_buffer(1)<CR>", { silent = true } })
nnoremap({ "<M-2>", ":lua require'bufferline'.go_to_buffer(2)<CR>", { silent = true } })
nnoremap({ "<M-3>", ":lua require'bufferline'.go_to_buffer(3)<CR>", { silent = true } })
nnoremap({ "<M-4>", ":lua require'bufferline'.go_to_buffer(4)<CR>", { silent = true } })
nnoremap({ "<M-5>", ":lua require'bufferline'.go_to_buffer(5)<CR>", { silent = true } })
nnoremap({ "<M-6>", ":lua require'bufferline'.go_to_buffer(6)<CR>", { silent = true } })
nnoremap({ "<M-7>", ":lua require'bufferline'.go_to_buffer(7)<CR>", { silent = true } })
nnoremap({ "<M-8>", ":lua require'bufferline'.go_to_buffer(8)<CR>", { silent = true } })
nnoremap({ "<M-9>", ":lua require'bufferline'.go_to_buffer(9)<CR>", { silent = true } })
nnoremap({ "<M-0>", ":lua require'bufferline'.go_to_buffer(10)<CR>", { silent = true } })

-- Telescope
nnoremap({ "<C-p>",      ":Telescope find_files<CR>"   , { silent = true } })
nnoremap({ "<leader>fl", ":Telescope live_grep<CR>"    , { silent = true } })
nnoremap({ "<leader>fg", ":Telescope git_commits<CR>"  , { silent = true } })
nnoremap({ "<leader>fo", ":Telescope oldfiles<CR>"     , { silent = true } })
nnoremap({ "<leader>fd", ":Telescope marks<CR>"        , { silent = true } })
nnoremap({ "<leader>fb", ":Telescope file_browser<CR>" , { silent = true } })
nnoremap({ "<leader>fk", ":Telescope keymaps<CR>"      , { silent = true } })
nnoremap({ "<leader>fc", ":Telescope colorscheme<CR>"  , { silent = true } })

-- :Telescope Extensions
nnoremap({ "<leader>ff", ":Telescope frecency<CR>"     , { silent = true } })
nnoremap({ "<leader>fm", ":Telescope media_files<CR>"  , { silent = true } })

-- Dashboard.nvim
nnoremap({ "<leader>sl", ":SessionLoad last<CR>" })
nnoremap({ "<leader>ss", ":SessionSave<CR>" })

-- Hop
nmap({ "<space>w", ":HopWord<CR>" })
nmap({ "<space>p", ":HopPattern<CR>" })

-- Colorizer
nnoremap({ "<leader>cc", ":ColorizerToggle<CR>" })

-- NvimTree
nnoremap({ "`", ":NvimTreeToggle<CR>", { silent = true } })

-- Lazygit.nvim
nnoremap({ "<leader>gt", "<Cmd>LazyGit<CR>", { silent = true } })

-- Glow.nvim
nnoremap({ "<leader>gg", ":Glow<CR>", { silent = true } })

-- goyo.vim
nnoremap({ "<leader>gy", ":Goyo<CR>", { silent = true } })

-- Vim Easy Align
xmap({ "ga", "<Plug>(EasyAlign)", { silent = true } })
nmap({ "ga", "<Plug>(EasyAlign)", { silent = true } })

