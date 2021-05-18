local wk = require("which-key")

wk.setup({
    plugins = {
        marks = true,
        registers = true,
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
        margin = { 1, 0, 1, 0 },
        padding = { 2, 2, 2, 2 },
    },
    layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 4,
    },
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    show_help = true,
    triggers = { "<leader>", "<localleader>", ";" },
})

wk.register({
    [","] = "Curstr Toggle",
    s = {
        name = "+Session",
        f = "Search Session",
        s = "Save Session",
        r = "Restore Session"
    },
    g = "Glow Markdown",
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
        name = "+Format",
        f = "Format",
        w = "Format and Write",
    },
    t = {
        name = "+Terminal",
        f = "File Manager",
        g = "Lazygit",
        h = "Htop",
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
}, {
    prefix = "<leader>",
})

wk.register({
    l = { "<Cmd>luafile %<CR>", "Source Lua File" },
    r = { "<Cmd>lua %<CR>", "Execute Current Lua File" },
    v = { "<Cmd>source %<CR>", "Source Vim File" },
    p = { "<Cmd>!python %<CR>", "Execute Current Python File" },
}, {
    prefix = "<localleader>",
})

wk.register({
    ["[c"] = "Previous Hunk",
    ["]c"] = "Next Hunk",
    [";l"] = "Blame Hunk",
    [";p"] = "Preview Hunk",
    [";r"] = "Reset Hunk",
    [";R"] = "Reset Buffer",
    [";s"] = "Stage Hunk",
    [";u"] = "Undo Stage Hunk",
})

wk.register({
    t = "Display Translation in Command Line",
    w = "Display Translation in Window",
    r = "Replace Text With Translation",
    x = "Translate text in Clipboard"
}, { prefix = "t"})
