vim.cmd("packadd indent-blankline.nvim")

vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_space_char_blankline = " "
vim.g.indent_blankline_show_end_of_line = false
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_highlight = "Label"
vim.g.indent_blankline_context_patterns = {
    "class",
    "function",
    "method",
    "^if",
    "while",
    "for",
    "with",
    "func_literal",
    "block",
    "try",
    "except",
    "argument_list",
    "object",
    "dictionary",
}

vim.g.indent_blankline_buftype_exclude = {
    "terminal",
    "prompt",
}

vim.g.indent_blankline_filetype_exclude = {
    "help",
    "Nvimtree",
    "Outline",
    "Trouble",
    "packer",
    "markdown",
    "text",
}
