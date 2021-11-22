local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local dont_disturb = require("elemental.notif_center.dont_disturb")
local clear_all = require("elemental.notif_center.clear_all")
local generate_notifbox = require("elemental.notif_center.generate_notifbox")

local notif_header = wibox.widget({
    text = "Notification Center",
    font = beautiful.font_bold_name .. "14",
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
            dont_disturb,
            clear_all,
        },
    },
    separator,
    generate_notifbox,
})
