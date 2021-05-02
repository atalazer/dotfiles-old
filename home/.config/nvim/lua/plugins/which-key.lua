local wk = require("which-key")

wk.setup({
    plugins = {
        marks = true,
        registers = true,
        presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = false,
            nav = false,
            z = false,
            g = false,
        },
    },
    operators = { gc = "Comments" },
    icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
    },
    window = {
        border = "single",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 2, 2, 2, 2 },
    },
    layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
    },
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    show_help = true,
    triggers = { "<leader>", "<localleader>", ";" },
})

wk.register({
    ["<localleader>l"] = { "<Cmd>luafile %<CR>", "Source Lua File" },
    ["<localleader>r"] = { "<Cmd>lua %<CR>", "Execute Current Lua File" },
    ["<localleader>v"] = { "<Cmd>source %<CR>", "Source Vim File" },
    ["<localleader>p"] = { "<Cmd>!python %<CR>", "Execute Current Python File" },
})

