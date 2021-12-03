local naughty = require("naughty")
local awful = require("awful")
local ruled = require("ruled")
local menubar = require("menubar")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

-- Timeouts
naughty.config.defaults.timeout = 5
naughty.config.presets.low.timeout = 3
naughty.config.presets.critical.timeout = 10

-- Apply theme variables
naughty.config.padding = dpi(8)
naughty.config.spacing = dpi(8)
naughty.config.icon_formats = { "svg", "png", "jpg", "gif" }

ruled.notification.connect_signal("request::rules", function()
    -- All notifications will match this rule.
    ruled.notification.append_rule({
        rule = {},
        properties = {
            screen = awful.screen.preferred,
            implicit_timeout = 5,
            font = beautiful.notification_font,
            width = beautiful.notification_width,
            height = beautiful.notification_height
        },
    })
end)

-- Handle notification icon
naughty.connect_signal("request::icon", function(n, context, hints)
    -- Handle other contexts here
    if context ~= "app_icon" then return end
    -- Use XDG icon
    local path = menubar.utils.lookup_icon(hints.app_icon) or menubar.utils.lookup_icon(hints.app_icon:lower())
    if path then
        n.icon = path
    end
end)
