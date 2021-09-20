vim.api.nvim_set_keymap("n", "<leader>ss", "<CMD>SidebarNvimToggle<CR>", { noremap = true })

require("sidebar-nvim").setup({
    disable_default_keybindings = 0,
    bindings = nil,
    open = false,
    initial_width = 35,
    update_interval = 1000,
    side = "left",
    section_separator = "─────",
    sections = {
        "datetime",
        -- "git-status",
        "diagnostics",
        -- "todos",
        -- "containers",
    },
})
