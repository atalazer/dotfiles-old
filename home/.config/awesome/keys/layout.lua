local awful = require("awful")
local gears = require("gears")

local keys = gears.table.join(
    -- Number of master clients
    awful.key({ superkey, altkey }, "h", function()
        awful.tag.incnmaster(1, nil, true)
    end, {
        description = "increase the number of master clients",
        group = "Layout",
    }),

    awful.key({ superkey, altkey }, "l", function()
        awful.tag.incnmaster(-1, nil, true)
    end, {
        description = "decrease the number of master clients",
        group = "Layout",
    }),

    awful.key({ superkey, altkey }, "Left", function()
        awful.tag.incnmaster(1, nil, true)
    end, {
        description = "increase the number of master clients",
        group = "Layout",
    }),

    awful.key({ superkey, altkey }, "Right", function()
        awful.tag.incnmaster(-1, nil, true)
    end, {
        description = "decrease the number of master clients",
        group = "Layout",
    }),

    -- Number of columns
    awful.key({ superkey, altkey }, "k", function()
        awful.tag.incncol(1, nil, true)
    end, {
        description = "increase the number of columns",
        group = "Layout",
    }),

    awful.key({ superkey, altkey }, "j", function()
        awful.tag.incncol(-1, nil, true)
    end, {
        description = "decrease the number of columns",
        group = "Layout",
    }),

    awful.key({ superkey, altkey }, "Up", function()
        awful.tag.incncol(1, nil, true)
    end, {
        description = "increase the number of columns",
        group = "Layout",
    }),

    awful.key({ superkey, altkey }, "Down", function()
        awful.tag.incncol(-1, nil, true)
    end, {
        description = "decrease the number of columns",
        group = "Layout",
    }),

    awful.key({ superkey }, "space", function()
        awful.Layout.inc(1)
    end, {
        description = "select next",
        group = "Layout",
    }),

    awful.key({ superkey, shiftkey }, "space", function()
        awful.Layout.inc(-1)
    end, {
        description = "select previous",
        group = "Layout",
    }),

    -- ================= Tag Layouts {{{
    -- Max layout
    -- Single tap: Set max layout
    -- Double tap: Also disable floating for ALL visible clients in the tag
    awful.key({ superkey }, "w", function()
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
    awful.key({ superkey }, "s", function()
        awful.layout.set(awful.layout.suit.tile)
        helpers.single_double_tap(nil, function()
            local clients = awful.screen.focused().clients
            for _, c in pairs(clients) do
                c.floating = false
            end
        end)
    end, { description = "set tiled layout", group = "Layout" }),

    -- Set floating layout
    awful.key({ superkey, shiftkey }, "s", function()
        awful.layout.set(awful.layout.suit.floating)
    end, { description = "set floating layout", group = "Layout" })
    
    -- }}}

)

return keys
