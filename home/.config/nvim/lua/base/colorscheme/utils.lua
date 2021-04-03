local Utils = {}
-- helper for defining highlight groups
Utils.set_hl = function(group, options)
    local bg = options.bg == nil and "" or "guibg=" .. options.bg
    local fg = options.fg == nil and "" or "guifg=" .. options.fg
    local gui = options.gui == nil and "" or "gui=" .. options.gui
    local link = options.link or false
    local target = options.target

    if not link then
        vim.cmd(string.format("hi %s %s %s %s", group, bg, fg, gui))
    else
        vim.cmd(string.format("hi! link", group, target))
    end
end

return Utils
