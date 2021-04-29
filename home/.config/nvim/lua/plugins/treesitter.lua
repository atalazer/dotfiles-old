-- ========================================================
vim.cmd("packadd nvim-treesitter")
vim.cmd("packadd nvim-ts-context-commentstring")

require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "javascript", "typescript",
        "html", "css", "scss",
        "bash", "python", "lua",
        "toml", "yaml", "json",
        "comment", "regex"
    },
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        config = {
            css  = "// %s",
            lua  = "-- %s",
            sh   = "# %s",
            bash = "# %s",
            zsh  = "# %s",
        }
    },
})

-- ========================================================
local nvim_autotag_enabled = RC.plug_enabled.autotag or false
if nvim_autotag_enabled == true then
    vim.cmd("packadd nvim-ts-autotag")
    require("nvim-ts-autotag").setup({
        filetypes = { "html", "xml" },
    })
end
-- ========================================================
local nvim_biscuits_enabled = RC.plug_enabled.biscuits or false
if nvim_biscuits_enabled == true then
    vim.cmd("packadd nvim-biscuits")
    require("nvim-biscuits").setup({
        default_config = {
            max_length = 40,
            min_destance = 5,
            prefix_string = " // ",
            on_events = { "BufWritePost" },
        },
    })

    vim.cmd([[
    hi! link BiscuitColor Comment
    hi! BiscuitColorRust ctermfg=red
    hi! BiscuitColorlua ctermfg=blue
    ]])
end
