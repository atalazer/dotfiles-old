vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_foldtext = true
vim.g.indent_blankline_show_end_of_line = false
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_indent_level = 10
vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_space_char_blankline = " "
vim.g.indent_blankline_context_highlight = "Label"
  vim.g.indent_blankline_context_patterns = {
    "class",
    "function",
    "method",
    "block",
    "list_literal",
    "selector",
    "^if",
    "^table",
    "if_statement",
    "while",
    "for"
  }

vim.g.indent_blankline_buftype_exclude = {
    "terminal",
    "prompt",
    "nofile",
}

vim.g.indent_blankline_filetype_exclude = {
    "help",
    "markdown",
    "text",
    "Nvimtree",
    "Outline",
    "Trouble",
    "packer",
    "dashboard",
}
vim.cmd("autocmd CursorMoved * IndentBlanklineRefresh")
