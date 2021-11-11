vim.g.firenvim_config = {
    globalSettings = {},
    localSettings = {
        [".*"] = {
            priority = 0,
            takeover = "never",
        },
    },
}

-- vim.cmd([[
--     au TextChanged * ++nested lua Util.delay_write()
--     au TextChangedI * ++nested lua Util.delay_write()
-- ]])
