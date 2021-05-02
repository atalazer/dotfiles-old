vim.cmd([[packadd curstr.nvim]])

require("curstr").setup({
    source_aliases = {
        swagger = {
            names = { "file/search" },
            opts = {
                source_pattern = "\\v^([^#]*)#(\\/[^/]*)*(\\w+)$",
                result_pattern = "\\1",
                search_pattern = "\\3:",
            },
            filetypes = { "yaml" },
        },
        openable = {
            names = { "vim/function", "lua", "file", "directory", "swagger", "vim/runtime" }, 
        },

        camel_snake = {
            names = { "togglable/pattern" },
            opts = { patterns = { { "\\v_(.)", "\\u\\1" }, { "\\v\\C([A-Z])", "_\\l\\1" } } },
            filetypes = { "lua", "bash" },
        },
        booltf = {
            names = { "togglable/word" },
            opts = { words = { "true", "false" }, normalized = true },
        },
        boolnf = {
            names = { "togglable/word" },
            opts = { words = { "on", "off" }, normalized = true },
        },
        boolyn = {
            names = { "togglable/word" },
            opts = { words = { "yes", "no" }, normalized = true },
        },
        boolnum = {
            names = { "togglable/word" },
            opts = { words = { "1", "0" }, normalized = true },
        },
        booled = {
            names = { "togglable/word" },
            opts = { words = { "enable", "disable" }, normalized = true },
        },
        tptobt = {
            names = { "togglable/word" },
            opts = { words = { "top", "bottom" }, normalized = true },
        },
        lftorg = {
            names = { "togglable/word" },
            opts = { words = { "left", "right" }, normalized = true },
        },
        togglable = {
            names = {
                "booltf",
                "boolyn",
                "boolnf",
                "boolnum",
                "booled",
                "lftorg",
                "tptobt",
                "camel_snake",
            },
        },
    },
})

-- Keymap
local _Key = require("astronauta.keymap")
local nnoremap = _Key.nnoremap

-- # Mappings
nnoremap({
    "gf",
    '<Cmd>lua require("curstr").execute("openable", { action = "open" })<CR>', 
    { silent = true },
})
nnoremap({
    "<leader>,",
    '<Cmd>lua require("curstr").execute("togglable")<CR>', 
    { silent = true },
})
