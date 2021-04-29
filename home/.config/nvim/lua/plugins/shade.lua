vim.cmd("packadd shade.nvim")

require("shade").setup({
    overlay_opacity = 60,
    opacity_step = 2,
    keys = {
        brightness_up   = "bb",
        brightness_down = "B",
        toggle          = "<Leader>s",
    },
})
