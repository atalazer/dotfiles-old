local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local dpi = require("beautiful").xresources.apply_dpi
local clickable_container = require("noodle.clickable_container")
local config_dir = gears.filesystem.get_configuration_dir()
local widget_icon_dir = config_dir .. "noodle/tray_toggle/icons/"

local helpers = require("helpers")
local beautiful = require("beautiful")
local fg_color = beautiful.widget_fg or beautiful.fg_normal
local s = awful.screen.focused()

local widget = wibox.widget({
    {
        id = "icon",
        image = helpers.colorize_image(widget_icon_dir .. "right-arrow" .. ".svg", fg_color),
        widget = wibox.widget.imagebox,
        resize = true,
    },
    layout = wibox.layout.align.horizontal,
})

-- Update icon on start-up
if s.systray then
    if s.systray.visible and s.systray.visible == true then
        widget.icon:set_image(
            helpers.colorize_image(
                gears.surface.load_uncached(widget_icon_dir .. "left-arrow.svg"),
                fg_color
            )
        )
    end
end

local widget_button = wibox.widget({
    {
        widget,
        margins = beautiful.widget_margin * 2,
        widget = wibox.container.margin,
    },
    widget = clickable_container,
})

widget_button:buttons(gears.table.join(awful.button({}, 1, nil, function()
    awesome.emit_signal("systray:toggle")
end)))

-- Listen to signal
awesome.connect_signal("systray:toggle", function()
    if s.systray then
        if not s.systray.visible then
            widget.icon:set_image(
                helpers.colorize_image(
                    gears.surface.load_uncached(widget_icon_dir .. "left-arrow.svg"),
                    fg_color
                )
            )
        else
            widget.icon:set_image(
                helpers.colorize_image(
                    gears.surface.load_uncached(widget_icon_dir .. "right-arrow.svg"),
                    fg_color
                )
            )
        end

        s.systray.visible = not s.systray.visible
    end
end)

-- Show only the tray button in the primary screen
return awful.widget.only_on_screen(widget_button, "primary")
