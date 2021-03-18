local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")

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
local icon = string.format('%s/temp/icon.svg', path)

local M = {}

-- Temperature
M.icon = wibox.widget.imagebox(colorize(icon, beautiful.widget_icon))

local get_temp_status = [[
    sh -c "
    sensors | awk '/^Core 0:/{gsub(/[^0-9]/, \" \"); print $2\"°C\"}'
    "
]]

M.widget = awful.widget.watch(get_temp_status, 5, function(widget, stdout)
        widget:set_markup(markup(stdout, {fg = beautiful.widget_text}))
    end)

return M
