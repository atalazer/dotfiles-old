require("zen-mode").setup({
    window = {
        backdrop = 0.975, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        width = 100, -- width of the Zen window
        height = 35, -- height of the Zen window
    },
    plugins = {
        options = {
            enabled = true,
            ruler = false,
            showcmd = false,
        },
        gitsigns = { enabled = false }, -- disables git signs
    },
    on_open = function(win)
        vim.api.nvim_win_set_option(win, "wrap", true)
        vim.api.nvim_win_set_option(win, "scrolloff", 99)
        vim.api.nvim_win_set_option(win, "sidescrolloff", 99)
        vim.cmd("TwilightEnable")
        vim.cmd("IndentBlanklineDisable")
    end,
    on_close = function(win)
        vim.api.nvim_win_set_option(win, "wrap", false)
        vim.api.nvim_win_set_option(win, "scrolloff", vim.o.scrolloff or 2)
        vim.api.nvim_win_set_option(win, "sidescrolloff", vim.o.sidescrolloff or 15)
        vim.cmd("TwilightEnable")
        vim.cmd("IndentBlanklineDisable")
        vim.cmd("TwilightDisable")
        vim.cmd("IndentBlanklineEnable")
    end,
})
