local awful = require("awful")
local gears = require("gears")

local helpers = require("helpers")

local keys = {}

keys.client = gears.table.join(
    awful.button({}, 1, function(c)
        client.focus = c
    end),
    awful.button({ superkey }, 1, awful.mouse.client.move),
    -- awful.button({ superkey }, 2, function (c) c:kill() end),
    awful.button({ superkey, shiftkey }, 1, function(c)
        client.focus = c
        awful.mouse.client.resize(c)
        -- awful.mouse.resize(c, nil, {jump_to_corner=true})
    end),

    -- Super + scroll = Change client opacity
    awful.button({ superkey }, 4, function(c)
        c.opacity = c.opacity + 0.1
    end),
    awful.button({ superkey }, 5, function(c)
        c.opacity = c.opacity - 0.1
    end)
)

-- Mouse buttons on the tasklist
-- Use 'Any' modifier so that the same buttons can be used in the floating
-- tasklist displayed by the window switcher while the superkey is pressed
keys.tasklist = gears.table.join(
    awful.button({ "Any" }, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            -- Without this, the following
            -- :isvisible() makes no sense
            c.minimized = false
            if not c:isvisible() and c.first_tag then
                c.first_tag:view_only()
            end
            -- This will also un-minimize
            -- the client, if needed
            client.focus = c
        end
    end),
    -- Middle mouse button closes the window (on release)
    awful.button({ "Any" }, 2, nil, function(c)
        c:kill()
    end),
    awful.button({ "Any" }, 3, function(c)
        c.minimized = true
    end),
    awful.button({ "Any" }, 4, function()
        awful.client.focus.byidx(-1)
    end),
    awful.button({ "Any" }, 5, function()
        awful.client.focus.byidx(1)
    end),

    -- Side button up - toggle floating
    awful.button({ "Any" }, 9, function(c)
        c.floating = not c.floating
    end),
    -- Side button down - toggle ontop
    awful.button({ "Any" }, 8, function(c)
        c.ontop = not c.ontop
    end)
)

-- Mouse buttons on a tag of the taglist widget
keys.taglist = gears.table.join(
    awful.button({}, 1, function(t)
        -- t:view_only()
        helpers.tag_back_and_forth(t.index)
    end),
    awful.button({ superkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    -- awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({}, 3, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({ superkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({}, 4, function(t)
        awful.tag.viewprev(t.screen)
    end),
    awful.button({}, 5, function(t)
        awful.tag.viewnext(t.screen)
    end)
)

-- Mouse buttons on the primary titlebar of the window
keys.titlebar = gears.table.join(
    awful.button({}, 1, function()
        local c = mouse.object_under_pointer()
        local function single_tap()
			c:activate {context = 'titlebar', action = 'mouse_move'}
        end
        local function double_tap()
            -- if c.floating then
            --     c.floating = false
            --     return
            -- end
            c.maximized = not c.maximized
            c:raise()
            return
        end
        helpers.single_double_tap(single_tap, double_tap)
    end),
    -- Middle button - close
    awful.button({}, 2, function()
        local c = mouse.object_under_pointer()
        c:kill()
    end),
    -- Right button - resize
    awful.button({}, 3, function()
        local c = mouse.object_under_pointer()
        client.focus = c
        awful.mouse.client.resize(c)
        -- awful.mouse.resize(c, nil, {jump_to_corner=true})
    end),
    -- Side button up - toggle floating
    awful.button({}, 9, function()
        local c = mouse.object_under_pointer()
        client.focus = c
        --awful.placement.centered(c,{honor_padding = true, honor_workarea=true})
        c.floating = not c.floating
    end),
    -- Side button down - toggle ontop
    awful.button({}, 8, function()
        local c = mouse.object_under_pointer()
        client.focus = c
        c.ontop = not c.ontop
        -- Double Tap - toggle sticky
        -- local function single_tap()
        --   c.ontop = not c.ontop
        -- end
        -- local function double_tap()
        --   c.sticky = not c.sticky
        -- end
        -- helpers.single_double_tap(single_tap, double_tap)
    end)
)

return keys
