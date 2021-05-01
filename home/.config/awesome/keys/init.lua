local awful = require("awful")
local naughty = require("naughty")
local gears = require("gears")

local hotkeys_popup = require("awful.hotkeys_popup")
require("keys.hotkeys_popup")

local keys = {}

-- Mod keys
superkey = "Mod4"
altkey   = "Mod1"
ctrlkey  = "Control"
shiftkey = "Shift"

keys.apps       = require("keys.apps")
keys.controller = require("keys.controller")
keys.layout     = require("keys.layout")
keys.tag        = require("keys.tag")

keys.button         = require("keys.button")
keys.client         = require("keys.client")
keys.desktopbuttons = require("keys.desktop")


keys.globalkeys = gears.table.join(
    -- Reload Awesome
    awful.key({ superkey, ctrlkey }, "r", awesome.restart,
        {description = "reload awesome", group = "awesome"}),

    -- Quit Awesome
    -- Logout, Shutdown, Restart, Suspend, Lock
    awful.key({ superkey, shiftkey }, "x",
        function ()
            exit_screen_show()
        end,
        {description = "quit awesome", group = "awesome"}),

    awful.key({ superkey }, "Escape",
        function ()
            exit_screen_show()
        end,
        {description = "quit awesome", group = "awesome"}),

    awful.key({ }, "XF86PowerOff",
        function ()
            exit_screen_show()
        end,
        {description = "quit awesome", group = "awesome"}),

    awful.key({ superkey }, "F1",
        hotkeys_popup.show_help,
        {description="show help", group="awesome"}),

    -- Run
    awful.key({ superkey }, ";",
        function ()
            -- Not all sidebars have a prompt
            if sidebar_activate_prompt then
                sidebar_activate_prompt("run")
            end
        end,
        {description = "activate sidebar run prompt", group = "awesome"}),

    -- Web search
    awful.key({ superkey, shiftkey }, ";",
        function ()
            -- Not all sidebars have a prompt
            if sidebar_activate_prompt then
                sidebar_activate_prompt("web_search")
            end
        end,
        {description = "activate sidebar web search prompt", group = "awesome"}),

    -- Dismiss notifications and elements that connect to the dismiss signal
    awful.key( { ctrlkey }, "space",
        function()
            awesome.emit_signal("elemental::dismiss")
            naughty.destroy_all_notifications()
        end,
        {description = "dismiss notification", group = "notifications"}),

    -- Dashboard
    awful.key({ superkey }, "F2", function()
        if dashboard_show then
            dashboard_show()
        end
        -- rofi_show()
    end, {description = "dashboard", group = "awesome"}),
    
    -- Toggle tray visibility
    awful.key({ superkey }, "=",
        function ()
            tray_toggle()
        end,
        {description = "toggle tray visibility", group = "awesome"}),

    -- Toggle sidebar
    awful.key({ superkey }, "grave", function()
        sidebar_toggle()
    end, { description = "show or hide sidebar", group = "awesome" }),

    -- Toggle wibar(s)
    awful.key({ superkey }, "b", function()
        wibars_toggle()
    end, { description = "show or hide wibar(s)", group = "awesome" }),

    -- App drawer
    awful.key({ superkey }, "a", function()
        app_drawer_show()
                                 end,
        {description = "App drawer", group = "awesome"})

)

keys.apps       = require("keys.apps")
keys.controller = require("keys.controller")
keys.layout     = require("keys.layout")
keys.tag        = require("keys.tag")

keys.button         = require("keys.button")
keys.client         = require("keys.client")
keys.desktopbuttons = require("keys.desktop")

keys.globalkeys = gears.table.join(
    keys.globalkeys,
    keys.apps, keys.controller,
    keys.layout, keys.tag,
    keys.client.globals
)

keys.clientkeys = keys.client.clientkeys
keys.clientbuttons = keys.button.client
keys.tasklist_buttons = keys.button.tasklist
keys.taglist_buttons = keys.button.taglist
keys.titlebar_buttons = keys.button.titlebar

-- Set root (desktop) keys
root.keys(keys.globalkeys)
root.buttons(keys.desktopbuttons)

return keys
