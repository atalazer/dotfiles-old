local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local helpers = require("helpers")
local decorations = require("decorations")
local bling = require("lib.bling")

local keys = require("configs.keys")

-- Button configuration
local gen_button_size = dpi(8)
local gen_button_margin = dpi(8)
local gen_button_color_unfocused = x.color8
local gen_button_shape = gears.shape.circle

if user.round_enabled == true then
    decorations.enable_rounding()
end

-- Add a titlebar
client.connect_signal("request::titlebars", function(c)
    awful.titlebar(
        c,
        { font = beautiful.titlebar_font, position = beautiful.titlebar_position, size = beautiful.titlebar_size }
    ):setup({
        {
            -- awful.titlebar.widget.iconwidget(c),
            bling.widget.tabbed_misc.titlebar_indicator(c),
            buttons = keys.titlebar_buttons,
            layout = wibox.layout.fixed.horizontal,
        },
        {
            {
                widget = beautiful.titlebar_title_enabled and awful.titlebar.widget.titlewidget(c)
                    or wibox.widget.textbox(""),
                font = beautiful.titlebar_font,
                align = beautiful.titlebar_title_align or "center",
            },
            buttons = keys.titlebar_buttons,
            layout  = wibox.layout.flex.horizontal
        },
        {
            -- AwesomeWM native buttons (images loaded from theme)
            -- awful.titlebar.widget.minimizebutton(c),
            -- awful.titlebar.widget.maximizedbutton(c),
            -- awful.titlebar.widget.closebutton(c),

            -- Generated buttons
            decorations.button(c, gen_button_shape, x.color3, gen_button_color_unfocused,
                x.color11, gen_button_size, gen_button_margin, "minimize"),
            decorations.button(c, gen_button_shape, x.color2, gen_button_color_unfocused,
                x.color10, gen_button_size, gen_button_margin, "maximize"),
            decorations.button(c, gen_button_shape, x.color1, gen_button_color_unfocused,
                x.color9, gen_button_size, gen_button_margin, "close"),
            -- decorations.text_button(c, "", "Material Icons 9", x.color1, gen_button_color_unfocused,
            --     x.color9, gen_button_size, gen_button_margin, "close"),

            -- Create some extra padding at the edge
            helpers.horizontal_pad(gen_button_margin / 2),

            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal,
    })
end)
