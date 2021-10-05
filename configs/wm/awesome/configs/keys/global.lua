local awful = require("awful")
local gears = require("gears")

local hotkeys_popup = require("awful.hotkeys_popup")
require("configs.keys.hotkeys_popup")

local l = require("configs.keys.lib")
local utils = {
    exit_screen = function() if exit_screen_show then exit_screen_show() end end,
    dashboard = function() if dashboard_show then dashboard_show() end end,
    app_drawer = function() if app_drawer_show then app_drawer_show() end end,
    sidebar = function() if sidebar_toggle then sidebar_toggle() end end,
    notif_center = function() if notif_toggle then notif_toggle() end end,
    tray = function() if tray_toggle then tray_toggle() end end,
    bar = function() if bar_toggle then bar_toggle() end end,
    dock = function() if dock_toggle then dock_toggle() end end,
    web_search = function() if sidebar_activate_prompt then sidebar_activate_prompt("web_search") end end,
    run_shell = function() if sidebar_activate_prompt then sidebar_activate_prompt("run") end end,
}

local keys = gears.table.join(
    l.set_keymap("Awesome",{
        ["WC|r"] = { awesome.restart, "Reload Awesome" },
        ["W|F1"] = { hotkeys_popup.widget.show_help, "Show Keybindings Help Popup", },
        ["W|F2"] = { utils.dashboard, "Show Keybindings Help Popup", },
        ["W|F3"] = { utils.app_drawer, "Show App Drawers", },
        ["W|="] = { utils.tray, "Toggle Tray" },
        ["W|`"] = { utils.sidebar, "Toggle Sidebar" },
        ["W|'"] = { utils.notif_center, "Toggle Notif Center" },
        ["W|b"] = { utils.bar, "Toggle Bar" },
        ["WS|b"] = { utils.dock, "Toggle Dock" },
        ["W|;"] = { utils.run_shell, "Open Shell Run Prompt" },
        ["WS|;"] = { utils.web_search, "Open Web Search Prompt" },
        ["W|Escape"] = { utils.exit_screen, "Show Exit Screen" },
        XF86PowerOff = { utils.exit_screen, "Show Exit Screen" },
    })
)

return keys
