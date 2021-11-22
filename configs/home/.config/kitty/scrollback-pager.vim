set relativenumber
set number
set mouse=a
set clipboard=unnamedplus
set virtualedit=all
set nolist 
set showtabline=0 
set foldcolumn=0
set signcolumn=yes:1

lua << EOF
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_set_keymap("n", "<leader>ow", "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>or", "<cmd>lua require'hop'.hint_lines()<cr>", {})

EOF

autocmd VimEnter * normal G
