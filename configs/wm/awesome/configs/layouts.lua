local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi
local helpers = require("helpers")

-- Bling Module
local bling = require("lib.bling")

-- Custom Layouts -------------------------------------------------------------
-- Set the layouts

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    bling.layout.mstab,
    bling.layout.centered,
    -- bling.layout.vertical,
    -- bling.layout.horizontal,
    bling.layout.equalarea,
    -- bling.layout.deck
    -- awful.layout.suit.max,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.fair,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.corner.nw,
    --awful.layout.suit.magnifier,
    --awful.layout.suit.corner.ne,
    --awful.layout.suit.corner.sw,
    --awful.layout.suit.corner.se,
}


-- Set tags layout
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts(layouts)
end)

awful.layout.layouts = layouts

-- Layout List Widget ---------------------------------------------------------
local ll = awful.widget.layoutlist({
    source = awful.widget.layoutlist.source.default_layouts,
    spacing = dpi(24),
    base_layout = wibox.widget({
        spacing = dpi(24),
        forced_num_cols = 4,
        layout = wibox.layout.grid.vertical,
    }),
    widget_template = {
        {
            {
                id = "icon_role",
                forced_height = dpi(68),
                forced_width = dpi(68),
                widget = wibox.widget.imagebox,
            },
            margins = dpi(24),
            widget = wibox.container.margin,
        },
        id = "background_role",
        forced_width = dpi(68),
        forced_height = dpi(68),
        widget = wibox.container.background,
    },
})

-- Popup
local layout_popup = awful.popup({
    widget = wibox.widget({
        { ll, margins = dpi(24), widget = wibox.container.margin },
        bg = beautiful.bg_focus,
        shape = helpers.rrect(beautiful.border_radius),
        border_color = beautiful.border_color,
        border_width = beautiful.border_width,
        widget = wibox.container.background,
    }),
    placement = awful.placement.centered,
    ontop = true,
    visible = false,
    bg = beautiful.bg_normal,
})

-- Key Bindings for Widget ----------------------------------------------------

-- Make sure you remove the default `Mod4+Space` and `Mod4+Shift+Space`
-- keybindings before adding this.
function gears.table.iterate_value(t, value, step_size, filter, start_at)
    local k = gears.table.hasitem(t, value, true, start_at)
    if not k then return end

    step_size = step_size or 1
    local new_key = gears.math.cycle(#t, k + step_size)

    if filter and not filter(t[new_key]) then
        for i = 1, #t do
            local k2 = gears.math.cycle(#t, new_key + i)
            if filter(t[k2]) then
                return t[k2], k2
            end
        end
        return
    end

    return t[new_key], new_key
end

awful.keygrabber({
    start_callback = function() layout_popup.visible = true end, stop_callback = function() layout_popup.visible = false end,
    export_keybindings = true,
    stop_event = "release",
    stop_key = { "Escape", "Super_L", "Super_R", "Mod4" },
    keybindings = {
        {
            { "Mod4", "Shift" }, " ",
            function() awful.layout.set(gears.table.iterate_value(ll.layouts, ll.current_layout, -1), nil) end,
        },
        {
            { "Mod4" }, " ",
            function() awful.layout.set(gears.table.iterate_value(ll.layouts, ll.current_layout, 1), nil) end,
        },
    },
})

-- Hide all windows when a splash is shown
awesome.connect_signal("widgets::splash::visibility", function(vis)
    local t = screen.primary.selected_tag
    if vis then
        for idx, c in ipairs(t:clients()) do c.hidden = true end
    else
        for idx, c in ipairs(t:clients()) do c.hidden = false end
    end
end)

