local M = {}

M.setup = function()
    local maps = {
        ["gf"] = { "openable", "{ action = 'open' }" },
        [".,"] = { "togglable" },
        ["<leader><leader>"] = { "togglable" },
    }

    for key, action in pairs(maps) do
        local exe = action[1] or ""
        local opt = action[2] or "{}"
        vim.api.nvim_set_keymap(
            "n",
            tostring(key),
            string.format("<CMD>lua require('curstr').execute('%s', %s)<CR>", exe, opt),
            { silent = true, noremap = true }
        )
    end
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
            names = {
                "camel_snake",
            },
        },
    }

    -- snake_case to camelCase or vice versa
    source.camel_snake = {
        names = { "togglable/pattern" },
        opts = { patterns = { { "\\v_(.)", "\\u\\1" }, { "\\v\\C([A-Z])", "_\\l\\1" } } },
        filetypes = { "lua", "bash", "python" },
    }

    -- Toggle word
    local tw_tbl = {}
    for i, word in ipairs(config.togglable) do
        local word = {
            names = { "togglable/word" },
            opts = { words = { word[1], word[2] }, normalized = true },
        }
        tw_tbl["word" .. i] = word
        table.insert(source.togglable.names, tostring("word" .. i))
    end
    source = vim.tbl_extend("force", source, tw_tbl)

    require("curstr").setup({
        source_aliases = source,
    })
end

-- M.setup()
-- M.config()
return M
