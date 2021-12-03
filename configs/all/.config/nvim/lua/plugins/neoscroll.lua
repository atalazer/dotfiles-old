require("neoscroll").setup({
    hide_cursor = true,
    stop_eof = true,
    use_local_scrolloff = true,
    respect_scrolloff = false,
    cursor_scrolls_alone = true,
    easing_function = "quadratic",
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "350" } }
t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "350" } }
t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "500" } }
t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "500" } }
t["<PageUp>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "500" } }
t["<PageDown>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "500" } }
t["<C-y>"] = { "scroll", { "-0.10", "false", "100" } }
t["<C-e>"] = { "scroll", { "0.10", "false", "100" } }
t["zt"] = { "zt", { "300" } }
t["zz"] = { "zz", { "300" } }
t["zb"] = { "zb", { "300" } }

require("neoscroll.config").set_mappings(t)
