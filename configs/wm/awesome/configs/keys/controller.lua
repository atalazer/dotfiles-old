local gears = require("gears")
local l = require("configs.keys.lib")

local keys = gears.table.join(
    l.keys("Apps: Controller",{}, {
        -- Volume
        XF86AudioMute = { "volumectl mute", "Toggle Mute" },
        XF86AudioRaiseVolume = { "volumectl up", "Increase Volume" },
        XF86AudioLowerVolume = { "volumectl down", "Decrease Volume" },
        -- Music
        XF86AudioStop = {"musicctl stop", "Stop Music"},
        XF86AudioPlay = {"musicctl toggle", "Toggle Play/Pause Music"},
        XF86AudioNext = {"musicctl next", "Play Next Song"},
        XF86AudioPrev = {"musicctl prev", "Play Previous Song"},
        -- Brightness
        XF86MonBrightnessUp = {"brightnessctl up", "Increase Brightness"},
        XF86MonBrightnessDown = {"brightnessctl down", "Decrease Brightness"}
    }),

    l.keys("Apps: Controller", { shiftkey }, {
        Print = { "shot select", "Shot Selected" }
    }),

    l.keys("Apps: Controller", { altkey }, {
        Print = { "shot active", "Shot Focused" }
    })

)

return keys
