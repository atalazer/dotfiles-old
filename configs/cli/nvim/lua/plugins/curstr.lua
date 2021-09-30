local M = {}
local dev = true

M.setup = function()
    local opts = { silent = true }
    nnoremap(
        "gf",
        "<CMD>lua require('curstr').execute('openable', {action = 'open'})<CR>",
        opts,
        "Go To File Under Cursor"
    )
    nnoremap(
        "<Leader><Leader>",
        "<CMD>lua require('curstr').execute('togglable')<CR>",
        opts,
        "Toggle Word Under Cursor"
    )
end

M.config = function()
    local config = {
        togglable = {
            { "1", "0" },
            { "true", "false" },
            { "enable", "disable" },
            { "yes", "no" },
            { "on", "off" },
            { "or", "and" },
            { "open", "close" },
            { "top", "bottom" },
            { "right", "left" },
            { "he", "she" },
            { "always", "never" },
            { "foreground", "background" },
            { "fg", "bg" },
            { "white", "black" },
            { "light", "dark" },
            { "next", "previous" },
        },
    }

    local source = {
        openable = {
            names = {
                "vim/function",
                "vim/runtime",
                "directory",
                "file",
                "lua",
            },
        },
        togglable = {
            names = {},
        },
    }

    -- Toggle word
    local togglable_words = {}
    for i, word in ipairs(config.togglable) do
        local word = {
            names = { "togglable/word" },
            opts = { words = { word[1], word[2] }, normalized = true },
        }
        togglable_words["word" .. i] = word
        table.insert(source.togglable.names, tostring("word" .. i))
    end
    source = vim.tbl_extend("force", source, togglable_words)

    require("curstr").setup({
        source_aliases = source,
        sources = {
            ["vim/autoload_function"] = {
                opts = { include_packpath = true },
                filetypes = { "vim", "python", "lua" },
            },
        },
    })
end

if dev == true then
    M.setup()
    M.config()
end
return M
