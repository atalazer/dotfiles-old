local M = {}

M.plugin_enabled = {
    -- ================== UI
    alpha = true,
    bufferline = true,
    focus = true,
    nvim_tree = true,
    sidebar = false,
    which_key = true,
    windline = true,
    -- ================== Editing
    cmp = true,
    coq = false,
    luasnip = true,
    sniprun = true,
    treesitter = true,
    -- ================== Git
    fugitive = true,
    gitsigns = true,
    neogit = false,
    -- ================== Experience
    colorizer = false,
    hexokinase = true,
    indent_blankline = true,
    neoscroll = true,
    shade = false,
    -- ================== Misc
    persistence = true,
    presence = false,
}

return M
