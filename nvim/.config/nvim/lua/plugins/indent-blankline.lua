vim.cmd([[packadd indent-blankline.nvim]])

vim.g.indent_blankline_enabled = true
vim.g.indent_blankline_debug = false
vim.g.indent_blankline_use_treesitter = true

vim.g.indent_blankline_indent_level = 12
vim.g.indent_blankline_extra_indent_level = 0
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- g.indent_blankline_char = "│"
vim.g.indent_blankline_char_list = { "│" }
--g.indent_blankline_space_char = " "
--g.indent_blankline_space_char_blankline = " "

-- g.indent_blankline_space_char_highlight = "Comment"
-- g.indent_blankline_char_highlight = 'Whitespace'
-- g.indent_blankline_space_char_blankline_highlight = 'Whitespace'
-- g.indent_blankline_char_highlight_list = { "Comment", "Whitespace" }
-- g.indent_blankline_space_char_blankline_highlight_list = { "Comment", "Whitespace" }
vim.g.indent_blankline_char_highlight_list = { 
    "Whitespace", "Normal", "WarningMsg", 
    "Statement", "Operator", "String", "Type" 
}
vim.g.indent_blankline_space_char_blankline_highlight_list = { 
    "Whitespace", "Normal", "WarningMsg", 
    "Statement", "Operator", "String", "Type" 
}

-- vim.g.indent_blankline_filetype         = {'vim', 'lua', 'python', 'rust', 'go', 'html', 'css', 'javascript'}
vim.g.indent_blankline_filetype_exclude = { 
    "help",
    "startify", "packer", "NvimTree", "startuptime",
    "markdown", "text" 
}
vim.g.indent_blankline_buftype_exclude  = { "terminal" }
vim.g.indent_blankline_bufname_exclude  = { "README.md" }

-- Indent_Blankline
nmap{"<leader>ii", ":IndentBlanklineToggleAll<CR>", { silent = true}}
nmap{"<localleader>ii", ":IndentBlanklineToggle<CR>", { silent = true}}

