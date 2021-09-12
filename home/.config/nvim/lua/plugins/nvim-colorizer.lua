local M = {}

M.setup = function()
    local map = function(lhs, rhs)
        vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true })
    end
    map("<leader>cc", "<CMD>ColorizerToggle<CR>")
end

M.config = function()
    require("colorizer").setup({
        "*", -- Highlight all files, but customize some others.
        css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
        html = { names = false }, -- Disable parsing "names" like Blue or Gray
    })
end

return M
