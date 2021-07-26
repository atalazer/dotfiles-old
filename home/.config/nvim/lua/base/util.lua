local job_ok, Job = pcall(require, "plenary.job")
local fn = vim.fn

_G.Util = {}

Util.get_word = function()
    local first_line, last_line = fn.getpos("'<")[2], fn.getpos("'>")[2]
    local first_col, last_col = fn.getpos("'<")[3], fn.getpos("'>")[3]
    local current_word = fn.getline(first_line, last_line)[1]:sub(first_col, last_col)

    return current_word
end

-- translate selected word, useful for when I do jp assignments
Util.translate = function(lang)
    local word = Util.get_word()
    local job = Job:new({
        command = "trans",
        args = { "-b", ":" .. (lang or "en"), word },
    })

    local ok, result = pcall(function()
        return vim.trim(job:sync()[1])
    end)
    if ok then
        return print(result)
    end
    print("Failed to translate.")
end
vim.cmd([[command! -range -nargs=1 Translate call v:lua.Util.translate(<f-args>)]])

Util.is_cfg_present = function(cfg_name)
    -- this returns 1 if it's not present and 0 if it's present
    -- we need to compare it with 1 because both 0 and 1 is `true` in lua
    return fn.empty(fn.glob(vim.loop.cwd() .. cfg_name)) ~= 1
end

Util.t = function(cmd)
    return vim.api.nvim_replace_termcodes(cmd, true, true, true)
end

-- see lua/plugins/compe.lua for context
Util.trigger_completion = function()
    if fn.pumvisible() ~= 0 then
        if fn.complete_info()["selected"] ~= -1 then
            return fn["compe#confirm"]()
        end
    end

    return Util.t("<CR>")
end

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

Util.lsp_on_attach = function()
    print("LSP Attached!")
    require("lsp.keys").mappings()
end

Util.lsp_on_init = function()
    print("Language Server Protocol started!")
end

return Util
