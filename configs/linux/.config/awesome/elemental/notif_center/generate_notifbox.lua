local awful = require("awful")
local naughty = require("naughty")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = require("beautiful").xresources.apply_dpi

local PATH_TO_ICONS = os.getenv("HOME") .. "/.config/awesome/elemental/notif_center/icons/"

local clickable_container = require("noodle.clickable_container")

-- Boolean variable to remove empty message
local remove_notifbox_empty = true

local scroller = function(widget)
    widget:buttons(gears.table.join(
        awful.button({}, 4, nil, function()
            if #widget.children == 1 then
                return
            end
            widget:insert(1, widget.children[#widget.children])
            widget:remove(#widget.children)
        end),
        awful.button({}, 5, nil, function()
            if #widget.children == 1 then
                return
            end
            widget:insert(#widget.children + 1, widget.children[1])
            widget:remove(1)
        end)
    ))
end

-- Empty notification message
local notifbox_empty = function()
    local empty_notifbox = wibox.widget({
        {
            layout = wibox.layout.fixed.vertical,
            spacing = dpi(5),
            {
                expand = "none",
                layout = wibox.layout.align.horizontal,
                nil,
                {
                    image = PATH_TO_ICONS .. "empty-notification" .. ".svg",
                    resize = true,
                    forced_height = dpi(35),
                    forced_width = dpi(35),
                    widget = wibox.widget.imagebox,
                },
                nil,
            },
            {
                text = "Wow, such empty.",
                font = beautiful.font_bold_name .. "16",
                align = "center",
                valign = "center",
                widget = wibox.widget.textbox,
            },
            {
                text = "Come back later.",
                font = beautiful.font,
                align = "center",
                valign = "center",
                widget = wibox.widget.textbox,
            },
        },
        margins = dpi(20),
        widget = wibox.container.margin,
    })

    local separator_for_empty_msg = wibox.widget({
        orientation = "vertical",
        opacity = 0.0,
        widget = wibox.widget.separator,
    })

    -- Make empty_notifbox center
    local centered_empty_notifbox = wibox.widget({
        expand = "none",
        layout = wibox.layout.align.vertical,
        separator_for_empty_msg,
        empty_notifbox,
        separator_for_empty_msg,
    })

    return centered_empty_notifbox
end

-- Notification boxes container layout
local notifbox_layout = wibox.widget({
    layout = wibox.layout.fixed.vertical,
    spacing = dpi(5),
    notifbox_empty(),
})
scroller(notifbox_layout)

awesome.connect_signal("notifbox::deleted", function()
    if #notifbox_layout.children == 1 and remove_notifbox_empty then
        -- Reset layout
        notifbox_layout:reset(notifbox_layout)
        remove_notifbox_empty = false
    end
    -- notifbox_layout:insert(1, notifbox_layout.children[#notifbox_layout.children])
    notifbox_layout:remove(1)
end)

-- Notification icon container
local notifbox_icon = function(ico_image)
    local noti_icon = wibox.widget({
        {
            id = "icon",
            resize = true,
            forced_height = dpi(24),
            forced_width = dpi(24),
            widget = wibox.widget.imagebox,
        },
        layout = wibox.layout.fixed.horizontal,
    })
    noti_icon.icon:set_image(ico_image)
    return noti_icon
end

-- Notification app name container
local notifbox_appname = function(app)
    return wibox.widget({
        markup = app,
        font = beautiful.font_bold_name .. "12",
        align = "left",
        valign = "center",
        widget = wibox.widget.textbox,
    })
end

-- Notification title container
local notifbox_title = function(title)
    return wibox.widget({
        markup = "<b>" .. title .. "</b>",
        font = beautiful.font_bold_name .. "11",
        align = "left",
        valign = "center",
        widget = wibox.widget.textbox,
    })
end

-- Notification message container
local notifbox_message = function(msg)
    return wibox.widget({
        markup = msg,
        font = beautiful.font,
        align = "left",
        valign = "center",
        widget = wibox.widget.textbox,
    })
end

-- Notification actions container
local notifbox_actions = function(notif)
    local actions_template = wibox.widget({
        notification = notif,
        base_layout = wibox.widget({
            spacing = dpi(0),
            layout = wibox.layout.flex.horizontal,
        }),
        widget_template = {
            {
                {
                    {
                        {
                            id = "text_role",
                            font = beautiful.font,
                            widget = wibox.widget.textbox,
                        },
                        widget = wibox.container.place,
                    },
                    widget = clickable_container,
                },
                bg = beautiful.groups_bg,
                shape = gears.shape.rounded_rect,
                forced_height = 30,
                widget = wibox.container.background,
            },
            margins = 4,
            widget = wibox.container.margin,
        },
        style = { underline_normal = false, underline_selected = true },
        widget = naughty.list.actions,
    })

    return actions_template
end

-- Reset notifbox_layout
reset_notifbox_layout = function()
    notifbox_layout:reset(notifbox_layout)
    notifbox_layout:insert(1, notifbox_empty())
    remove_notifbox_empty = true
end

-- Get current time
local current_time = function()
    return os.date("%H:%M:%S")
end

-- Get exact time of creation
local exact_time = function()
    return os.date("%b %d, %I:%M %p")
end

-- Convert time to seconds
local parse_to_seconds = function(time)
    hourInSec = tonumber(string.sub(time, 1, 2)) * 3600
    minInSec = tonumber(string.sub(time, 4, 5)) * 60
    getSec = tonumber(string.sub(time, 7, 8))
    return (hourInSec + minInSec + getSec)
end

-- Returns the notification box
local notifbox_box = function(notif, icon, title, message, app, bgcolor)
    -- Get current time for `this` instance of box
    local time_of_pop = current_time()

    -- Get the time and date
    local exact_time_of_pop = exact_time()

    -- Notification time pop container
    local notifbox_timepop = wibox.widget({
        id = "time_pop",
        markup = nil,
        font = beautiful.font,
        align = "left",
        valign = "center",
        widget = wibox.widget.textbox,
    })

    -- Timer for notification time pop
    gears.timer({
        timeout = 60,
        call_now = true,
        autostart = true,
        callback = function()
            local time_difference = nil
            -- Get the time difference
            time_difference = parse_to_seconds(current_time()) - parse_to_seconds(time_of_pop)
            -- String to Number
            time_difference = tonumber(time_difference)

            -- If seconds is less than one minute
            if time_difference < 60 then
                notifbox_timepop.text = "Now"

                -- If greater that one hour
            elseif time_difference >= 3600 then
                notifbox_timepop.text = exact_time_of_pop
                return false

                -- Use time of popup instead
            else
                local time_in_minutes = math.floor(time_difference / 60)
                if tonumber(time_in_minutes) > 1 then
                    notifbox_timepop.text = time_in_minutes .. " " .. "Minutes ago"
                else
                    notifbox_timepop.text = time_in_minutes .. " " .. "Minute ago"
                end
            end

            collectgarbage("collect")
        end,
    })

    local dismiss_imagebox = wibox.widget({
        {
            id = "dismiss_icon",
            image = PATH_TO_ICONS .. "delete.svg",
            resize = true,
            forced_height = dpi(5),
            widget = wibox.widget.imagebox,
        },
        layout = wibox.layout.fixed.horizontal,
    })
    local dismiss_button = wibox.widget({
        {
            dismiss_imagebox,
            margins = dpi(5),
            widget = wibox.container.margin,
        },
        widget = clickable_container,
    })
    local notifbox_dismiss = wibox.widget({
        dismiss_button,
        visible = false,
        bg = beautiful.bg_normal,
        shape = gears.shape.circle,
        widget = wibox.container.background,
    })

    -- Template of notification box
    local notifbox_template = wibox.widget({
        id = "notifbox_template",
        expand = "none",
        {
            {
                layout = wibox.layout.fixed.vertical,
                spacing = dpi(5),
                {
                    expand = "none",
                    layout = wibox.layout.align.horizontal,
                    {
                        layout = wibox.layout.fixed.horizontal,
                        spacing = dpi(5),
                        notifbox_icon(icon),
                        notifbox_appname(app),
                        -- notifbox_title(title),
                    },
                    nil,
                    {
                        notifbox_timepop,
                        notifbox_dismiss,
                        layout = wibox.layout.fixed.horizontal,
                    },
                },
                {
                    layout = wibox.layout.fixed.vertical,
                    spacing = dpi(5),
                    {
                        notifbox_title(title),
                        notifbox_message(message),
                        layout = wibox.layout.fixed.vertical,
                    },
                    notifbox_actions(notif),
                },
            },
            margins = dpi(10),
            widget = wibox.container.margin,
        },
        bg = bgcolor,
        shape = function(cr, width, height)
            gears.shape.partially_rounded_rect(cr, width, height, true, true, true, true, beautiful.modal_radius)
        end,
        widget = wibox.container.background,
    })

    -- Put the generated template to a container
    local notifbox = wibox.widget({
        notifbox_template,
        shape = function(cr, width, height)
            gears.shape.partially_rounded_rect(cr, width, height, true, true, true, true, beautiful.groups_radius)
        end,
        widget = wibox.container.background,
        bg = beautiful.bg_focus,
    })

    -- Delete notification box
    local notifbox_delete = function()
        notifbox_layout:remove_widgets(notifbox, true)
    end

    -- Delete notifbox on Righ-Click(RMB)
    notifbox:buttons(awful.util.table.join(awful.button({}, 3, function()
        if #notifbox_layout.children == 1 then
            reset_notifbox_layout()
        else
            notifbox_delete()
        end
        collectgarbage("collect")
    end)))

    -- Delete notifbox with dissmiss icons on Left-Click(LMB)
    notifbox_dismiss:buttons(awful.util.table.join(awful.button({}, 1, function()
        if #notifbox_layout.children == 1 then
            reset_notifbox_layout()
        else
            notifbox_delete()
        end
        collectgarbage("collect")
    end)))

    -- Add hover, and mouse leave events
    notifbox_template:connect_signal("mouse::enter", function()
        notifbox.bg = beautiful.bg_urgent
        notifbox_timepop.visible = false
        notifbox_dismiss.visible = true
    end)

    notifbox_template:connect_signal("mouse::leave", function()
        notifbox.bg = beautiful.bg_focus
        notifbox_timepop.visible = true
        notifbox_dismiss.visible = false
    end)

    collectgarbage("collect")

    return notifbox
end

-- Connect to naughty
naughty.connect_signal("request::display", function(n)
    -- If notifbox_layout has a child and remove_notifbox_empty
    if #notifbox_layout.children == 1 and remove_notifbox_empty then
        -- Reset layout
        notifbox_layout:reset(notifbox_layout)
        remove_notifbox_empty = false
    end

    -- Set background color based on urgency level
    local notifbox_color = beautiful.notifbox_bg
    if n.urgency == "critical" then
        notifbox_color = n.bg .. "66"
    end

    -- Check if there's an icon
    local appicon = n.icon
    if not appicon then
        appicon = PATH_TO_ICONS .. "new-notif" .. ".svg"
    end

    -- For Notification Center
    if panel_visible or dont_disturb then
        naughty.destroy_all_notifications(nil, 1)
    else
        -- Add Sound fx to notif
        -- Depends: canberra-gtk-play
        awful.spawn("canberra-gtk-play -i message", false)
    end

    -- Throw data from naughty to notifbox_layout
    -- Generates notifbox
    local name = n.app_name
    if not (name:match("volume") or name:match("brightness") or name:match("battery")) then
        notifbox_layout:insert(1, notifbox_box(n, appicon, n.title, n.message, name, notifbox_color))
    end
end)

return notifbox_layout
