-- don't load *all* modules
vim.g.loaded_compe_snippets_nvim = 1
-- vim.g.loaded_compe_spell      = 1
vim.g.loaded_compe_tags          = 1
vim.g.loaded_compe_treesitter    = 1
vim.g.loaded_compe_emoji         = 1
vim.g.loaded_compe_omni          = 1
-- vim.g.loaded_compe_vsnip      = 1
vim.g.loaded_compe_ultisnips     = 1
vim.g.loaded_compe_vim_lsc       = 1
vim.g.loaded_compe_luasnip       = 1
-- vim.g.loaded_compe_calc       = 1

require("compe").setup({
    enabled = true,
    autocomplete = true,
    allow_prefix_unmatch = false,
    documentation = true,
    preselect = "disable",
    min_length = 1,
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 30,
    max_kind_width = 20,
    max_menu_width = 50,

    source = {
        buffer = true,
        calc = true,
        path = true,
        spell = {
            enable = true,
            filetypes = { "text", "markdown" }
        },
        vsnip = true,
        nvim_lua = true,
        nvim_lsp = {
            enable = true,
            priority = 10001
        },
    },
})

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t("<C-n>")
    elseif vim.fn.call("vsnip#available", { 1 }) == 1 then
        return t("<Plug>(vsnip-expand-or-jump)")
    elseif check_back_space() then
        return t("<Tab>")
    else
        return vim.fn["compe#complete"]()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t("<C-p>")
    elseif vim.fn.call("vsnip#jumpable", { -1 }) == 1 then
        return t("<Plug>(vsnip-jump-prev)")
    else
        return t("<S-Tab>")
    end
end

local keymap = vim.api.nvim_set_keymap

keymap("i", "<C-space>", "compe#complete()", { expr = true, noremap = true, silent = true })
keymap("i", "<CR>", "compe#confirm('<CR>')", { expr = true, noremap = true, silent = true })
keymap("i", "<C-c>", "compe#close('C-c')", { expr = true, noremap = true, silent = true })
keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", { expr = true, noremap = true, silent = true })
keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", { expr = true, noremap = true, silent = true })

keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
