-- originally was taken from https://github.com/cooper-anderson/dotfiles
-- with some modifications and refactoring that I did

vim.cmd([[packadd nvim-bufferline.lua]])
vim.cmd [[packadd nvim-web-devicons]]

require("bufferline").setup({
    tab_size = 15,
    max_name_length = 12,
    max_prefix_length = 3,
    mappings = true,
    show_buffer_close_icons = true,
    buffer_close_icon = "",
    separator_style = { "|", "|" },
    diagnostics = "nvim_lsp",
})

-- Keymap
local _Key = require("astronauta.keymap")
local nnoremap = _Key.nnoremap

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
