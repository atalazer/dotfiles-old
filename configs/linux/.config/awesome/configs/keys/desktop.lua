local awful = require("awful")
local naughty = require("naughty")
local gears = require("gears")

local helpers = require("helpers")

local desktopbuttons = gears.table.join(
    awful.button({ }, 1, function ()
        -- Single tap
        awesome.emit_signal("elemental::dismiss")
        naughty.destroy_all_notifications()
        if mymainmenu then
            mymainmenu:hide()
        end
        if sidebar_hide then
            sidebar_hide()
        end
        -- Double tap
        local function double_tap()
            uc = awful.client.urgent.get()
            -- If there is no urgent client, go back to last tag
            if uc == nil then
                awful.tag.history.restore()
            else
                awful.client.urgent.jumpto()
            end
        end
        helpers.single_double_tap(function() end, double_tap)
    end),

    -- Right click - Show app drawer
    -- awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 3, function ()
        if app_drawer_show then
            app_drawer_show()
        end
    end),

    -- Middle button - Toggle dashboard
    awful.button({ }, 2, function ()
        if dashboard_show then
            dashboard_show()
        end
    end),

    -- Scrolling - Switch tags
    awful.button({ }, 4, awful.tag.viewprev),
    awful.button({ }, 5, awful.tag.viewnext),

    -- Side buttons - Control volume
    awful.button({ }, 9, function () helpers.volume_control(5) end),
    awful.button({ }, 8, function () helpers.volume_control(-5) end)

    -- Side buttons - Minimize and restore minimized client
    -- awful.button({ }, 8, function()
    --     if client.focus ~= nil then
    --         client.focus.minimized = true
    --     end
    -- end),
    -- awful.button({ }, 9, function()
    --       local c = awful.client.restore()
    --       -- Focus restored client
    --       if c then
    --           client.focus = c
    --       end
    -- end)
)

return desktopbuttons
