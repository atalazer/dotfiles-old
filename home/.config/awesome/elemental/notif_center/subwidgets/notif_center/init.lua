local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local HOME = os.getenv("HOME")

local dpi = require("beautiful").xresources.apply_dpi

local notif_header = wibox.widget({
    text = "Notification Center",
    font = "SFNS Display Bold 14",
    align = "left",
    valign = "center",
    widget = wibox.widget.textbox,
})

local separator = wibox.widget({
    orientation = "horizontal",
    opacity = 0.0,
    forced_height = 5,
    widget = wibox.widget.separator,
})

return wibox.widget({
    expand = "none",
    layout = wibox.layout.fixed.vertical,
    spacing = dpi(5),
    {
        expand = "none",
        layout = wibox.layout.align.horizontal,
        notif_header,
        nil,
        {
            layout = wibox.layout.fixed.horizontal,
            spacing = dpi(5),
            require("elemental.notif_center.subwidgets.notif_center.dont_disturb"),
            require("elemental.notif_center.subwidgets.notif_center.clear_all"),
        },
    },
    separator,
    require("elemental.notif_center.subwidgets.notif_center.generate_notifbox"),
})
