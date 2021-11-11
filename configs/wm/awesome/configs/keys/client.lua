local awful = require("awful")
local gears = require("gears")
local decorations = require("decorations")
local bling = require("lib.bling")
local helpers = require("helpers")
local l = require("configs.keys.lib")

local delta = 20

local keys = {}
local utils = {}

utils.focus_direction = function(direction)
    awful.client.focus.bydirection(direction)
    -- bling.module.flash_focus.flashfocus(client.focus)
end

utils.focus = {
    swithcer = function() window_switcher_show(awful.screen.focused()) end,
    up = function() utils.focus_direction("up") end,
    down = function() utils.focus_direction("down") end,
    left = function() utils.focus_direction("left") end,
    right = function() utils.focus_direction("right") end,
    next = function() awful.client.focus.byidx(1) end,
    prev = function() awful.client.focus.byidx(-1) end,
    urgent = function()
        uc = awful.client.urgent.get()
        if uc == nil then
            awful.tag.history.restore()
        else
            awful.client.urgent.jumpto()
        end
    end,
}

utils.move = {
    edge = {
        left = function(c) helpers.move_client_dwim(c, "left") end,
        down = function(c) helpers.move_client_dwim(c, "down") end,
        up = function(c) helpers.move_client_dwim(c, "up") end,
        right = function(c) helpers.move_client_dwim(c, "right") end,
    },
    relative = {
        left = function(c) c:relative_move(dpi(-delta), 0, 0, 0) end,
        down = function(c) c:relative_move(0, dpi(delta), 0, 0) end,
        up = function(c) c:relative_move(0, dpi(-delta), 0, 0) end,
        right = function(c) c:relative_move(dpi(delta), 0, 0, 0) end,
    },
}

utils.resize = {
    up = function() helpers.resize_dwim(client.focus, "up") end,
    down = function() helpers.resize_dwim(client.focus, "down") end,
    left = function() helpers.resize_dwim(client.focus, "left") end,
    right = function() helpers.resize_dwim(client.focus, "right") end,
}

utils.view = {
    focus = function(c) helpers.float_and_resize(c, screen_width * 0.7, screen_height * 0.75) end,
    vertical = function(c) helpers.float_and_resize(c, screen_width * 0.45, screen_height * 0.90) end,
    tiny = function(c) helpers.float_and_resize(c, screen_width * 0.3, screen_height * 0.35) end,
    normal = function(c) helpers.float_and_resize(c, screen_width * 0.45, screen_height * 0.5) end,
}

utils.control = {
    master = function(c) c:swap(awful.client.getmaster()) end,
    kill = function(c) c:kill() end,
    titlebar = function(c) decorations.cycle(c) end,
    ontop = function(c) c.ontop = not c.ontop end,
    sticky = function(c) c.sticky = not c.sticky end,
    fullscreen = function(c) c.fullscreen = not c.fullscreen c:raise() end,
    minimize = function(c) c.minimized = true end,
    maximize = {
        full = function(c) c.maximized = not c.maximized end,
        vertical = function(c) c.maximized_vertical = not c.maximized_vertical c:raise() end,
        horizontal = function(c) c.maximized_horizontal = not c.maximized_horizontal c:raise() end,
    },
    opacity = {
        increase = function(c) c.opacity = c.opacity + 0.02 end,
        decrease = function(c) c.opacity = c.opacity - 0.02 end,
    },
    floating = function()
        local layout_is_floating = (awful.layout.get(mouse.screen) == awful.layout.suit.floating)
        if not layout_is_floating then
            awful.client.floating.toggle()
        end
    end,
}

keys.globals = gears.table.join(
    l.set_keymap("Tabs", {
        ["A|a"] = { bling.module.tabbed.pick_with_dmenu, "Pick client to add" },
        ["A|s"] = { bling.module.tabbed.iter, "Iterate currently focused" },
        ["A|r"] = { bling.module.tabbed.pop, "Removes focused client" },
    }),

    l.set_keymap("Client: Focus", {
        ["A|Tab"] = { utils.focus.swithcer, "Window switcher" },
        ["W|Left"] = { utils.focus.left, "Focus Left" },
        ["W|Down"] = { utils.focus.down, "Focus Down" },
        ["W|Up"] = { utils.focus.up, "Focus Up" },
        ["W|Right"] = { utils.focus.right, "Focus Right" },
        -- ["W|h"] = { utils.focus.left, "Focus Left" },
        -- ["W|j"] = { utils.focus.down, "Focus Down" },
        -- ["W|k"] = { utils.focus.up, "Focus Up" },
        -- ["W|l"] = { utils.focus.right, "Focus Right" },
        ["W|h"] = { utils.focus.next, "Next by Index" },
        ["W|l"] = { utils.focus.prev, "Previous by Index" },
        ["W|u"] = { utils.focus.urgent, "Focus to Urgent" },
    })
)

keys.clientkeys = gears.table.join(
    l.set_keymap("Client: Move", {
        ["WC|Left"] = { utils.move.relative.Left, "Move Left Relatively" },
        ["WC|Down"] = { utils.move.relative.Down, "Move Down Relatively" },
        ["WC|Up"] = { utils.move.relative.Up, "Move Up Relatively" },
        ["WC|Right"] = { utils.move.relative.Right, "Move Right Relatively" },
        -- ["WC|h"] = { utils.move.relative.Left, "Move Left Relatively" },
        -- ["WC|j"] = { utils.move.relative.Down, "Move Down Relatively" },
        -- ["WC|k"] = { utils.move.relative.Up, "Move Up Relatively" },
        -- ["WC|l"] = { utils.move.relative.Right, "Move Right Relatively" },

        ["WSC|Left"] = { utils.move.edge.Left, "Move to Left Edge" },
        ["WSC|Down"] = { utils.move.edge.Down, "Move to Down Edge" },
        ["WSC|Up"] = { utils.move.edge.Up, "Move to Up Edge" },
        ["WSC|Right"] = { utils.move.edge.Right, "Move to Right Edge" },
        -- ["WSC|h"] = { utils.move.edge.Left, "Move to Left Edge" },
        -- ["WSC|j"] = { utils.move.edge.Down, "Move to Down Edge" },
        -- ["WSC|k"] = { utils.move.edge.Up, "Move to Up Edge" },
        -- ["WSC|l"] = { utils.move.edge.Right, "Move to Right Edge" },
    }),

    l.set_keymap("Client: Resize", {
        ["WS|Left"] = { utils.resize.left, "Resize Client -x" },
        ["WS|Down"] = { utils.resize.down, "Resize Client -y" },
        ["WS|Up"] = { utils.resize.up, "Resize Client +y" },
        ["WS|Right"] = { utils.resize.right, "Resize Client +x" },
        ["WS|h"] = { utils.resize.left, "Resize Client -x" },
        ["WS|j"] = { utils.resize.down, "Resize Client -y" },
        ["WS|k"] = { utils.resize.up, "Resize Client +y" },
        ["WS|l"] = { utils.resize.right, "Resize Client +x" },
    }),

    l.set_keymap("Client: View", {
        ["WC|f"] = { utils.view.focus, "Focus Mode" },
        ["WC|t"] = { utils.view.tiny, "Tiny Mode" },
        ["WC|n"] = { utils.view.normal, "Normal Mode" },
        ["WC|v"] = { utils.view.vertical, "Vertical Mode" },
    }),

    l.set_keymap("Client: Control", {
        ["W|s"] = { bling.module.window_swallowing.start, "Window Swallow" },
        ["WC|space"] = { utils.control.floating, "Toggle Floating" },
        ["WC|Return"] = { utils.control.master, "Set To Master" },
        ["W|o"] = { utils.control.opacity.increase, "Increase Opacity" },
        ["WS|o"] = { utils.control.opacity.decrease, "Decrease Opacity" },
        ["A|F3"] = { utils.control.minimize, "Minimize Client" },
        ["A|F4"] = { utils.control.kill, "Kill Client" },
        ["A|F5"] = { utils.control.maximize.full, "Maximize" },
        ["AC|F5"] = { utils.control.maximize.vertical, "Maximize Vertically" },
        ["AS|F5"] = { utils.control.maximize.horizontal, "Maximize Horizontally" },
        ["A|F6"] = { utils.control.titlebar, "Toggle Tittlebar" },
        ["A|F7"] = { utils.control.ontop, "Toggle Ontop" },
        ["A|F8"] = { utils.control.sticky, "Toggle Sticky" },
        ["A|F12"] = { utils.control.fullscreen, "Toggle Fullscreen" },
    })
)

return keys
