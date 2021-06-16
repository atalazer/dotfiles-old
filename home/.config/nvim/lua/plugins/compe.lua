local keymap = vim.api.nvim_set_keymap

-- don't load *all* modules
-- vim.g.loaded_compe_spell         = 1
vim.g.loaded_compe_tags          = 1
-- vim.g.loaded_compe_calc          = 1
-- vim.g.loaded_compe_emoji         = 1
vim.g.loaded_compe_omni          = 1
-- vim.g.loaded_compe_treesitter    = 1
vim.g.loaded_compe_vim_lsc       = 1
-- vim.g.loaded_compe_vsnip         = 1
vim.g.loaded_compe_ultisnips     = 1
vim.g.loaded_compe_snippets_nvim = 1
vim.g.loaded_compe_luasnip       = 1

require("compe").setup({
    enabled = true,
    allow_prefix_unmatch = false,
    preselect = "disable",
    min_lengt = 2,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 30,
    max_kind_width = 20,
    max_menu_width = 50,

    source = {
        buffer = true,
        calc = {
            enable = true,
            filetypes = { "text", "markdown" },
        },
        spell = {
            enable = true,
            filetypes = { "text", "markdown" },
        },
        emoji = {
            enable = true,
            filetypes = { "text", "markdown" },
        },
        path = true,
        vsnip = true,
        nvim_lua = true,
        nvim_lsp = {
            enable = true,
            priority = 10001,
        },
    },
})

keymap("i", "<CR>", "v:lua.Util.trigger_completion()", { expr = true, silent = true })
keymap(
    "i",
    "<Tab>",
    table.concat({
        'pumvisible() ? "<C-n>" : v:lua.Util.check_backspace()',
        '? "<Tab>" : compe#confirm()',
    }),
    { silent = true, noremap = true, expr = true }
)

keymap("i", "<S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>"', { noremap = true, expr = true })
keymap("i", "<C-Space>", "compe#complete()", { noremap = true, expr = true, silent = true })
