require("gitsigns").setup({
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    preview_config = { border = Util.borders },
    signs = {
        add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    },
    keymaps = {
        noremap = true,
        ["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
        ["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },

        ["n ;s"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ["v ;s"] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        ["n ;u"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ["n ;r"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ["v ;r"] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        ["n ;R"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
        ["n ;p"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ["n ;b"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
        ["n ;S"] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
        ["n ;U"] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

        ["o ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
        ["x ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
    },
})
