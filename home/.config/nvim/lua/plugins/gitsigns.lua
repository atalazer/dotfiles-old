vim.cmd [[packadd gitsigns.nvim]]

require('gitsigns').setup {
    signs = {
        add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    numhl = false,
    linehl = false,
    keymaps = {
        noremap = true,
        buffer = true,

        ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
        ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

        ['n <leader>ks'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ['n <leader>ku'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ['n <leader>kr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ['n <leader>kR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
        ['n <leader>kp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ['n <leader>kl'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

        ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
        ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>'
    },
    sign_priority = 6,
}
