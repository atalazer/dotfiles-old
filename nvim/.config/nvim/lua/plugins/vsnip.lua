vim.cmd [[packadd vim-vsnip]]
vim.cmd[[packadd vim-vsnip-integ]]

vim.g.vsnip_snippet_dir = vim.fn.stdpath("config").."/snippets"
vim.g.vsnip_filetypes = {}

local keymap = vim.api.nvim_set_keymap

keymap('i', '<C-]>', 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<C-]>"', { expr = true})
keymap('s', '<C-]>', 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<C-]>"', { expr = true})
keymap('i', '<C-[>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-[>"', { expr = true})
keymap('s', '<C-[>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-[>"', { expr = true})

