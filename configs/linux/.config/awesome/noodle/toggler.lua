local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local helpers = require("helpers")
local clickable_container = require("noodle.clickable_container")

local toggler_cmd = {
    notif_center = function() if notif_toggle then notif_toggle() end end,
    sidebar = function() if sidebar_toggle then sidebar_toggle() end end,
}

local notif_toggler = wibox.widget({
    font = "icomoon bold 10",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox,
})
notif_toggler.markup = helpers.colorize_text("", beautiful.wibar_fg or x.color3)

local notif_toggler_button = wibox.widget({
        {
            notif_toggler,
            margins = beautiful.widget_margin or dpi(3),
            widget = wibox.container.margin,
        },
    widget = clickable_container
})
notif_toggler_button:buttons(gears.table.join(
        awful.button({}, 1, toggler_cmd.notif_center),
        awful.button({}, 3, toggler_cmd.sidebar)
    )
)

return notif_toggler_button
