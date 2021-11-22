local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local clickable_container = require("noodle.clickable_container")

local calendar_popup = require("noodle.calendar_popup")
local military_mode = beautiful.clock_miltary_mode or false

local create_clock = function(s)
    -- See: file:///usr/share/doc/awesome/doc/widgets/wibox.widget.textclock.html
    local clock_format
    if not military_mode then
        clock_format = '<span font="'
            .. beautiful.widget_font
            .. '" foreground="'
            .. beautiful.widget_fg
            .. '">%a %I:%M %p</span>'
    else
        clock_format = '<span font="'
            .. beautiful.widget_font
            .. '" foreground="'
            .. beautiful.widget_fg
            .. '">%H:%M</span>'
    end

    s.clock_widget = wibox.widget.textclock(clock_format, 1)

    s.clock_widget = wibox.widget({
        {
            s.clock_widget,
            margins = beautiful.widget_margin or dpi(3),
            widget = wibox.container.margin,
        },
        widget = clickable_container,
    })

    s.clock_widget:connect_signal("mouse::enter", function()
        local w = mouse.current_wibox
        if w then
            old_cursor, old_wibox = w.cursor, w
            w.cursor = "hand1"
        end
    end)

    s.clock_widget:connect_signal("mouse::leave", function()
        if old_wibox then
            old_wibox.cursor = old_cursor
            old_wibox = nil
        end
    end)

    s.clock_tooltip = awful.tooltip({
        objects = { s.clock_widget },
        mode = "outside",
        delay_show = 1,
        preferred_positions = { "right", "left", "top", "bottom" },
        preferred_alignments = { "middle", "front", "back" },
        margin_leftright = dpi(8),
        margin_topbottom = dpi(8),
        timer_function = function()
            local ordinal = nil

            local day = os.date("%d")
            local month = os.date("%B")

            local first_digit = string.sub(day, 0, 1)
            local last_digit = string.sub(day, -1)

            if first_digit == "0" then
                day = last_digit
            end

            if last_digit == "1" and day ~= "11" then
                ordinal = "st"
            elseif last_digit == "2" and day ~= "12" then
                ordinal = "nd"
            elseif last_digit == "3" and day ~= "13" then
                ordinal = "rd"
            else
                ordinal = "th"
            end

            local date_str = string.format(
                "Today is the <b>%s%s of %s</b>.\n And it's fucking <b>%s</b>",
                day,
                ordinal,
                month,
                os.date("%A")
            )

            return date_str
        end,
    })

    s.calendar_popup = calendar_popup({
        placement = "top_right",
        radius = dpi(8),
    })

    s.clock_widget:connect_signal("button::press", function(_, _, _, button)
        -- Hide the tooltip when you press the clock widget
        if button == 1 then
            if s.clock_tooltip.visible then s.clock_tooltip.visible = false end
            if s.calendar_popup then s.calendar_popup.toggle() end
        end
    end)

    return s.clock_widget
end

return create_clock
