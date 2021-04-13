local menubar = require("menubar")
local filesystem = require("gears.filesystem")
local config_dir = filesystem.get_configuration_dir()

local utils_dir = config_dir .. "utils/"

RC.apps = {
    default = {
        terminal = os.getenv("TERMINAL") or "kitty",
        terminal_float = "kitty --class Float",
        terminal_quake = "kitty --name QuakeTerminal",
        terminal_lyrics = "kitty " .. "--config ~/.config/kitty/kitty-lyrics.conf --class lyricsQuake " .. "-e ncmpcpp -c ~/.config/ncmpcpp/lyrics.conf -s lyrics",
        t_editor = "nvim",
        editor = "subl",
        t_file_manager = "kitty --class Files -e nnn",
        file_manager = "nemo",
        t_music = "kitty --class Music -e ncmpcpp-ueberzug",
        web_browser = os.getenv("BROWSER") or "firefox",
        office = "GTK_THEME=Adwaita:light libreoffice",
        multimedia = "mpv",
        graphics = "GTK_THEME=Adwaita:light inkscape",
        game = "opsu",
        lock = os.getenv("LOCK_CMD") or "",
    },
    rofi = {
        drun            = "rofi -show drun -modi drun",
        calc            = "rofi -show calc -modi calc -no-show-match -no-sort",
        clipboard       = "env CM_LAUNCHER=rofi clipmenu",
        rofi_global     = "rofi " .. 
            " -show \"Global Search\" -modi \"Global Search\":" .. 
            "~/.config/rofi/global/rofi-spotlight.sh" .. 
            " -theme " .. 
            "~/.config/rofi/global/rofi.rasi",
        rofi_appmenu    = "rofi " .. 
            " -show drun -theme " .. 
            "~/.config/rofi/appmenu/rofi.rasi",
    },
    controller = {
        -- Volume Control
        vol_up = utils_dir .. "volume-controller up",
        vol_down = utils_dir .. "volume-controller down",
        vol_mute = utils_dir .. "volume-controller mute",
        -- Brightness Control
        bn_up = utils_dir .. "brightness-controller up",
        bn_down = utils_dir .. "brightness-controller down",
        bn_opt = utils_dir .. "brightness-controller optimize",
        -- Music Control
        mus_n = utils_dir .. "music/music-controller next",
        mus_p = utils_dir .. "music/music-controller prev",
        mus_t = utils_dir .. "music/music-controller toggle",
        mus_s = utils_dir .. "music/music-controller stop",
        mus_c = utils_dir .. "music/music-controller current",
        -- Shot
        shot = utils_dir .. "shot save",
        shot_clip = utils_dir .. "shot clipboard",
        shot_active = utils_dir .. "shot active",
        shot_sleep = utils_dir .. "shot sleep",
        shot_select = utils_dir .. "shot select",
        -- Keyboard Control
        vk_show = utils_dir .. "florence-toggle toggle" or utils_dir .. "florence-toggle show",
        vk_hide = utils_dir .. "florence-toggle toggle" or utils_dir .. "florence-toggle hide",
    },
    utils = {
        -- Fullscreen screenshot
        full_screenshot = utils_dir .. "snap full",
        -- Area screenshot
        area_screenshot = utils_dir .. "snap area",
        -- Update profile picture
        update_profile = utils_dir .. "profile-image",
    },
}
menubar.utils.terminal = RC.apps.default.terminal

return RC.apps
