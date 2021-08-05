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

    -- documentation = {
    --     border = Util.borders,
    --     winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    --     max_width = 120,
    --     min_width = 60,
    --     max_height = math.floor(vim.o.lines * 0.3),
    --     min_height = 1,
    -- },

    source = {
        buffer = true,
        spell = {
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

local map = function(lhs, rhs)
    vim.api.nvim_set_keymap("i", lhs, rhs, { silent = true, noremap = true, expr = true })
end

map("<Tab>", 'pumvisible() ? "<C-n>" : "<Tab>"')
map("<S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>"')
map("<CR>", "v:lua.Util.trigger_completion()")
map("<C-Space>", "compe#complete()")
map("<C-e>", "compe#close('<C-e>')")
map("<C-f>", "compe#scroll({ 'delta': +4 })")
map("<C-d>", "compe#scroll({ 'delta': -4 })")
