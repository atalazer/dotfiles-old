local awful = require("awful")
local gears = require("gears")

local helpers = require("helpers")

local keys = gears.table.join(
    -- No need for these (single screen setup)
    --awful.key({ superkey, ctrlkey }, "j", function () awful.screen.focus_relative( 1) end,
    --{description = "focus the next screen", group = "screen"}),

    --awful.key({ superkey, ctrlkey }, "k", function () awful.screen.focus_relative(-1) end,
    --{description = "focus the previous screen", group = "screen"}),

    -- ================= Tag Moves {{{

    awful.key({ superkey }, "[",
        --awful.key({ W }, "Left",
        awful.tag.viewprev,
        { description = "view previous", group = "tag" }),

    awful.key({ superkey }, "]",
        --awful.key({ W }, "Right",
        awful.tag.viewnext,
        { description = "view next", group = "tag" }),
    
    -- awful.key({ superkey }, "x", function()
    --     awful.tag.history.restore()
    -- end, { description = "go back", group = "tag" }),
    
    --}}}

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
    end, { description = "set max layout", group = "tag" }),

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
    end, { description = "set tiled layout", group = "tag" }),

    -- Set floating layout
    awful.key({ superkey, shiftkey }, "s", function()
        awful.layout.set(awful.layout.suit.floating)
    end, { description = "set floating layout", group = "tag" }),
    
    -- }}}

    -- ================= Tag Moves {{{
    awful.key({
        modifiers = { superkey },
        keygroup = "numrow",
        description = "only view tag",
        group = "tag",
        on_press = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    }),

    awful.key({
        modifiers = { superkey, shiftkey },
        keygroup = "numrow",
        description = "move focused client to tag",
        group = "tag",
        on_press = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    }),

    awful.key({
        modifiers = { superkey, altkey },
        keygroup = "numrow",
        description = "move all visible clients on tag",
        group = "tag",
        on_press = function(index)
            local tag = client.focus.screen.tags[index]
            local clients = awful.screen.focused().clients
            if tag then
                for _, c in pairs(clients) do
                    c:move_to_tag(tag)
                end
                tag:view_only()
            end
        end,
    }),

    awful.key({
        modifiers = { superkey, ctrlkey },
        keygroup = "numrow",
        description = "toggle tag",
        group = "tag",
        on_press = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    }),

    awful.key({
        modifiers = { superkey, ctrlkey, shiftkey },
        keygroup = "numrow",
        description = "toggle focused client on tag",
        group = "tag",
        on_press = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    })

    -- }}}

)

return keys
