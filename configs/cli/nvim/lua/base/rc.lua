local M = {}

M.plugin_enabled = {
    -- ================== UI
    alpha = false,
    bufferline = true,
    focus = false,
    fzf = true,
    nvim_tree = true,
    shade = false,
    sidebar = false,
    telescope = false,
    twillight = false,
    which_key = true,
    windline = true,
    zenmode = false,
    -- ================== Editing
    cmp = true,
    coq = false,
    luasnip = true,
    sniprun = true,
    treesitter = true,
    -- ================== Git
    fugitive = true,
    gitlinker = true,
    gitsigns = true,
    lazygit = true,
    neogit = false,
    -- ================== Experience
    colorizer = false,
    hexokinase = true,
    hop = true,
    indent_blankline = true,
    lightspeed = false,
    neoscroll = true,
    -- ================== Misc
    presence = false,
}

return M
