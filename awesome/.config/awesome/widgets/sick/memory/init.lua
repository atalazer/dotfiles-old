local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

local function colorize(icon, color)
    return gears.color.recolor_image(icon, color)
end

local function markup(content, opts)
    local fg = opts.fg or ""

    return string.format(
        '<span foreground="%s">%s</span>',
        fg, content
    )
end

local path = os.getenv("HOME")..'/.config/awesome/widgets/sick'
local icon = string.format('%s/memory/icon.svg', path)

local M = {}

-- local meminfo = function()
--     local file = '/proc/meminfo'
--     local lines = {}
--     for line in io.lines(file) do
--         line = string.gsub(line, "%s+", "")
--         local key, val = string.match(line, "([^:]+):([^:]+)")
--         lines[key] = val
--     end
--     return lines
-- end

-- Memory
M.icon = wibox.widget.imagebox(colorize(icon, beautiful.widget_icon))

local get_mem_status = [[
    sh -c "
    free -h | awk '/^Mem/ { print $3 }' | sed s/i//g
    "
]]

M.widget = awful.widget.watch(get_mem_status, 5, function(widget, stdout)
        widget:set_markup(markup(stdout, {fg = beautiful.widget_text}))
    end)

return M
