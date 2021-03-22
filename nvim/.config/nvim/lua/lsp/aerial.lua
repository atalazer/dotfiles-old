vim.cmd[[packadd aerial.nvim]]

local aerial = require("aerial")
local M = {}

M.attach = function(client)
    aerial.on_attach(client)
end

local mapper = function(mode, key, result)
    vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

M.mappings = function()
    -- Toggle the aerial pane with <leader>a
    mapper('n', '<leader>`', '<cmd>lua require"aerial".toggle()<CR>')

    -- Jump forwards/backwards with '[[' and ']]'
    mapper('n', '[[', '<cmd>lua require"aerial".prev_item()<CR>zvzz')
    mapper('v', '[[', '<cmd>lua require"aerial".prev_item()<CR>zvzz')
    mapper('n', ']]', '<cmd>lua require"aerial".next_item()<CR>zvzz')
    mapper('v', ']]', '<cmd>lua require"aerial".next_item()<CR>zvzz')
end

return M
