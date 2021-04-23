vim.cmd("packadd lsp-trouble.nvim")

require("trouble").setup({
    height = 10,
    icons = true,
    mode = "workspace",
    fold_open = "",
    fold_closed = "",
    action_keys = {
        close = "q",
        refresh = "r",
        jump = "<cr>",
        toggle_mode = "m",
        toggle_preview = "P",
        preview = "p",
        close_folds = "zM",
        cancel = "<esc>",
        open_folds = "zR",
        previous = "k",
        next = "j"
    },
    indent_lines = true,
    auto_open = false,
    auto_close = false,
    auto_preview = true,
    signs = {
        error = "",
        warning = "",
        hint = "",
        information = ""
    },
    use_lsp_diagnostic_signs = false
})
