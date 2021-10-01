local M = {}

M.plugin_enabled = {
    -- ================== UI
    alpha = false,
    bufferline = true,
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
    fugitive = false,
    gitsigns = true,
    lazygit = true,
    neogit = true,
    -- ================== Experience
    colorizer = false,
    focus = true,
    hexokinase = true,
    indent_blankline = true,
    neoscroll = true,
    shade = false,
    -- ================== Misc
    persistence = true,
    presence = false,
}

return M
