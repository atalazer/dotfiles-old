local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local naughty = require("naughty")
local dpi = require("beautiful").xresources.apply_dpi
local apps = require("configs.apps")
local clickable_container = require("noodle.clickable_container")

local helpers = require("helpers")
local beautiful = require("beautiful")
local fg_color = beautiful.widget_fg or beautiful.fg_normal

local config_dir = gears.filesystem.get_configuration_dir()
local widget_icon_dir = config_dir .. "noodle/network/icons/"

-- Configuration
local interfaces = {
    wlan_interface = "wlan0",
}

local network_mode = nil

local return_button = function()
    local startup = awesome.startup or true
    local reconnect_startup = false

    local widget = wibox.widget({
        {
            id = "icon",
            image = helpers.colorize_image(widget_icon_dir .. "wifi-strength-off" .. ".svg", fg_color),
            widget = wibox.widget.imagebox,
            resize = true,
        },
        layout = wibox.layout.align.horizontal,
    })

    local widget_button = wibox.widget({
        {
            widget,
            margins = beautiful.widget_margin * 2,
            widget = wibox.container.margin,
        },
        widget = clickable_container,
    })

    widget_button:buttons(gears.table.join(awful.button({}, 1, nil, apps.network)))

    local network_tooltip = awful.tooltip({
        markup = "Loading...",
        objects = { widget_button },
        mode = "outside",
        align = "right",
        preferred_positions = { "left", "right", "top", "bottom" },
        margin_leftright = dpi(8),
        margin_topbottom = dpi(8),
    })

    local check_internet_health = [[
        status_ping=0
        packets="$(ping -q -w2 -c2 1.1.1.1 | grep -o "100% packet loss")"
        if [ -n "${packets}" ]; then
            status_ping=0
        else
            status_ping=1
        fi

        if [ $status_ping -eq 0 ]; then echo 'Connected but no internet'; fi
	]]

    -- Awesome/System startup
    local update_startup = function()
        if startup then
            startup = false
        end
    end

    -- Consider reconnecting a startup
    local update_reconnect_startup = function(status)
        reconnect_startup = status
    end

    -- Update tooltip
    local update_tooltip = function(message)
        network_tooltip:set_markup(message)
    end

    local network_notify = function(message, title, app_name, icon)
        naughty.notification({
            message = message,
            title = title,
            app_name = app_name,
            icon = icon,
        })
    end

    -- Wireless mode / Update
    local update_wireless = function()
        network_mode = "wireless"

        -- Create wireless connection notification
        local notify_connected = function(essid)
            local message = 'You are now connected to <b>"' .. essid .. '"</b>'
            local title = "Connection Established"
            local app_name = "System Notification"
            local icon = widget_icon_dir .. "wifi.svg"
            network_notify(message, title, app_name, icon)
        end

        -- Get wifi essid and bitrate
        local update_wireless_data = function(strength, healthy)
            awful.spawn.easy_async_with_shell([[
				iw dev ]] .. interfaces.wlan_interface .. [[ link
				]], function(stdout)
                local essid = stdout:match("SSID: (.-)\n") or "N/A"
                local bitrate = stdout:match("tx bitrate: (.+/s)") or "N/A"
                local message = "Connected to: <b>"
                    .. (essid or "Loading...*")
                    .. "</b>\nWireless Interface: <b>"
                    .. interfaces.wlan_interface
                    .. "</b>\nWiFi-Strength: <b>"
                    .. tostring(wifi_strength)
                    .. "%"
                    .. "</b>\nBit rate: <b>"
                    .. tostring(bitrate)
                    .. "</b>"

                if healthy then
                    update_tooltip(message)
                else
                    update_tooltip("<b>Connected but no internet!</b>\n" .. message)
                end

                if reconnect_startup or startup then
                    notify_connected(essid)
                    update_reconnect_startup(false)
                end
            end)
        end

        -- Update wifi icon based on wifi strength and health
        local update_wireless_icon = function(strength)
            awful.spawn.easy_async_with_shell(check_internet_health, function(stdout)
                local widget_icon_name = "wifi-strength"
                if not stdout:match("Connected but no internet") then
                    if startup or reconnect_startup then
                        awesome.emit_signal("system::network_connected")
                    end
                    widget_icon_name = widget_icon_name .. "-" .. tostring(strength)
                    update_wireless_data(wifi_strength_rounded, true)
                else
                    widget_icon_name = widget_icon_name .. "-" .. tostring(strength) .. "-alert"
                    update_wireless_data(wifi_strength_rounded, false)
                end
                widget.icon:set_image(helpers.colorize_image(widget_icon_dir .. widget_icon_name .. ".svg", fg_color))
            end)
        end

        -- Get wifi strength
        local update_wireless_strength = function()
            awful.spawn.easy_async_with_shell(
                [[ awk 'NR==3 {printf "%3.0f" ,($3/70)*100}' /proc/net/wireless ]],
                function(stdout)
                    if not tonumber(stdout) then return end
                    wifi_strength = tonumber(stdout)
                    local wifi_strength_rounded = math.floor(wifi_strength / 25 + 0.5)
                    update_wireless_icon(wifi_strength_rounded)
                end
            )
        end

        update_wireless_strength()
        update_startup()
    end

    local update_disconnected = function()
        local notify_wireless_disconnected = function(essid)
            local message = "Wi-Fi network has been disconnected"
            local title = "Connection Disconnected"
            local app_name = "System Notification"
            local icon = widget_icon_dir .. "wifi-strength-off.svg"
            network_notify(message, title, app_name, icon)
        end

        local widget_icon_name = "wifi-strength-off"

        if network_mode == "wireless" then
            widget_icon_name = "wifi-strength-off"
            if not reconnect_startup then
                update_reconnect_startup(true)
                notify_wireless_disconnected()
            end
        end
        update_tooltip("Network is currently disconnected")
        widget.icon:set_image(helpers.colorize_image(widget_icon_dir .. widget_icon_name .. ".svg", fg_color))
    end

    local check_network_mode = function()
        awful.spawn.easy_async_with_shell([[
			wireless="]] .. tostring(interfaces.wlan_interface) .. [["
			net="/sys/class/net/"

			wireless_state="down"
			network_mode=""

			# Check network state based on interface's operstate value
			check_network_state() {
				# Check what interface is up
				if [ "${wireless_state}" = "up" ]; then
					network_mode='wireless'
				else
					network_mode='No internet connection'
				fi
			}

			# Check if network directory exist
			check_network_directory() {
				if [ -n "${wireless}" ] && [ -d "${net}${wireless}" ];
				then
					wireless_state="$(cat "${net}${wireless}/operstate")"
				fi
				check_network_state
			}

			# Start script
			print_network_mode() {
				check_network_directory
				printf "${network_mode}"
			}
			print_network_mode
			]], function(stdout)
            local mode = stdout:gsub("%\n", "")
            if stdout:match("No internet connection") then
                update_disconnected()
            elseif stdout:match("wireless") then
                update_wireless()
            end
        end)
    end

    local network_updater = gears.timer({
        timeout = 5,
        autostart = true,
        call_now = true,
        callback = function()
            check_network_mode()
        end,
    })

    return widget_button
end

return return_button
