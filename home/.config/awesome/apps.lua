-- local gears = require("gears")
local awful = require("awful")
-- local wibox = require("wibox")
local naughty = require("naughty")
-- local beautiful = require("beautiful")
local helpers = require("helpers")
local icons = require("icons")
local notifications = require("notifications")

local script_dir = os.getenv("HOME") .. "/.local/script/"

local apps = {}

apps.clipboard = "env CM_HISTLENGTH=20 CM_LAUNCHER=rofi clipmenu"

apps.rofi = {
    center      = script_dir .. "rofi_center",
    app_menu    = script_dir .. "rofi_app_menu",
    global_menu = script_dir .. "rofi_global_menu",
    edit        = script_dir .. "rofi_edit",
    shot        = script_dir .. "rofi_shot",
    todo        = script_dir .. "rofi_todo",
    translate   = script_dir .. "rofi_translate -i",
}

apps.controller = {
    -- Volume Control
    vol_up   = script_dir .. "volume-controller up",
    vol_down = script_dir .. "volume-controller down",
    vol_mute = script_dir .. "volume-controller mute",
    -- Brightness Control
    bn_up   = script_dir .. "brightness-controller up",
    bn_down = script_dir .. "brightness-controller down",
    bn_opt  = script_dir .. "brightness-controller optimize",
    -- Music Control
    mus_n = script_dir .. "music-controller next",
    mus_p = script_dir .. "music-controller prev",
    mus_t = script_dir .. "music-controller toggle",
    mus_s = script_dir .. "music-controller stop",
    mus_c = script_dir .. "music-controller current",
    -- Shot
    shot        = script_dir .. "shot save",
    shot_clip   = script_dir .. "shot clipboard",
    shot_active = script_dir .. "shot active",
    shot_sleep  = script_dir .. "shot sleep",
    shot_select = script_dir .. "shot select"
}

apps.browser = function ()
    awful.spawn(user.browser, { switchtotag = true })
end
apps.file_manager = function ()
    awful.spawn(user.file_manager, { floating = true })
end
apps.telegram = function ()
    helpers.run_or_raise({class = 'TelegramDesktop'}, false, "telegram", { switchtotag = true })
end

apps.mail = function ()
    helpers.run_or_raise({instance = 'email'}, false, user.email_client, {switchtotag = true})
end

apps.gimp = function ()
    helpers.run_or_raise({class = 'Gimp'}, false, "gimp")
end

apps.steam = function ()
    helpers.run_or_raise({class = 'Steam'}, false, "steam")
end

apps.youtube = function ()
    awful.spawn.with_shell("ytfzf -fDH")
end

apps.network = function ()
    awful.spawn.with_shell(script_dir .. "rofi_network_manager")
end

apps.password = function ()
    awful.spawn.with_shell(script_dir .. "rofi_pass")
end

apps.volume = function ()
    helpers.run_or_raise({class = 'Pavucontrol'}, true, "pavucontrol")
end

apps.editor = function ()
    helpers.run_or_raise({instance = 'editor'}, false, user.editor, { switchtotag = true })
end

-- Toggle compositor
apps.compositor = function ()
    awful.spawn.with_shell("sh -c 'pgrep picom > /dev/null && pkill picom || picom --experimental-backends --config ~/.config/picom/picom.conf & disown'")
end

local night_mode_notif
apps.night_mode = function ()
    local cmd = "pgrep redshift > /dev/null && (pkill redshift && echo 'OFF') || (echo 'ON' && redshift -l 0:0 -t 3700:3700 -r &>/dev/null &)"
    awful.spawn.easy_async_with_shell(cmd, function(out)
        local message = out:match('ON') and "Activated!" or "Deactivated!"
        night_mode_notif = notifications.notify_dwim({ title = "Night mode", message = message, app_name = "night_mode", icon = icons.image.redshift }, night_mode_notif)
    end)
end

local screenkey_notif
apps.screenkey = function ()
    local cmd = "pgrep screenkey > /dev/null && (pkill screenkey && echo 'OFF') || (echo 'ON' && screenkey --ignore Caps_Lock --bg-color '#FFFFFF' --font-color '#000000' &>/dev/null &)"
    awful.spawn.easy_async_with_shell(cmd, function(out)
        local message = out:match('ON') and "Activated!" or "Deactivated!"
        screenkey_notif = notifications.notify_dwim({ title = "Screenkey", message = message, app_name = "screenkey", icon = icons.image.keyboard }, screenkey_notif)
    end)
end

apps.record = function ()
    awful.spawn.with_shell("screenrec.sh")
end

apps.music = function ()
    helpers.scratchpad({instance = "music"}, user.music_client, { floating = true })
end

apps.process_monitor = function ()
    helpers.run_or_raise({instance = 'htop'}, false, user.terminal.." --class htop -e htop", { switchtotag = true })
end

apps.process_monitor_gui = function ()
    helpers.run_or_raise({class = 'Lxtask'}, false, "lxtask")
end

apps.temperature_monitor = function ()
    helpers.run_or_raise({instance = 'sensors'}, false, user.terminal.." --name sensors -e watch sensors", { floating = true })
end

apps.battery_monitor = function ()
    helpers.run_or_raise({instance = 'battop'}, false, user.terminal.." --name battop -e battop", { floating = true })
end

apps.markdown_input = function ()
    helpers.scratchpad(
        { instance = "markdown_input" },
        user.terminal.." --name markdown_input -e nvim -c 'startinsert' /tmp/scratchpad.md",
        { floating = true })
end

-- Scratchpad terminal with tmux (see bin/scratchpad)
apps.scratchpad = function()
    helpers.scratchpad({instance = "scratchpad"}, "scratchpad", { floating = true })
end

-- Screenshots
local capture_notif = nil
local screenshot_notification_app_name = "screenshot"
function apps.screenshot(action, delay)
    -- Read-only actions
    if action == "browse" then
        awful.spawn.with_shell("cd "..user.dirs.screenshots.." && sxiv $(ls -t)")
        return
    elseif action == "gimp" then
        awful.spawn.with_shell("cd "..user.dirs.screenshots.." && gimp $(ls -t | head -n1)")
        naughty.notification({ message = "Opening last screenshot with GIMP", icon = icon, app_name = screenshot_notification_app_name})
        return
    end

    -- Screenshot capturing actions
    local cmd
    local timestamp = os.date("%Y.%m.%d-%H.%M.%S")
    local filename = user.dirs.screenshots.."/"..timestamp..".screenshot.png"
    local maim_args = "-u -b 3 -m 5"
    local icon = icons.image.screenshot

    local prefix
    if delay then
        prefix = "sleep "..tostring(delay).." && "
    else
        prefix = ""
    end

    -- Configure action buttons for the notification
    local screenshot_open = naughty.action { name = "Open" }
    local screenshot_copy = naughty.action { name = "Copy" }
    local screenshot_edit = naughty.action { name = "Edit" }
    local screenshot_delete = naughty.action { name = "Delete" }
    screenshot_open:connect_signal('invoked', function()
        awful.spawn.with_shell("cd "..user.dirs.screenshots.." && sxiv $(ls -t)")
    end)
    screenshot_copy:connect_signal('invoked', function()
        awful.spawn.with_shell("xclip -selection clipboard -t image/png "..filename.." &>/dev/null")
    end)
    screenshot_edit:connect_signal('invoked', function()
        awful.spawn.with_shell("gimp "..filename.." >/dev/null")
    end)
    screenshot_delete:connect_signal('invoked', function()
        awful.spawn.with_shell("rm "..filename)
    end)

    if action == "full" then
        cmd = prefix.."maim "..maim_args.." "..filename
        awful.spawn.easy_async_with_shell(cmd, function()
            naughty.notification({
                title = "Screenshot",
                message = "Screenshot taken",
                icon = icon,
                actions = { screenshot_open, screenshot_copy, screenshot_edit, screenshot_delete },
                app_name = screenshot_notification_app_name,
            })
        end)
    elseif action == "selection" then
        cmd = "maim "..maim_args.." -s "..filename
        capture_notif = naughty.notification({ title = "Screenshot", message = "Select area to capture.", icon = icon, timeout = 1, app_name = screenshot_notification_app_name })
        awful.spawn.easy_async_with_shell(cmd, function(_, __, ___, exit_code)
            naughty.destroy(capture_notif)
            if exit_code == 0 then
                naughty.notification({
                    title = "Screenshot",
                    message = "Selection captured",
                    icon = icon,
                    actions = { screenshot_open, screenshot_copy, screenshot_edit, screenshot_delete },
                    app_name = screenshot_notification_app_name,
                })
            end
        end)
    elseif action == "clipboard" then
        capture_notif = naughty.notification({ title = "Screenshot", message = "Select area to copy to clipboard", icon = icon })
        cmd = "maim "..maim_args.." -s /tmp/maim_clipboard && xclip -selection clipboard -t image/png /tmp/maim_clipboard &>/dev/null && rm /tmp/maim_clipboard"
        awful.spawn.easy_async_with_shell(cmd, function(_, __, ___, exit_code)
            if exit_code == 0 then
                capture_notif = notifications.notify_dwim({ title = "Screenshot", message = "Copied selection to clipboard", icon = icon, app_name = screenshot_notification_app_name }, capture_notif)
            else
                naughty.destroy(capture_notif)
            end
        end)
    end

end

return apps
