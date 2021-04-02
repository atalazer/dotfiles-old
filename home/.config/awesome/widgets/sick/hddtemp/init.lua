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
local icon = string.format('%s/hddtemp/icon.svg', path)

-- Storage temperature
local M = {}

local temp = {
    sda = [[ sh -c "hddtemp /dev/sda | cut -d : -f 3" ]],
    sdb = [[ sh -c "hddtemp /dev/sdb | cut -d : -f 3" ]]
}

M.icon = wibox.widget.imagebox(colorize(icon, beautiful.widget_icon))
M.widget = {
    sda = awful.widget.watch(temp.sda, 5, function(widget, stdout)
            widget:set_markup(markup(stdout, {fg = beautiful.widget_text}))
        end
    ),
    sdb = awful.widget.watch(temp.sda, 5, function(widget, stdout)
            widget:set_markup(markup(stdout, {fg = beautiful.widget_text}))
        end
    )
}

return M
