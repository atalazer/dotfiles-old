local wk = require("which-key")

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

    -- User Custom
    csu = "Lowercase First Letter",
    csU = "Uppercase First Letter",
})

-- Leader Key
wk.register({
    [","] = "Curstr Toggle",
    g = {
        name = "+Misc",
        g = "Glow",
        f = "Format",
        t = "Lazygit",
    },
    c = {
        name = "+Colorizer",
        c = "Colorizer Toggle",
        -- a = "Attach Buffer",
        -- d = "Detach Buffer",
        -- r = "Reload All Buffer",
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
        c = "Colorscheme",
    },
    l = {
        name = "+LSP",
        ["["] = "Prev Diagnostic",
        ["]"] = "Next Diagnostic",
        a = "Code Action",
        c = "Code Lens",
        d = "Definition",
        l = "Line Diagnostic",
        f = "Finder",
        r = "LSP Reference",
        R = "Rename",
        t = "LSP Trouble",
    },
}, {
    prefix = "<leader>",
})

-- Local Leader Key
wk.register({
    s = {
        name = "+Source",
        s = "Current",
        l = "Lua File",
        v = "Vim File",
    },
    r = {
        name = "+Run",
        l = "Lua File",
        p = "Python File",
    },
}, {
    prefix = "<localleader>",
})

wk.setup({
    plugins = {
        marks = true,
        registers = true,
        spelling = { enabled = true },
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
        border = Util.borders,
        position = "bottom",
        margin = { 1, 3, 1, 3 },
        padding = { 2, 2, 2, 2 },
    },
    layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 8,
    },
    key_labels = {
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
        ["<leader>"] = ".",
        ["<localleader>"] = ",",
    },
    ignore_missing = false,
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CMD>", "lua", "<CR>", "call", "lua", "^:", "^ " },
    show_help = true,
    triggers = "auto",
})
