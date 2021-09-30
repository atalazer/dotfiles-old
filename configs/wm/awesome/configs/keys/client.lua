local awful = require("awful")
local gears = require("gears")
local decorations = require("decorations")
local bling = require("lib.bling")
local helpers = require("helpers")
local l = require("configs.keys.lib")

local delta = 20

local keys = {}

local focus_direction = function(direction)
    awful.client.focus.bydirection(direction)
    -- bling.module.flash_focus.flashfocus(client.focus)
end

keys.globals = gears.table.join(
    l.keys("Tabs", { altkey }, {
        a = { bling.module.tabbed.pick_with_dmenu, "Pick client to add" },
        s = { bling.module.tabbed.iter, "Iterate currently focused" },
        r = { bling.module.tabbed.pop, "Removes focused client" }
    }),

    -- Window switcher
    awful.key({ altkey }, "Tab", function()
        window_switcher_show(awful.screen.focused())
    end, {
        description = "Window switcher",
        group = "Client: Focus",
    }),

    -- Focus client by direction
    awful.key({ superkey }, "Down", function()
        focus_direction("down")
    end, {
        description = "Down",
        group = "Client: Focus",
    }),
    awful.key({ superkey }, "j", function()
        focus_direction("down")
    end, {
        description = "Down",
        group = "Client: Focus",
    }),

    awful.key({ superkey }, "Up", function()
        focus_direction("up")
    end, {
        description = "Up",
        group = "Client: Focus",
    }),
    awful.key({ superkey }, "k", function()
        focus_direction("up")
    end, {
        description = "Up",
        group = "Client: Focus",
    }),

    awful.key({ superkey }, "Left", function()
        focus_direction("left")
    end, {
        description = "Left",
        group = "Client: Focus",
    }),
    awful.key({ superkey }, "h", function()
        focus_direction("left")
    end, {
        description = "Left",
        group = "Client: Focus",
    }),

    awful.key({ superkey }, "Right", function()
        focus_direction("right")
    end, {
        description = "Right",
        group = "Client: Focus",
    }),
    awful.key({ superkey }, "l", function()
        focus_direction("right")
    end, {
        description = "Right",
        group = "Client: Focus",
    }),

    -- Focus client by index (cycle through clients)
    awful.key({ superkey }, "z", function()
        awful.client.focus.byidx(1)
    end, {
        description = "Next by index",
        group = "Client: Focus",
    }),

    awful.key({ superkey, shiftkey }, "z", function()
        awful.client.focus.byidx(-1)
    end, {
        description = "Previous by index",
        group = "Client: Focus",
    }),

    -- Urgent or Undo:
    -- Jump to urgent client or (if there is no such client) go back
    -- to the last tag
    awful.key({ superkey }, "u", function()
        uc = awful.client.urgent.get()
        -- If there is no urgent client, go back to last tag
        if uc == nil then
            awful.tag.history.restore()
        else
            awful.client.urgent.jumpto()
        end
    end, {
        description = "Urgent/Undo client",
        group = "Client: Focus",
    }),

    awful.key({ superkey, shiftkey }, "n", function()
        local c = awful.client.restore()
        -- Focus restored client
        if c then
            client.focus = c
        end
    end, {
        description = "Restored Client",
        group = "Client: Focus",
    })
)

keys.clientkeys = gears.table.join(

    -- Move to edge or swap by direction
    awful.key({ superkey, shiftkey, ctrlkey }, "Down", function(c)
        helpers.move_client_dwim(c, "down")
    end, {
        description = "Down Edge",
        group = "Client: Move",
    }),
    awful.key({ superkey, shiftkey, ctrlkey }, "j", function(c)
        helpers.move_client_dwim(c, "down")
    end, {
        description = "Down Edge",
        group = "Client: Move",
    }),

    awful.key({ superkey, shiftkey, ctrlkey }, "Up", function(c)
        helpers.move_client_dwim(c, "up")
    end, {
        description = "Up Edge",
        group = "Client: Move",
    }),
    awful.key({ superkey, shiftkey, ctrlkey }, "k", function(c)
        helpers.move_client_dwim(c, "up")
    end, {
        description = "Up Edge",
        group = "Client: Move",
    }),

    awful.key({ superkey, shiftkey, ctrlkey }, "Left", function(c)
        helpers.move_client_dwim(c, "left")
    end, {
        description = "Left Edge",
        group = "Client: Move",
    }),
    awful.key({ superkey, shiftkey, ctrlkey }, "h", function(c)
        helpers.move_client_dwim(c, "left")
    end, {
        description = "Left Edge",
        group = "Client: Move",
    }),

    awful.key({ superkey, shiftkey, ctrlkey }, "Right", function(c)
        helpers.move_client_dwim(c, "right")
    end, {
        description = "Right Edge",
        group = "Client: Move",
    }),
    awful.key({ superkey, shiftkey, ctrlkey }, "l", function(c)
        helpers.move_client_dwim(c, "right")
    end, {
        description = "Right Edge",
        group = "Client: Move",
    }),

    -- Relative move client
    awful.key({ superkey, ctrlkey }, "Down", function(c)
        c:relative_move(0, dpi(delta), 0, 0)
    end, {
        description = "Down",
        group = "Client: Move",
    }),
    awful.key({ superkey, ctrlkey }, "j", function(c)
        c:relative_move(0, dpi(delta), 0, 0)
    end, {
        description = "Down",
        group = "Client: Move",
    }),

    awful.key({ superkey, ctrlkey }, "Up", function(c)
        c:relative_move(0, dpi(-delta), 0, 0)
    end, {
        description = "Up",
        group = "Client: Move",
    }),
    awful.key({ superkey, ctrlkey }, "k", function(c)
        c:relative_move(0, dpi(-delta), 0, 0)
    end, {
        description = "Up",
        group = "Client: Move",
    }),

    awful.key({ superkey, ctrlkey }, "Left", function(c)
        c:relative_move(dpi(-delta), 0, 0, 0)
    end, {
        description = "Left",
        group = "Client: Move",
    }),
    awful.key({ superkey, ctrlkey }, "h", function(c)
        c:relative_move(dpi(-delta), 0, 0, 0)
    end, {
        description = "Left",
        group = "Client: Move",
    }),

    awful.key({ superkey, ctrlkey }, "Right", function(c)
        c:relative_move(dpi(delta), 0, 0, 0)
    end, {
        description = "Right",
        group = "Client: Move",
    }),
    awful.key({ superkey, ctrlkey }, "l", function(c)
        c:relative_move(dpi(delta), 0, 0, 0)
    end, {
        description = "Right",
        group = "Client: Move",
    }),

    -- Resize focused client or layout factor
    awful.key({ superkey, shiftkey }, "Down", function()
        helpers.resize_dwim(client.focus, "down")
    end, {
        description = "Decrease y",
        group = "Client: Resize",
    }),
    awful.key({ superkey, shiftkey }, "j", function()
        helpers.resize_dwim(client.focus, "down")
    end, {
        description = "Decrease y",
        group = "Client: Resize",
    }),

    awful.key({ superkey, shiftkey }, "Up", function()
        helpers.resize_dwim(client.focus, "up")
    end, {
        description = "Increase y",
        group = "Client: Resize",
    }),
    awful.key({ superkey, shiftkey }, "k", function()
        helpers.resize_dwim(client.focus, "up")
    end, {
        description = "Increase y",
        group = "Client: Resize",
    }),

    awful.key({ superkey, shiftkey }, "Left", function()
        helpers.resize_dwim(client.focus, "left")
    end, {
        description = "Decrease x",
        group = "Client: Resize",
    }),
    awful.key({ superkey, shiftkey }, "h", function()
        helpers.resize_dwim(client.focus, "left")
    end, {
        description = "Decrease x",
        group = "Client: Resize",
    }),

    awful.key({ superkey, shiftkey }, "Right", function()
        helpers.resize_dwim(client.focus, "right")
    end, {
        description = "Increase x",
        group = "Client: Resize",
    }),
    awful.key({ superkey, shiftkey }, "l", function()
        helpers.resize_dwim(client.focus, "right")
    end, {
        description = "Increase x",
        group = "Client: Resize",
    }),

    -- F for focused view
    awful.key({ superkey, ctrlkey }, "f", function(c)
        helpers.float_and_resize(c, screen_width * 0.7, screen_height * 0.75)
    end, {
        description = "Focus Mode",
        group = "Client: View",
    }),

    -- V for vertical view
    awful.key({ superkey, ctrlkey }, "v", function(c)
        helpers.float_and_resize(c, screen_width * 0.45, screen_height * 0.90)
    end, {
        description = "Vertical Mode",
        group = "Client: View",
    }),

    -- T for tiny window
    awful.key({ superkey, ctrlkey }, "t", function(c)
        helpers.float_and_resize(c, screen_width * 0.3, screen_height * 0.35)
    end, {
        description = "Tiny Mode",
        group = "Client: View",
    }),

    -- N for normal size (good for terminals)
    awful.key({ superkey, ctrlkey }, "n", function(c)
        helpers.float_and_resize(c, screen_width * 0.45, screen_height * 0.5)
    end, {
        description = "Normal Mode",
        group = "Client: View",
    }),

    -- Toggle floating
    awful.key({ superkey, ctrlkey }, "space", function()
        local layout_is_floating = (awful.layout.get(mouse.screen) == awful.layout.suit.floating)
        if not layout_is_floating then
            awful.client.floating.toggle()
        end
    end, {
        description = "Toggle Floating",
        group = "Client: Control",
    }),

    -- Set master
    awful.key({ superkey, ctrlkey }, "Return", function(c)
        c:swap(awful.client.getmaster())
    end, {
        description = "To Master",
        group = "Client: Control",
    }),

    -- Change client opacity
    awful.key({ superkey }, "o", function(c)
        c.opacity = c.opacity - 0.02
    end, {
        description = "Decrease Opacity",
        group = "Client: Control",
    }),
    awful.key({ superkey, shiftkey }, "o", function(c)
        c.opacity = c.opacity + 0.02
    end, {
        description = "Increase Opacity",
        group = "Client: Control",
    }),

    -- Minimize
    awful.key({ altkey }, "F3", function(c)
        c.minimized = true
    end, {
        description = "minimize",
        group = "Client: Control",
    }),

    -- Close
    awful.key({ altkey }, "F4", function(c)
        c:kill()
    end, { description = "close", group = "Client: Control" }),

    -- Maximize
    awful.key({ altkey }, "F5", function(c)
        c.maximized = not c.maximized
    end, {
        description = "(un)maximize",
        group = "Client: Control",
    }),

    awful.key({ altkey, ctrlkey }, "F5", function(c)
        c.maximized_vertical = not c.maximized_vertical
        c:raise()
    end, {
        description = "(un)maximize vertically",
        group = "Client: Control",
    }),

    awful.key({ altkey, shiftkey }, "F5", function(c)
        c.maximized_horizontal = not c.maximized_horizontal
        c:raise()
    end, {
        description = "(un)maximize horizontally",
        group = "Client: Control",
    }),

    -- Toggle titlebars (for focused client only)
    awful.key({ altkey }, "F6", function(c)
        decorations.cycle(c)
    end, {
        description = "Toggle Titlebar",
        group = "Client: Control",
    }),

    -- On top
    awful.key({ altkey }, "F7", function(c)
        c.ontop = not c.ontop
    end, {
        description = "Toggle Ontop",
        group = "Client: Control",
    }),

    -- Sticky
    awful.key({ altkey }, "F8", function(c)
        c.sticky = not c.sticky
    end, {
        description = "Toggle Sticky",
        group = "Client: Control",
    }),

    -- Toggle fullscreen
    awful.key({ altkey }, "F12", function(c)
        c.fullscreen = not c.fullscreen
        c:raise()
    end, {
        description = "toggle fullscreen",
        group = "Client: Control",
    })
)
return keys
