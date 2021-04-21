vim.cmd("packadd neoscroll.nvim")

require("neoscroll").setup({
    mappings = {},
    hide_cursor = true,
    stop_eof = true,
    respect_scrolloff = false,
    cursor_scrolls_alone = true,
})

local config = require("neoscroll.config")
local t = config.key_to_function

t["<S-k>"] = { "scroll", { -5, true, 8 } }
t["<S-Up>"] = { "scroll", { -5, true, 8 } }
t["<PageUp>"] = { "scroll", { -5, true, 8 } }

t["<S-j>"] = { "scroll", { 5, true, 8 } }
t["S-Down"] = { "scroll", { 5, true, 8 } }
t["PageDown"] = { "scroll", { 5, true, 8 } }

t["<C-b>"] = { "scroll", { -5, true, 7 } }
t["<C-f>"] = { "scroll", { 5, true, 7 } }

t["<C-y>"] = { "scroll", { -0.10, false, 20 } }
t["<C-e>"] = { "scroll", { 0.10, false, 20 } }

t["zt"] = { "zt", { 8 } }
t["zz"] = { "zz", { 8 } }
t["zb"] = { "zb", { 8 } }

config.set_mappings()

vim.cmd("NeoscrollEnablePM")
