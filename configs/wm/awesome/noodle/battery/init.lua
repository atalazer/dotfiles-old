local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local naught = require("naughty")
local watch = awful.widget.watch

local apps = require("configs.apps")
local helpers = require("helpers")
local beautiful = require("beautiful")
local fg_color = beautiful.widget_fg or beautiful.fg_normal

local clickable_container = require("noodle.clickable_container")
local config_dir = gears.filesystem.get_configuration_dir()
local widget_icon_dir = config_dir .. "noodle/battery/icons/"

local return_button = function()
    local battery_imagebox = wibox.widget({
        nil,
        {
            id = "icon",
            image = helpers.colorize_image(widget_icon_dir .. "battery" .. ".svg", fg_color),
            widget = wibox.widget.imagebox,
            resize = true,
        },
        nil,
        expand = "none",
        layout = wibox.layout.align.vertical,
    })

    local battery_percentage_text = wibox.widget({
        id = "percent_text",
        markup = "100%",
        font = beautiful.widget_font_name .. "10",
        align = "center",
        valign = "center",
        visible = false,
        widget = wibox.widget.textbox,
    })

    local battery_widget = wibox.widget({
        layout = wibox.layout.fixed.horizontal,
        spacing = dpi(0),
        battery_percentage_text,
        battery_imagebox,
    })

    local battery_button = wibox.widget({
        {
            battery_widget,
            margins = beautiful.widget_margin or dpi(3),
            widget = wibox.container.margin,
        },
        widget = clickable_container,
    })

    battery_button:buttons(gears.table.join(awful.button({}, 1, nil, apps.battery)))

    local battery_tooltip = awful.tooltip({
        objects = { battery_button },
        markup = "None",
        mode = "outside",
        align = "right",
        margin_leftright = dpi(8),
        margin_topbottom = dpi(8),
        preferred_positions = { "right", "left", "top", "bottom" },
    })

    local get_battery_info = function()
        awful.spawn.easy_async_with_shell("upower -i $(upower -e | grep BAT)", function(stdout)
            if stdout == nil or stdout == "" then
                battery_tooltip:set_text("No battery detected!")
                return
            end

            -- Remove new line from the last line
            -- battery_tooltip:set_text(stdout:sub(1, -2))
            battery_tooltip:set_markup(
                helpers.colorize_text(stdout:sub(1, -2), fg_color)
            )
        end)
    end
    get_battery_info()

    battery_widget:connect_signal("mouse::enter", function()
        get_battery_info()
    end)

    local last_battery_check = os.time()
    local notify_critcal_battery = true

    local show_battery_warning = function()
        naughty.notification({
            icon = widget_icon_dir .. "battery-alert.svg",
            app_name = "System notification",
            title = "Battery is dying!",
            message = "Hey, I think we have a problem here. Save your work before reaching the oblivion.",
            urgency = "critical",
        })
    end

    local update_battery = function(status)
        awful.spawn.easy_async_with_shell(
            [[sh -c "
			upower -i $(upower -e | grep BAT) | grep percentage | awk '{print \$2}' | tr -d '\n%'
			"]],
            function(stdout)
                local battery_percentage = tonumber(stdout)

                -- Stop if null
                if not battery_percentage then
                    return
                end

                local color
                if battery_percentage < 20 then
                    color = x.color1
                else
                    color = fg_color
                end

                battery_widget.spacing = dpi(5)
                battery_percentage_text.visible = true
                battery_percentage_text:set_markup(
                    helpers.colorize_text(
                        battery_percentage .. "%",
                        color
                    )
                )

                local icon_name = "battery"

                -- Fully charged
                if (status == "fully-charged" or status == "charging") and battery_percentage == 100 then
                    icon_name = icon_name .. "-" .. "fully-charged"
                    battery_imagebox.icon:set_image(
                        helpers.colorize_image(
                            gears.surface.load_uncached(widget_icon_dir .. icon_name .. ".svg"),
                            color
                        )
                    )
                    return
                end

                -- Critical level warning message
                if (battery_percentage > 0 and battery_percentage < 10) and status == "discharging" then
                    icon_name = icon_name .. "-" .. "alert-red"

                    if os.difftime(os.time(), last_battery_check) > 300 or notify_critcal_battery then
                        last_battery_check = os.time()
                        notify_critcal_battery = false
                        show_battery_warning()
                    end
                    battery_imagebox.icon:set_image(
                        helpers.colorize_image(
                            gears.surface.load_uncached(widget_icon_dir .. icon_name .. ".svg"),
                            color
                        )
                    )
                    return
                end

                -- Discharging
                if battery_percentage > 0 and battery_percentage < 20 then
                    icon_name = icon_name .. "-" .. status .. "-" .. "10"
                elseif battery_percentage >= 20 and battery_percentage < 30 then
                    icon_name = icon_name .. "-" .. status .. "-" .. "20"
                elseif battery_percentage >= 30 and battery_percentage < 50 then
                    icon_name = icon_name .. "-" .. status .. "-" .. "30"
                elseif battery_percentage >= 50 and battery_percentage < 60 then
                    icon_name = icon_name .. "-" .. status .. "-" .. "50"
                elseif battery_percentage >= 60 and battery_percentage < 80 then
                    icon_name = icon_name .. "-" .. status .. "-" .. "60"
                elseif battery_percentage >= 80 and battery_percentage < 90 then
                    icon_name = icon_name .. "-" .. status .. "-" .. "80"
                elseif battery_percentage >= 90 and battery_percentage < 100 then
                    icon_name = icon_name .. "-" .. status .. "-" .. "90"
                end

                battery_imagebox.icon:set_image(
                    helpers.colorize_image(
                        gears.surface.load_uncached(widget_icon_dir .. icon_name .. ".svg"),
                        color
                    )
                )
            end
        )
    end

    -- Watch status if charging, discharging, fully-charged
    watch(
        [[sh -c "
		upower -i $(upower -e | grep BAT) | grep state | awk '{print \$2}' | tr -d '\n'
		"]],
        5,
        function(_, stdout)
            local status = stdout:gsub("%\n", "")

            -- If no output or no battery detected
            if status == nil or status == "" then
                battery_widget.spacing = dpi(0)
                battery_percentage_text.visible = false
                battery_tooltip:set_markup(helpers.colorize_text("No battery detected!", beautiful.red))
                battery_imagebox.icon:set_image(
                    helpers.colorize_image(
                        gears.surface.load_uncached(widget_icon_dir .. "battery-unknown" .. ".svg"),
                        fg_color
                    )
                )
                return
            end

            update_battery(status)
        end
    )

    return battery_button
end

return return_button
