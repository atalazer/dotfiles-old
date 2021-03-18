-- Default notification library
local naughty = require("naughty")
local ruled = require("ruled")
local awful = require("awful")

local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

ruled.notification.connect_signal('request::rules', function()
    -- All notifications will match this rule.
    ruled.notification.append_rule {
        rule = {},
        properties = {
            screen = awful.screen.preferred,
            implicit_timeout = 5
        }
    }
    end)

naughty.connect_signal("request::display", function(n)
    naughty.layout.box {notification = n}
end)

naughty.config.defaults.padding      = dpi(5)
naughty.config.defaults.margin       = dpi(3)
naughty.config.defaults.ontop        = true
naughty.config.defaults.screen       = awful.screen.focused()
naughty.config.defaults.icon_size    = beautiful.notification_icon_size
naughty.config.defaults.margin       = beautiful.notification_margin
naughty.config.defaults.border_width = beautiful.notification_border_width
naughty.config.defaults.title        = "Notification"
naughty.config.defaults.position     = "top_right"
naughty.config.defaults.timeout      = 5
naughty.config.defaults.width        = beautiful.notification_width

