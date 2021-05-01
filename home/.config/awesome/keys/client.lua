local awful = require("awful")
local gears = require("gears")
local decorations = require("decorations")

local helpers = require("helpers")
local delta = 20

local keys =  {}

keys.globals = gears.table.join(
    -- Focus client by direction
    awful.key({ superkey }, "Down", function()
        awful.client.focus.bydirection("down")
    end, { description = "focus down", group = "client" }),
    awful.key({ superkey }, "j", function()
        awful.client.focus.bydirection("down")
    end, { description = "focus down", group = "client" }),

    awful.key({ superkey }, "Up", function()
        awful.client.focus.bydirection("up")
    end, { description = "focus up", group = "client" }),
    awful.key({ superkey }, "k", function()
        awful.client.focus.bydirection("up")
    end, { description = "focus up", group = "client" }),

    awful.key({ superkey }, "Left", function()
        awful.client.focus.bydirection("left")
    end, { description = "focus left", group = "client" }),
    awful.key({ superkey }, "h", function()
        awful.client.focus.bydirection("left")
    end, { description = "focus left", group = "client" }),

    awful.key({ superkey }, "Right", function()
        awful.client.focus.bydirection("right")
    end, { description = "focus right", group = "client" }),
    awful.key({ superkey }, "l", function()
        awful.client.focus.bydirection("right")
    end, { description = "focus right", group = "client" }),

    -- Window switcher
    awful.key({ altkey }, "Tab", function()
        window_switcher_show(awful.screen.focused())
    end, { description = "activate window switcher", group = "client" }),

    -- Focus client by index (cycle through clients)
    awful.key({ superkey }, "z", function()
        awful.client.focus.byidx(1)
    end, { description = "focus next by index", group = "client" }),

    awful.key({ superkey, shiftkey }, "z", function()
        awful.client.focus.byidx(-1)
    end, { description = "focus next by index", group = "client" }),

    -- Kill all visible clients for the current tag
    awful.key({ superkey, altkey }, "q",
        function ()
            local clients = awful.screen.focused().clients
            for _, c in pairs(clients) do
                c:kill()
            end
        end,
        {description = "kill all visible clients for the current tag", group = "client"}
    ),

    -- Urgent or Undo:
    -- Jump to urgent client or (if there is no such client) go back
    -- to the last tag
    awful.key({ superkey,           }, "u",
        function ()
            uc = awful.client.urgent.get()
            -- If there is no urgent client, go back to last tag
            if uc == nil then
                awful.tag.history.restore()
            else
                awful.client.urgent.jumpto()
            end
        end,
        {description = "jump to urgent client", group = "client"}),

    awful.key({ superkey, shiftkey }, "n",
        function ()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                client.focus = c
            end
        end,
        {description = "restore minimized", group = "client"})

)

keys.clientkeys = gears.table.join(

    -- Move to edge or swap by direction
    awful.key({ superkey, shiftkey, ctrlkey }, "Down", function (c)
        helpers.move_client_dwim(c, "down")
    end),
    awful.key({ superkey, shiftkey, ctrlkey }, "j", function (c)
        helpers.move_client_dwim(c, "down")
    end),

    awful.key({ superkey, shiftkey, ctrlkey }, "Up", function (c)
        helpers.move_client_dwim(c, "up")
    end),
    awful.key({ superkey, shiftkey, ctrlkey }, "k", function (c)
        helpers.move_client_dwim(c, "up")
    end),

    awful.key({ superkey, shiftkey, ctrlkey }, "Left", function (c)
        helpers.move_client_dwim(c, "left")
    end),
    awful.key({ superkey, shiftkey, ctrlkey }, "h", function (c)
        helpers.move_client_dwim(c, "left")
    end),

    awful.key({ superkey, shiftkey, ctrlkey }, "Right", function (c)
        helpers.move_client_dwim(c, "right")
    end),
    awful.key({ superkey, shiftkey, ctrlkey }, "l", function (c)
        helpers.move_client_dwim(c, "right")
    end),

    -- Relative move client
    awful.key({ superkey, ctrlkey }, "Down", function (c)
        c:relative_move(0,  dpi(delta), 0, 0)
    end),
    awful.key({ superkey, ctrlkey }, "j", function (c)
        c:relative_move(0,  dpi(delta), 0, 0)
    end),

    awful.key({ superkey, ctrlkey }, "Up", function (c)
        c:relative_move(0, dpi(-delta), 0, 0)
    end),
    awful.key({ superkey, ctrlkey }, "k", function (c)
        c:relative_move(0, dpi(-delta), 0, 0)
    end),

    awful.key({ superkey, ctrlkey }, "Left", function (c)
        c:relative_move( dpi(-delta), 0, 0, 0)
    end),
    awful.key({ superkey, ctrlkey }, "h", function (c)
        c:relative_move( dpi(-delta), 0, 0, 0)
    end),

    awful.key({ superkey, ctrlkey }, "Right", function (c)
        c:relative_move( dpi(delta), 0, 0, 0)
    end),
    awful.key({ superkey, ctrlkey }, "l", function (c)
        c:relative_move( dpi(delta), 0, 0, 0)
    end),

    -- Single tap: Center client 
    -- Double tap: Center client + Floating + Resize
    awful.key({ superkey }, "c", function (c)
        awful.placement.centered(c, {honor_workarea = true, honor_padding = true})
        helpers.single_double_tap(
            nil,
            function ()
                helpers.float_and_resize(c, screen_width * 0.65, screen_height * 0.9)
            end)
    end),

    -- F for focused view
    awful.key({ superkey, ctrlkey  }, "f",
        function (c)
            helpers.float_and_resize(c, screen_width * 0.7, screen_height * 0.75)
        end,
        {description = "focus mode", group = "client"}),

    -- V for vertical view
    awful.key({ superkey, ctrlkey  }, "v",
        function (c)
            helpers.float_and_resize(c, screen_width * 0.45, screen_height * 0.90)
        end,
        {description = "focus mode", group = "client"}),

    -- T for tiny window
    awful.key({ superkey, ctrlkey  }, "t",
        function (c)
            helpers.float_and_resize(c, screen_width * 0.3, screen_height * 0.35)
        end,
        {description = "tiny mode", group = "client"}),

    -- N for normal size (good for terminals)
    awful.key({ superkey, ctrlkey  }, "n",
        function (c)
            helpers.float_and_resize(c, screen_width * 0.45, screen_height * 0.5)
        end,
        {description = "normal mode", group = "client"}),

    -- Toggle floating
    awful.key({ superkey, ctrlkey }, "space",
        function(c)
            local layout_is_floating = (awful.layout.get(mouse.screen) == awful.layout.suit.floating)
            if not layout_is_floating then
                awful.client.floating.toggle()
            end
        end,
        {description = "toggle floating", group = "client"}),

    -- Set master
    awful.key({ superkey, ctrlkey }, "Return", function (c) c:swap(awful.client.getmaster()) end,
        {description = "move to master", group = "client"}),

    -- Change client opacity
    awful.key({ superkey }, "o",
        function (c)
            c.opacity = c.opacity - 0.02
        end,
        {description = "decrease client opacity", group = "client"}),
    awful.key({ superkey, shiftkey }, "o",
        function (c)
            c.opacity = c.opacity + 0.02
        end,
        {description = "increase client opacity", group = "client"}),

    -- Minimize
    awful.key({ altkey }, "F3",
        function (c)
            c.minimized = true
        end,
        {description = "minimize", group = "client"}),

    -- Close
    awful.key({ altkey }, "F4",      function (c) c:kill() end,
        {description = "close", group = "client"}),

    -- Maximize
    awful.key({ altkey,           }, "F5",
        function (c)
            c.maximized = not c.maximized
        end,
        {description = "(un)maximize", group = "client"}),

    awful.key({ altkey, ctrlkey }, "F5",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),

    awful.key({ altkey, shiftkey   }, "F5",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"}),

    -- Toggle titlebars (for focused client only)
    awful.key({ altkey }, "F6",
        function (c)
            decorations.cycle(c)
        end,
        {description = "toggle titlebar", group = "client"}),

    -- Toggle titlebars (for all visible clients in selected tag)
    awful.key({ altkey, shiftkey }, "F6",
        function (c)
            local clients = awful.screen.focused().clients
            for _, c in pairs(clients) do
                decorations.cycle(c)
            end
        end,
        {description = "toggle titlebar", group = "client"}),

    -- On top
    awful.key({ altkey, shiftkey }, "F7", function (c) c.ontop = not c.ontop end,
        {description = "toggle keep on top", group = "client"}),

    -- Sticky
    awful.key({ altkey, ctrlkey }, "F8", function (c) c.sticky = not c.sticky end,
        {description = "toggle sticky", group = "client"}),

    -- Toggle fullscreen
    awful.key({ altkey }, "F12",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"})

)
return keys
