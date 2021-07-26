local awful = require("awful")
local gears = require("gears")

local helpers = require("helpers")
local machi = require("layout-machi")

local keys = gears.table.join(
    -- Layout Machi
    awful.key({ superkey, altkey }, ".", function()
        machi.default_editor.start_interactive()
    end, {
        description = "Edit Layout",
        group = "Layout: Machi"
    }),

    awful.key({ superkey, altkey }, "/", function()
        machi.switcher.start(client.focus)
    end, {
        description = "Switch Window",
        group = "Layout: Machi"
    }),

    -- Number of master clients
    awful.key({ superkey, altkey }, "h", function()
        awful.tag.incnmaster(1, nil, true)
    end, {
        description = "Inscrease the number of master clients",
        group = "Layout",
    }),

    awful.key({ superkey, altkey }, "l", function()
        awful.tag.incnmaster(-1, nil, true)
    end, {
        description = "Decrease the number of master clients",
        group = "Layout",
    }),

    awful.key({ superkey, altkey }, "Left", function()
        awful.tag.incnmaster(1, nil, true)
    end, {
        description = "Inscrease the number of master clients",
        group = "Layout",
    }),

    awful.key({ superkey, altkey }, "Right", function()
        awful.tag.incnmaster(-1, nil, true)
    end, {
        description = "Decrease the number of master clients",
        group = "Layout",
    }),

    -- Number of columns
    awful.key({ superkey, altkey }, "k", function()
        awful.tag.incncol(1, nil, true)
    end, {
        description = "Inscrease the number of columns",
        group = "Layout",
    }),

    awful.key({ superkey, altkey }, "j", function()
        awful.tag.incncol(-1, nil, true)
    end, {
        description = "Decrease the number of columns",
        group = "Layout",
    }),

    awful.key({ superkey, altkey }, "Up", function()
        awful.tag.incncol(1, nil, true)
    end, {
        description = "Inscrease the number of columns",
        group = "Layout",
    }),

    awful.key({ superkey, altkey }, "Down", function()
        awful.tag.incncol(-1, nil, true)
    end, {
        description = "Decrease the number of columns",
        group = "Layout",
    }),

    awful.key({ superkey }, "space", function()
        awful.layout.inc(1)
    end, {
        description = "Select next",
        group = "Layout",
    }),

    awful.key({ superkey, shiftkey }, "space", function()
        awful.layout.inc(-1)
    end, {
        description = "Select previous",
        group = "Layout",
    }),

    -- ================= Tag Layouts {{{
    -- Max layout
    -- Single tap: Set max layout
    -- Double tap: Also disable floating for ALL visible clients in the tag
    awful.key({ superkey, altkey }, "m", function()
        awful.layout.set(awful.layout.suit.max)
        helpers.single_double_tap(nil, function()
            local clients = awful.screen.focused().clients
            for _, c in pairs(clients) do
                c.floating = false
            end
        end)
    end, { description = "set max layout", group = "Layout" }),

    -- Tiling
    -- Single tap: Set tiled layout
    -- Double tap: Also disable floating for ALL visible clients in the tag
    awful.key({ superkey, altkey }, "t", function()
        awful.layout.set(awful.layout.suit.tile)
        helpers.single_double_tap(nil, function()
            local clients = awful.screen.focused().clients
            for _, c in pairs(clients) do
                c.floating = false
            end
        end)
    end, { description = "Set Tiled", group = "Layout" }),

    -- Set floating layout
    awful.key({ superkey, altkey }, "f", function()
        awful.layout.set(awful.layout.suit.floating)
    end, { description = "Set floating", group = "Layout" })
    
    -- }}}

)

return keys
