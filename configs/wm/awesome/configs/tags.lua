local awful = require("awful")
local beautiful = require("beautiful")
local bling = require("lib.bling")

local screen_width = awful.screen.focused().geometry.width
local screen_height = awful.screen.focused().geometry.height

bling.widget.tag_preview.enable({
    scale = 0.225,
    x = screen_width * 0.2,
    y = screen_height * 0.2,
    show_client_content = true,
    honor_padding = true,
    honor_workarea = false,
    placement_fn = function(c)
        awful.placement.top_left(c, {
            margins = {
                top = beautiful.wibar_height + beautiful.useless_gap / 2,
                left = beautiful.useless_gap / 2
            }
        })
    end,
})

-- Layout per Tags
-- =======================================
awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    local l = awful.layout.suit -- Alias to save time :)

    -- Tag layouts
    local layouts = {
        l.tile,
        l.max,
        l.max,
        l.max,
        l.floating,
    }

    -- Tag names
    local tagnames = { "1", "2", "3", "4", "5" }

    -- Create all tags at once (without seperate configuration for each tag)
    awful.tag(tagnames, s, layouts)
end)

local update_gap_and_shape = function(t)
    -- Get current tag layout
    local current_layout = awful.tag.getproperty(t, "layout")
    -- If the current layout is awful.layout.suit.max
    if current_layout == awful.layout.suit.max then
        -- Set clients gap to 0 and shape to rectangle if maximized
        t.gap = 0
        for _, c in ipairs(t:clients()) do
            if not c.floating or not c.round_corners or c.maximized or c.fullscreen then
                c.shape = beautiful.client_shape_rectangle
            else
                c.shape = beautiful.client_shape_rounded
            end
        end
    else
        t.gap = beautiful.useless_gap
        for _, c in ipairs(t:clients()) do
            if not c.round_corners or c.maximized or c.fullscreen then
                c.shape = beautiful.client_shape_rectangle
            else
                c.shape = beautiful.client_shape_rounded
            end
        end
    end
end

-- Change tag's client's shape and gap on change
tag.connect_signal("property::layout", function(t)
    update_gap_and_shape(t)
end)

-- Change tag's client's shape and gap on move to tag
tag.connect_signal("tagged", function(t)
    update_gap_and_shape(t)
end)

-- Focus on urgent clients
awful.tag.attached_connect_signal(s, "property::selected", function()
    local urgent_clients = function(c)
        return awful.rules.match(c, { urgent = true })
    end
    for c in awful.client.iterate(urgent_clients) do
        if c.first_tag == mouse.screen.selected_tag then
            c:emit_signal("request::activate")
            c:raise()
        end
    end
end)
