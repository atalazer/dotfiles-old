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
local icon = string.format('%s/battery/icon.svg', path)

local M = {}

-- Brightness
M.icon = wibox.widget.imagebox(colorize(icon, beautiful.widget_icon))

local cmd = [[ sh -c "cat /sys/class/power_supply/BAT0/capacity" ]]

M.widget = awful.widget.watch(cmd, 5, function(widget, stdout)
        widget:set_markup(markup(math.floor(stdout) .. "%", {fg = beautiful.widget_text}))
    end)

return M
