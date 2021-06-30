local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local dpi = require("beautiful").xresources.apply_dpi

local HOME = os.getenv("HOME")
local clickable_container = require("elemental.notif_center.subwidgets.clickable_container")
local PATH_TO_ICONS = HOME .. "/.config/awesome/elemental/notif_center/icons/"

-- Configuration
-- Notification background
beautiful.bg_modal = "#252525"
-- Notification actions bg color
beautiful.bg_actions = "#353535"
-- Notification panel background
beautiful.panel_bg = "#0a0a0a"
-- Rounded corner radius
beautiful.modal_radius = dpi(2)

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

local widget_button = clickable_container(wibox.container.margin(widget, dpi(4), dpi(4), dpi(4), dpi(4)))
widget_button:buttons(gears.table.join(awful.button({}, 1, nil, function()
    screen.primary.notif_panel:toggle()
end)))

-- return widget_button
