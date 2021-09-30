local sidebar = require("sidebar-nvim")
sidebar.setup({
    disable_default_keybindings = 0,
    bindings = {
        q = sidebar.close,
    },
    open = false,
    initial_width = 35,
    update_interval = 1000,
    side = "left",
    section_separator = "─────".."─────".."─────".."─────",
    sections = {
        "datetime",
        "git-status",
        "lsp-diagnostics",
        -- "todos",
        -- "containers",
    },
    datetime = {
        format = "%a %b %d, %H:%M",
        clocks = {
            { name = "local" },
        },
    },
})

vim.api.nvim_set_keymap("n", "~", "<CMD>SidebarNvimToggle<CR>", { noremap = true })
