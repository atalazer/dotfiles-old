local wk = require("which-key")

wk.register({
    [","] = "Curstr Toggle",
    g = {
        name = "+Misc",
        g = "Glow",
        f = "Format"
    },
    c = {
        name = "+Colorizer",
        c = "Toggle",
        a = "Attach Buffer",
        d = "Detach Buffer",
        r = "Reload All Buffer",
    },
    e = {
        name = "+Config",
        c = "Open Config File",
        r = "Reload Config",
    },
    f = {
        name = "+Telescope",
        f = "Frecency",
        m = "Media Files",
        b = "Files Browser",
        l = "Live Grep",
        k = "Keybindings",
        c = "Colorscheme"
    },
    t = {
        name = "+Terminal",
        f = "File Manager",
        g = "Lazygit",
    },
    l = {
        name = "+LSP",
        ["["] = "Prev Diagnostic",
        ["]"] = "Next Diagnostic",
        a = "Code Action",
        d = "Prefiew Definition",
        D = "Definition",
        l = "Line Diagnostic",
        f = "Finder",
        F = "LSP Reference",
        ff = "Formatting",
        k = "Hover Documentation",
        r = "Rename",
        T = "Toggle LSP Trouble",
        S = "Toggle Symbols Outline",
    },
}, {prefix = "<leader>"})

wk.register({
    l = { "<Cmd>luafile %<CR>", "Source Lua File" },
    r = { "<Cmd>lua %<CR>", "Execute Current Lua File" },
    v = { "<Cmd>source %<CR>", "Source Vim File" },
    p = { "<Cmd>!python %<CR>", "Execute Current Python File" },
}, {prefix = "<localleader>"})

wk.register({
    -- Gistsign.nvim
    ["[c"] = "Previous Hunk",
    ["]c"] = "Next Hunk",
    [";l"] = "Blame Hunk",
    [";p"] = "Preview Hunk",
    [";r"] = "Reset Hunk",
    [";R"] = "Reset Buffer",
    [";s"] = "Stage Hunk",
    [";u"] = "Undo Stage Hunk",

    -- vim-sandwich
    sa = "Add Surrounding Character",
    sd = "Remove Surrounding Character",
    sr = "Replace Surrounding Character",
})

wk.setup({
    plugins = {
        marks = true,
        registers = true,
        spelling = { enabled = false },
        presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            z = true,
            g = true,
        },
    },
    operators = { gc = "Comments" },
    icons = {
        breadcrumb = "»",
        separator = "➜",
        group = " +- ",
    },
    window = {
        border = Util.border,
        position = "bottom",
        margin = { 2, 2, 2, 1 },
        padding = { 2, 2, 2, 2 },
    },
    layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 8,
    },
    ignore_missing = false,
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CMD>", "lua", "<CR>", "call", "lua", "^:", "^ " },
    show_help = true,
    triggers = "auto",
})

