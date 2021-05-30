local awful = require("awful")
local gears = require("gears")

local keys = {}

-- Mod keys
superkey = "Mod4"
altkey   = "Mod1"
ctrlkey  = "Control"
shiftkey = "Shift"

require("keys.hotkeys_popup")

-- Global keys {{{
keys.globalkeys = gears.table.join(
    -- Reload Awesome
    awful.key({ superkey, ctrlkey }, "r", awesome.restart,
        {description = "Reload", group = "Awesome"}),

    -- Quit Awesome
    -- Logout, Shutdown, Restart, Suspend, Lock
    awful.key({ superkey }, "Escape",
        function ()
            exit_screen_show()
        end,
        {description = "Quit awesome", group = "Awesome"}),

    awful.key({ }, "XF86PowerOff",
        function ()
            exit_screen_show()
        end,
        {description = "Quit awesome", group = "Awesome"}),

    awful.key({ superkey }, "F1", function()
        require("keys.hotkeys_popup").popup:show_help()
    end, { description = "Help for Keybindings", group = "Awesome"}),

    -- Dashboard
    awful.key({ superkey }, "F2", function()
        if dashboard_show then
            dashboard_show()
        end
        -- rofi_show()
    end, {description = "Toggle Dashboard", group = "Awesome"}),
    
    -- Toggle tray visibility
    awful.key({ superkey }, "=",
        function ()
            tray_toggle()
        end,
        {description = "Toggle Tray", group = "Awesome"}),

    -- Toggle sidebar
    awful.key({ superkey }, "`", function()
        sidebar_toggle()
    end, { description = "Toggle Sidebar", group = "Awesome" }),

    -- Toggle wibar(s)
    awful.key({ superkey }, "b", function()
        wibars_toggle()
    end, { description = "Toggle Bars", group = "Awesome" }),

    -- App drawer
    awful.key({ superkey }, "F3", function()
        app_drawer_show()
    end, {description = "App drawer", group = "Awesome"}),

    -- Run
    awful.key({ superkey }, ";",
        function ()
            -- Not all sidebars have a prompt
            if sidebar_activate_prompt then
                sidebar_activate_prompt("run")
            end
        end,
        {description = "Run", group = "Apps: Prompt"}),

    -- Web search
    awful.key({ superkey, shiftkey }, ";",
        function ()
            -- Not all sidebars have a prompt
            if sidebar_activate_prompt then
                sidebar_activate_prompt("web_search")
            end
        end,
        {description = "Web Search", group = "Apps: Prompt"})

)
-- --}}}

keys.apps       = require("keys.apps")
keys.controller = require("keys.controller")
keys.layout     = require("keys.layout")
keys.tags       = require("keys.tags")

keys.button         = require("keys.button")
keys.client         = require("keys.client")
keys.desktopbuttons = require("keys.desktop")

keys.globalkeys = gears.table.join(
    keys.globalkeys,
    keys.apps, keys.controller,
    keys.layout, keys.tags,
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
