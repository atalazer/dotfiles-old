local beautiful = require("beautiful")
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

-- Double click titlebar
function double_click_event_handler(double_click_event)
    if double_click_timer then
        double_click_timer:stop()
        double_click_timer = nil
        return true
    end

    double_click_timer = gears.timer.start_new(0.20, function()
        double_click_timer = nil
        return false
    end)
end

client.connect_signal("request::titlebars", function(c)
    local buttons = gears.table.join(
        awful.button({}, 1, function()
            c:emit_signal("request::activate", "titlebar", { raise = true })
            if double_click_event_handler() then
                c.maximized = not c.maximized
                c:raise()
            else
                awful.mouse.client.move(c)
            end
        end),
        awful.button({}, 3, function()
            c:emit_signal("request::activate", "titlebar", { raise = true })
            awful.mouse.client.resize(c)
        end)
    )

    local SP = wibox.widget({
        widget = wibox.widget.separator,
        forced_width = 5,
        opacity = 0,
    })

    local titlebar_button = {
        -- awful.titlebar.widget.minimizebutton(c),
        -- SP,
        -- awful.titlebar.widget.maximizedbutton(c),
        -- SP,
        awful.titlebar.widget.closebutton(c),
        layout = wibox.layout.fixed.horizontal,
    }

    local titlebar_title = {
        {
            align = "center",
            widget = awful.titlebar.widget.titlewidget(c),
        },
        buttons = buttons,
        layout = wibox.layout.flex.horizontal,
    }

    awful.titlebar(c, { size = beautiful.titlebar_height, position = "top" }):setup({
        {
            awful.titlebar.widget.ontopbutton(c),
            titlebar_title,
            titlebar_button,
            layout = wibox.layout.align.horizontal,
        },
        left = 10,
        right = 10,
        top = 2,
        bottom = 2,
        layout = wibox.container.margin,
    })
end)
