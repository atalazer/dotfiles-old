require("sniprun").setup({
    borders = Util.borders,
    display = {
        -- "Classic",
        "Terminal",
        "VirtualTextOk",
    },
})

-- Mappings
nnoremap("<Leader>sr", "<Plug>SnipRun", "silent")
nnoremap("<Leader>sc", "<Plug>SnipClose", "silent")
xnoremap("sr", "<Plug>SnipRun", "silent")
xnoremap("sc", "<Plug>SnipClose", "silent")
