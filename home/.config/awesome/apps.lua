-- local gears = require("gears")
local awful = require("awful")
-- local wibox = require("wibox")
-- local beautiful = require("beautiful")
local helpers = require("helpers")
local icons = require("icons")
local notifications = require("notifications")

local script_dir = os.getenv("HOME") .. "/.local/script/"

local apps = {}

apps.clipboard = "env CM_HISTLENGTH=20 CM_LAUNCHER=rofi clipmenu"

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
    shot_select = script_dir .. "shot select",
}

apps.rofi = {
    center      = script_dir .. "rofi_center",
    app_menu    = script_dir .. "rofi_app_menu",
    global_menu = script_dir .. "rofi_global_menu",
    edit        = script_dir .. "rofi_edit",
    network     = script_dir .. "rofi_network_manager",
    pass        = script_dir .. "rofi_pass",
    record      = script_dir .. "rofi_record",
    shot        = script_dir .. "rofi_shot",
    todo        = script_dir .. "rofi_todo",
    translate   = script_dir .. "rofi_translate -i",
    youtube     = script_dir .. "rofi_youtube",
}

apps.browser = function()
    awful.spawn(user.browser, { switchtotag = true })
end

apps.file_manager = function()
    awful.spawn(user.file_manager, { floating = true })
end

apps.office = function()
    helpers.run_or_raise(
        { instance = "libreoffice" },
        false,
        "env GTK_THEME=Adwaita:light libreoffice"
    )
end

apps.mail = function()
    helpers.run_or_raise({ instance = "email" }, false, user.email_client, { switchtotag = true })
end

apps.network = function()
    awful.spawn.with_shell(apps.rofi.network)
end

apps.password = function()
    awful.spawn.with_shell(apps.rofi.pass)
end

apps.youtube = function()
    awful.spawn.with_shell(apps.rofi.youtube)
end

apps.editor = function()
    helpers.run_or_raise({ instance = "editor" }, false, user.editor, { switchtotag = true })
end

apps.music = function()
    helpers.scratchpad({ instance = "music" }, user.music_client, { floating = true })
end

-- Scratchpad terminal with tmux (see bin/scratchpad)
apps.scratchpad = function()
    helpers.scratchpad({ instance = "scratchpad" }, "scratchpad", { floating = true })
end

apps.markdown_input = function()
    helpers.scratchpad(
        { instance = "markdown_input" },
        user.terminal .. " --name markdown_input -e nvim -c 'startinsert' /tmp/scratchpad.md",
        { floating = true }
    )
end

apps.process_monitor = function()
    helpers.run_or_raise(
        { instance = "htop" },
        false,
        user.terminal .. " --name htop -e htop",
        { switchtotag = true }
    )
end

-- Toggle compositor
apps.compositor = function()
    awful.spawn.with_shell("sh -c 'pgrep picom > /dev/null && pkill picom || picom --experimental-backends --config ~/.config/picom/picom.conf & disown'")
end

local night_mode_notif
apps.night_mode = function()
    local cmd =
        "pgrep redshift > /dev/null && (pkill redshift && echo 'OFF') || (echo 'ON' && redshift -l 0:0 -t 3700:3700 -r &>/dev/null &)"
    awful.spawn.easy_async_with_shell(cmd, function(out)
        local message = out:match("ON") and "Activated!" or "Deactivated!"
        night_mode_notif = notifications.notify_dwim({
            title = "Night mode",
            message = message,
            app_name = "night_mode",
            icon = icons.image.redshift,
        }, night_mode_notif)
    end)
end

return apps
