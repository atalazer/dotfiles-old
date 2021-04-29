vim.cmd("packadd auto-session")
vim.cmd("packadd session-lens")

require("auto-session").setup({
    auto_session_root_dir = os.getenv("HOME") .. ".config/nvim/sessions/",
    auto_session_enable_last_session = false,
    logLevel = "info",
    pre_save_cmds = {},
    post_save_cmds = {},
    pre_restore_cmds = {},
    post_restore_cmds = {},
})

pcall(require("telescope").load_extension, "session-lens")

require("telescope._extensions.session-lens").setup({
    prompt_title = "Sessions List",
    shorten_path = false,
})

nnoremap({ "<leader>sf", "<Cmd>SearchSession<CR>" })
nnoremap({ "<leader>ss", "<Cmd>SaveSession<CR>" })
nnoremap({ "<leader>sr", "<Cmd>RestoreSession<CR>" })
