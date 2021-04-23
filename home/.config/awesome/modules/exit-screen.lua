local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local apps = require(P.config.apps)

local rrect = function(radius)
    return function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, radius)
    end
end

local markup = function(content, opts)
    local fg = opts.fg or ""

    return string.format(
        "<span foreground="%s">%s</span>",
        fg, content
    )
end

local xrdb = beautiful.xresources.get_current_theme()
local x = {
    --  xrdb variable
    background = xrdb.background,
    foreground = xrdb.foreground,
    black   = xrdb.color0,
    red     = xrdb.color1,
    green   = xrdb.color2,
    yellow  = xrdb.color3,
    blue    = xrdb.color4,
    magenta = xrdb.color5,
    cyan    = xrdb.color6,
    white   = xrdb.color7,
    grey    = xrdb.color8,
    color9  = xrdb.color9,
    color10 = xrdb.color10,
    color11 = xrdb.color11,
    color12 = xrdb.color12,
    color13 = xrdb.color13,
    color14 = xrdb.color14,
    color15 = xrdb.color15,
}
-- Appearance
local icon_font          = "JetBrainsMono Nerd Font 30"
local poweroff_text_icon = "  "
local reboot_text_icon   = "  "
local suspend_text_icon  = "  "
local lock_text_icon     = "  "
local exit_text_icon     = "  "
local exitscreen_bg      = x.background .."44"

local button_bg   = x.black
local button_size = dpi(120)

-- Commands
local poweroff_command = function() awful.spawn.with_shell(os.getenv("SHUTDOWN_CMD") or "poweroff") end
local reboot_command   = function() awful.spawn.with_shell(os.getenv("REBOOT_CMD") or "reboot") end
local suspend_command  = function() awful.spawn.with_shell((os.getenv("SUSPEND_CMD") or "suspend") .. " && ".. apps.default.lock) end
local lock_command     = function() awful.spawn(apps.default.lock, false) end
local exit_command     = function() awesome.quit() end

local add_hover_cursor = function(widget, hover_cursor)
    local original_cursor = "left_ptr"

    widget:connect_signal("mouse::enter", function()
        local w = mouse.current_wibox
        if w then w.cursor = hover_cursor end
    end)

    widget:connect_signal("mouse::leave", function()
        local w = mouse.current_wibox
        if w then w.cursor = original_cursor end
    end)
end

-- Helper function that generates the clickable buttons
local create_button = function(symbol, hover_color, command)
    local icon = wibox.widget{
        forced_height = button_size,
        forced_width = button_size,
        align = "center",
        valign = "center",
        font = icon_font,
        text = symbol,
        widget = wibox.widget.textbox()
    }

    local button = wibox.widget{
        {nil, icon, expand = "none", layout = wibox.layout.align.horizontal},
        forced_height = button_size,
        forced_width = button_size,
        border_width = dpi(3),
        border_color = button_bg,
        shape = rrect(10),
        bg = button_bg,
        widget = wibox.container.background
    }

    -- Bind left click to run the command
    button:buttons(gears.table.join(
        awful.button({}, 1, function() command() end))
    )

    -- Change color on hover
    button:connect_signal("mouse::enter", function()
        icon.markup = markup(icon.text, { fg = hover_color })
        button.border_color = hover_color
    end)
    button:connect_signal("mouse::leave", function()
        icon.markup = markup(icon.text, { fg = x.foreground})
        button.border_color = button_bg
    end)

    -- Use helper function to change the cursor on hover
    add_hover_cursor(button, "hand1")

    return button
end

-- Create the buttons
local poweroff = create_button(poweroff_text_icon , x.red    , poweroff_command)
local reboot   = create_button(reboot_text_icon   , x.green  , reboot_command)
local suspend  = create_button(suspend_text_icon  , x.yellow , suspend_command)
local lock     = create_button(lock_text_icon     , x.yellow , lock_command)
local exit     = create_button(exit_text_icon     , x.red    , exit_command)

-- Create the exit screen wibox
local exit_screen = wibox({visible = false, ontop = true, type = "dock"})
awful.placement.maximize(exit_screen)

exit_screen.bg = beautiful.exit_screen_bg or exitscreen_bg or "#282828"
exit_screen.fg = beautiful.exit_screen_fg or beautiful.wibar_fg or "#ebdbb2"

local exit_screen_grabber
local exit_screen_hide = function()
    awful.keygrabber.stop(exit_screen_grabber)
    exit_screen.visible = false
end

local exit_screen_show = function()
    exit_screen_grabber = awful.keygrabber.run(
        function(_, key, event)
            -- Ignore case
            key = key:lower()

            if event == "release" then return end

            if key == 's' then
                suspend_command()
                exit_screen_hide()
            elseif key == 'e' then
                exit_command()
            elseif key == 'p' then
                poweroff_command()
            elseif key == 'r' then
                reboot_command()
            elseif key == 'l' then
                lock_command()
                exit_screen_hide()
            elseif key == 'escape' or key == 'q' or key == 'x' then
                exit_screen_hide()
            end
        end)
    exit_screen.visible = true
end

exit_screen:buttons(
    gears.table.join(
        awful.button({}, 1, function() exit_screen_hide() end),
        awful.button({}, 2, function() exit_screen_hide() end),
        awful.button({}, 3, function() exit_screen_hide() end)
    )
)

exit_screen:setup{
    nil,
    {
        nil,
        {
            poweroff,
            reboot,
            suspend,
            lock,
            exit,
            spacing = dpi(50),
            layout = wibox.layout.fixed.horizontal
        },
        expand = "none",
        layout = wibox.layout.align.horizontal
    },
    expand = "none",
    layout = wibox.layout.align.vertical
}

return exit_screen_show
