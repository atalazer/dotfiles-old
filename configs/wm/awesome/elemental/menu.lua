local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
-- local beautiful = require("beautiful")
-- local apps = require("configs.apps")

local utils = {
    exit_screen = function() if exit_screen_show then exit_screen_show() end end,
    dashboard = function() if dashboard_show then dashboard_show() end end,
    app_drawer = function() if app_drawer_show then app_drawer_show() end end,
    hotkeys = function() hotkeys_popup.widget.show_help(nil, awful.screen.focused()) end
}

local menu = awful.menu({
    items = {
        { "App Drawer", utils.app_drawer },
        { "Dasboard", utils.dashboard },
        { "Hotkeys", utils.hotkeys },
        { "Exit", utils.exit_screen},
    }
})

return menu
