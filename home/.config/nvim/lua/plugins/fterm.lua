require("FTerm").setup({
    dimensions = {
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5,
    },
    border = "single",
})

_G.ToggleLazygit = function()
    require("FTerm.terminal")
        :new()
        :setup({
            cmd = "lazygit",
            dimensions = {
                height = 0.9,
                width = 0.9,
            },
        })
        :toggle()
end

_G.ToggleNNN = function()
    require("FTerm.terminal")
        :new()
        :setup({
            cmd = "nnn",
            dimensions = {
                height = 0.9,
                width = 0.9,
            },
        })
        :toggle()
end

-- Keybinding
nnoremap({ 
    "<leader>t",
    "<CMD>lua require(\"FTerm\").toggle()<CR>",
    { silent = true }
})
tnoremap({
    "<leader>t",
    "<C-\\><C-n><CMD>lua require(\"FTerm\").toggle()<CR>",
    { silent = true },
})

nnoremap({ "<leader>tg", ":lua ToggleLazygit()<CR>", { silent = true } })
nnoremap({ "<leader>tf", ":lua ToggleNNN()<CR>", { silent = true } })
