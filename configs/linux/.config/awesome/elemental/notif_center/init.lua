local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local dpi = require("beautiful").xresources.apply_dpi

local HOME = os.getenv("HOME")
local clickable_container = require("noodle.clickable_container")
local PATH_TO_ICONS = HOME .. "/.config/awesome/elemental/notif_center/icons/"

-- Load panel rules, it will create panel for each screen
require("elemental.notif_center.notif_panel_rules")

local widget = wibox.widget({
    {
        id = "icon",
        image = PATH_TO_ICONS .. "notification" .. ".svg",
        widget = wibox.widget.imagebox,
        resize = true,
    },
    layout = wibox.layout.align.horizontal,
})

notif_toggle = function()
    screen.primary.notif_panel:toggle()
end

local widget_button = clickable_container(wibox.container.margin(widget, dpi(4), dpi(4), dpi(4), dpi(4)))
widget_button:buttons(gears.table.join(awful.button({}, 1, nil, function()
    notif_toggle()
end)))

-- return widget_button
