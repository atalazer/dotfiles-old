local fn = vim.fn

_G.Util = {}

Util.borders = {
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
}

Util.check_backspace = function()
    local curr_col = fn.col(".")
    local is_first_col = fn.col(".") - 1 == 0
    local prev_char = fn.getline("."):sub(curr_col - 1, curr_col - 1)

    if is_first_col or prev_char:match("%s") then
        return true
    else
        return false
    end
end

Util.check_surroundings = function()
    local col = fn.col(".")
    local line = fn.getline(".")
    local prev_char = line:sub(col - 1, col - 1)
    local next_char = line:sub(col, col)
    local pattern = "[%{|%}|%[|%]]"

    if prev_char:match(pattern) and next_char:match(pattern) then
        return true
    else
        return false
    end
end

Util.t = function(cmd)
    return vim.api.nvim_replace_termcodes(cmd, true, true, true)
end

-- see lua/plugins/compe.lua for context
Util.trigger_completion = function()
    if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            return vim.fn["compe#confirm"]()
        end
    end

    local prev_col, next_col = vim.fn.col(".") - 1, vim.fn.col(".")

    return Util.t("<CR>")
end

Util.lsp_on_attach = function()
    print("LSP Attached!")
    require("lsp.keys").mappings()

    require("lsp_signature").on_attach {
        bind = true,
        doc_lines = 2,
        hint_enable = false,
        handler_opts = {
            border = Util.borders
        }
    }
end

Util.lsp_on_init = function()
    print("Language Server Protocol started!")

    if client.config.flags then
        client.config.flags.allow_incremental_sync = true
    end
end

return Util
