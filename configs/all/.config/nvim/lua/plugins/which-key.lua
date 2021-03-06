local wk = require("which-key")

wk.register({
    -- Gistsign.nvim
    ["[c"] = "Previous Hunk",
    ["]c"] = "Next Hunk",
    [";b"] = "Blame Hunk",
    [";p"] = "Preview Hunk",
    [";r"] = "Reset Hunk",
    [";R"] = "Reset Buffer",
    [";s"] = "Stage Hunk",
    [";u"] = "Undo Stage Hunk",

    -- Misc
    gc = "Comment",
    ga = "Align",

    -- User Custom
    -- csu = "Lowercase First Letter",
    -- csU = "Uppercase First Letter",
    ["[e"] = "Move Line to Previous",
    ["]e"] = "Move Line to Next",
})

-- Leader Key
wk.register({
    c = {
        name = "Color",
        c = "Colorizer Toggle",
    },
    q = "Quit",
    x = "Hop Pattern",
    z = "Hop Word",
    g = {
        name = "Git",
        g = "Git",
        t = "Lazygit",
    },
    e = {
        name = "Config",
        c = "Open Config File",
        r = "Reload Config",
        m = "Edit Macro"
    },
    f = {
        name = "Files",
        b = "Files Browser",
        c = "Colorscheme",
        d = "(Book)Marks",
        f = "Frecency",
        k = "Keybindings",
        l = "Live Grep",
        m = "Media Files",
        o = "Oldfiles",
        t = "Builtins",
    },
    n = {
        name = "Notes",
        i = "Go To Index",
        n = "Search Notes",
    },
    p = {
        name = "Preview",
        m = "Glow Markdown"
    },
}, {
    prefix = "<leader>",
})

-- Local Leader Key
wk.register({
    l = "Source Current .vim or .lua File",
    s = {
        name = "Source",
        s = "Current",
        l = "Lua File",
        v = "Vim File",
    },
    r = {
        name = "Run",
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
            operators = false,
            motions = false,
            text_objects = false,
            windows = true,
            z = true,
            g = true,
        },
    },
    operators = { gc = "Comments" },
    key_labels = {
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
        ["<leader>"] = ".",
        ["<localleader>"] = ",",
    },
    icons = {
        breadcrumb = "???",
        separator = "???",
        group = "?? ",
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
    ignore_missing = false,
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CMD>", "lua", "<CR>", "call", "lua", "^:", "^ " },
    show_help = true,
    triggers = "auto",
    triggers_blacklist = {
        i = { "," },
    },
})
