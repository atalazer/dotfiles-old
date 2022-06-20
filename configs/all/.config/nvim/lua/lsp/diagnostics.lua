local M = {}

local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " ",
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
    underline = true,
    signs = true,
    severity_sort = true,
    update_in_insert = false,
    virtual_text = {
        prefix = "■ ",
        spacing = 4,
        source = "always",
    },
})

M.diagnostic = {
    line = function()
        vim.diagnostic.open_float(nil, {
            border = Util.borders,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            focusable = false,
            prefix = " ",
            show_header = false,
        })
    end,
    next = function()
        vim.diagnostic.goto_next({
            float = {
                show_header = false,
                border = Util.borders,
            },
        })
    end,
    prev = function()
        vim.diagnostic.goto_prev({
            float = {
                show_header = false,
                border = Util.borders,
            },
        })
    end,
    qflist = function()
        vim.diagnostic.setqflist({ open = true })
    end,
}

return M
