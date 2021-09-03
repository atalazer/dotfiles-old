local awful = require("awful")
local gears = require("gears")

local hotkeys_popup = require("awful.hotkeys_popup")

local keys = gears.table.join(
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

    awful.key({ superkey }, "F1", hotkeys_popup.show_help,
        { description = "Help for Keybindings", group = "Awesome"}),

    -- Dashboard
    awful.key({ superkey }, "F2", function()
        if dashboard_show then
            dashboard_show()
        end
    end, {description = "Dashboard", group = "Awesome"}),

    -- Notification Center
    awful.key({ superkey }, "'", function()
        screen.primary.notif_panel:toggle()
    end, {description = "Notification Center", group = "Awesome"}),

    -- Toggle tray visibility
    awful.key({ superkey }, "=",
        function ()
            tray_toggle()
        end,
        {description = "Tray", group = "Awesome"}),

    -- Toggle sidebar
    awful.key({ superkey }, "`", function()
        sidebar_toggle()
    end, { description = "Sidebar", group = "Awesome" }),

    -- Toggle wibar(s)
    awful.key({ superkey }, "b", function()
        wibars_toggle()
    end, { description = "Bars", group = "Awesome" }),

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

return keys
