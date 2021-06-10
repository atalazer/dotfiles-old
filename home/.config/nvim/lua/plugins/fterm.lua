require("FTerm").setup({
    cmd = "bash",
    dimensions = {
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5,
    },
    border = Util.borders,
})

local makeTerminal = function(keybind, name, command, wd, hg)
    _G[tostring(name)] = function()
        require("FTerm.terminal")
            :new()
            :setup({
                cmd = command,
                dimensions = {
                    width = wd or 0.8,
                    height = hg or 0.8,
                },
                border = Util.borders,
            })
            :toggle()
    end
    vim.api.nvim_set_keymap(
        tostring("n"),
        tostring(keybind),
        ":lua " .. tostring(name) .. "()<CR>",
        { silent = true, noremap = true }
    )
end

makeTerminal("<leader>tg", "Toggle_lazygit", "lazygit", 0.9, 0.9)
makeTerminal("<leader>tf", "Toggle_nnn", "nnn")
makeTerminal("<leader>tm", "Toggle_glow", "glow")

-- Keybinding
vim.api.nvim_set_keymap("n", "<C-\\>", '<CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap(
    "t",
    "<C-\\>",
    '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>',
    { noremap = true, silent = true }
)
