local M = {}
local remap = vim.api.nvim_set_keymap

M.setup = function()
    vim.g.coq_settings = {
        auto_start = true,
        keymap = { recommended = false },
        clients = {
            lsp = {
                enabled = true,
                resolve_timeout = 0.25,
            },
            paths = {
                enabled = true,
                resolution = { "cwd", "file" },
            },
            snippets = { enabled = true },
            buffers = { enabled = true },
            tags = { enabled = true },
            tmux = { enabled = true },
            tree_sitter = { enabled = false },
        },
        -- display = {
        --     icons = { mode = "long" },
        --     preview = { border = Util.borders },
        -- },
        -- limits = {
        --     index_cutoff = 333333,
        --     idle_timeout = 2.5,
        --     completion_auto_timeout = 0.3,
        --     completion_manual_timeout = 0.7,
        -- }
    }
    remap("i", "<ESC>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
    remap("i", "<C-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
    remap("i", "<Tab>", [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
    remap("i", "<S-Tab>", [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })
end

M.config = function()
    require("coq_3p")({
        { src = "nvimlua", short_name = "nLUA" },
        { src = "bc", short_name = "MATH", precision = 6 },
    })
end

return M
