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
local icon = string.format('%s/mpd/icon.svg', path)

local M = {}

M.icon = wibox.widget.imagebox(colorize(icon, beautiful.widget_icon))

local get_music = [[ sh -c " mpc --format='%artist% - %title%' current | cut -c 1-20" ]]

M.widget = awful.widget.watch(get_music, 2, function(widget, stdout)
    if stdout:find("volume") then
        stdout = "😱 playlist empty 😱"
    end
        widget:set_markup(markup(stdout, {fg = beautiful.widget_text}))
    end)

return M
