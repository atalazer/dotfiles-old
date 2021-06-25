local job_ok, Job = pcall(require, "plenary.job")
local fn = vim.fn

_G.Util = {}

local to_rgb = function(hex)
    local red, green, blue, alpha

    if #hex == 9 then
        _, red, green, blue, alpha = hex:match("(.)(..)(..)(..)(..)")
        return string.format(
            "rgba(%s, %s, %s, %s)",
            tonumber("0x" .. red),
            tonumber("0x" .. green),
            tonumber("0x" .. blue),
            tonumber("0x" .. alpha)
        )
    end

    _, red, green, blue = hex:match("(.)(..)(..)(..)")
    return string.format("rgb(%s, %s, %s)", tonumber("0x" .. red), tonumber("0x" .. green), tonumber("0x" .. blue))
end

local to_hex = function(rgb)
    local red, green, blue, alpha
    if #rgb >= 16 then
        red, green, blue, alpha = rgb:match("%((%d+),%s(%d+),%s(%d+),%s(%d+)")
        return string.format("#%x%x%x%x", red, green, blue, alpha)
    end

    red, green, blue = rgb:match("%((%d+),%s(%d+),%s(%d+)")
    return string.format("#%x%x%x", red, green, blue)
end

Util.get_word = function()
    local first_line, last_line = fn.getpos("'<")[2], fn.getpos("'>")[2]
    local first_col, last_col = fn.getpos("'<")[3], fn.getpos("'>")[3]
    local current_word = fn.getline(first_line, last_line)[1]:sub(first_col, last_col)

    return current_word
end

-- convert colours
Util.convert_colour = function(mode)
    local result

    if mode == "rgb" then
        result = to_rgb(Util.get_word())
    elseif mode == "hex" then
        result = to_hex(Util.get_word())
    else
        return print("Not Supported!")
    end

    vim.cmd(string.format("s/%s/%s", Util.get_word(), result))
end

vim.cmd([[
  command! -nargs=? -range=% ToRgb call v:lua.Util.convert_color('rgb')
  command! -nargs=? -range=% ToHex call v:lua.Util.convert_color('hex')
]])

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
