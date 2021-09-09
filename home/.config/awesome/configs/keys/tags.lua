local awful = require("awful")
local gears = require("gears")

local keys = gears.table.join(
    -- Tag: Gaps
    awful.key({ superkey, shiftkey }, "minus", function()
        awful.tag.incgap(5, nil)
    end, {
        description = "increment Tag: Gaps size for the current tag",
        group = "Tag: Gaps",
    }),
    awful.key({ superkey }, "minus", function()
        awful.tag.incgap(-5, nil)
    end, {
        description = "decrement gap size for the current tag",
        group = "Tag: Gaps",
    }),

    -- No need for these (single screen setup)
    --awful.key({ superkey, ctrlkey }, "j", function () awful.screen.focus_relative( 1) end,
    --{description = "focus the next screen", group = "screen"}),

    --awful.key({ superkey, ctrlkey }, "k", function () awful.screen.focus_relative(-1) end,
    --{description = "focus the previous screen", group = "screen"}),

    -- ================= Tag Moves {{{

    awful.key({ superkey }, "[", awful.tag.viewprev, { description = "Go To Previous Tag", group = "Tag: Move" }),

    awful.key({ superkey }, "]", awful.tag.viewnext, { description = "Go To Next Tag", group = "Tag: Move" }),

    awful.key({ superkey, shiftkey }, "[", function()
        local screen = awful.screen.focused()
        local ctag = screen.selected_tag
        local tag = screen.tags[ctag.index - 1]

        local c = client.focus
        if not c then
            return
        end

        if tag then
            if c then
                c:move_to_tag(tag)
                tag:view_only()
            end
        end
    end, {
        description = "Move Focused Client To Previous Tag",
        group = "Tag: Move",
    }),

    awful.key({ superkey, shiftkey }, "]", function()
        local screen = awful.screen.focused()
        local ctag = screen.selected_tag
        local tag = screen.tags[ctag.index + 1]

        local c = client.focus
        if not c then
            return
        end

        if tag then
            if c then
                c:move_to_tag(tag)
                tag:view_only()
            end
        end
    end, {
        description = "Move Focused Client To Next Tag",
        group = "Tag: Move",
    }),

    awful.key({ superkey }, "x", function()
        awful.tag.history.restore()
    end, {
        description = "Back",
        group = "Tag: Move",
    }),

    --}}}

    -- ================= Tag Moves {{{
    awful.key({
        modifiers = { superkey },
        keygroup = "numrow",
        description = "Go To Tag",
        group = "Tag: Move",
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
        description = "Move Focused Client To Tag",
        group = "Tag: Move",
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
        modifiers = { superkey, ctrlkey },
        keygroup = "numrow",
        description = "Toggle Tag",
        group = "Tag: Move",
        on_press = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    })

    -- }}}
)

return keys
