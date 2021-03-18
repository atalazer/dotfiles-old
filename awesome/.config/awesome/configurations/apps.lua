local filesystem = require('gears.filesystem')
local config_dir = filesystem.get_configuration_dir()

local utils_dir = config_dir .. 'utils/'
local controller_dir = {
    music      = config_dir .. 'utils/music/',
    brightness = config_dir .. 'utils/',
    volume     = config_dir .. 'utils/',
    vk         = config_dir .. 'utils/',
}

RC.apps = {
    default = {
        terminal       = os.getenv("TERMINAL") or "alacritty",
        terminal_float = "kitty --class Float",
        terminal_quake = "kitty --name QuakeTerminal",
        t_editor       = "nvim",
        editor         = "subl",
        t_file_manager = "kitty --class Files -e nnn",
        file_manager   = "nemo",
        t_music        = "kitty --class Music -e ncmpcpp-ueberzug",
        web_browser    = "firefox",
        office         = 'GTK_THEME=Adwaita:light libreoffice',
        multimedia     = "mpv",
        graphics       = "GTK_THEME=Adwaita:light inkscape",
        game           = "opsu",
        lock           = 'awesome-client "_G.show_lockscreen()"',
    },
    rofi = {
        drun      = 'j4-dmenu-desktop dmenu="rofi -show drun -modi drun"',
        calc      = 'rofi -show calc -modi calc -no-show-match -no-sort',
        clipboard = 'rofi -modi "clipboard:greenclip print" -show clipboard -run-command \'{cmd}\'',
        rofi_global = 'rofi ' .. 
            ' -show "Global Search" -modi "Global Search":' .. 
            '~/.config/rofi/global/rofi-spotlight.sh' .. 
            ' -theme ' ..
            '~/.config/rofi/global/rofi.rasi',
        rofi_appmenu = 'rofi ' ..
            ' -show drun -theme ' ..
            '~/.config/rofi/appmenu/rofi.rasi',
    },
    controller = {
        -- Volume Control
        vol_up      = controller_dir.volume .. "volume-controller up",
        vol_down    = controller_dir.volume .. "volume-controller down",
        vol_mute    = controller_dir.volume .. "volume-controller mute",
        -- Brightness Control
        bn_up       = controller_dir.brightness .. "brightness-controller up",
        bn_down     = controller_dir.brightness .. "brightness-controller down",
        bn_opt      = controller_dir.brightness .. "brightness-controller optimize",
        -- Music Control
        mus_n       = controller_dir.music .. "music-controller next",
        mus_p       = controller_dir.music .. "music-controller prev",
        mus_t       = controller_dir.music .. "music-controller toggle",
        mus_s       = controller_dir.music .. "music-controller stop",
        mus_c       = controller_dir.music .. "music-controller current",
        -- Keyboard Control
        vk_show = controller_dir.vk .. 'florence-toggle toggle' or controller_dir.vk .. 'florence-toggle show',
        vk_hide = controller_dir.vk .. 'florence-toggle toggle' or controller_dir.vk .. 'florence-toggle hide',
    },
    utils = {
        -- Fullscreen screenshot
        full_screenshot = utils_dir .. 'snap full',
        -- Area screenshot
        area_screenshot = utils_dir .. 'snap area',
        -- Update profile picture
        update_profile  = utils_dir .. 'profile-image'
    }
}

return RC.apps
