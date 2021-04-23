vim.cmd("packadd specs.nvim")

local specs = require("specs")

specs.setup({
    show_jumps = true,
    min_jump = 20,
    popup = {
        delay_ms = 0,
        inc_ms = 20,
        blend = 30,
        width = 15,
        winhl = "PMenu",
        fader = specs.linear_fader,
        resizer = specs.shrink_resizer,
    },
    ignore_filetypes = {},
    ignore_buftypes = {
        nofile = true,
    },
})
