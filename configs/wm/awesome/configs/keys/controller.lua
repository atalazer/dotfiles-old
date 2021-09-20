local gears = require("gears")
local l = require("configs.keys.lib")

local keys = gears.table.join(
    l.keys("Apps: Controller",{}, {
        -- Volume
        XF86AudioMute = { "volume-controller mute", "Toggle Mute" },
        XF86AudioRaiseVolume = { "volume-controller up", "Increase Volume" },
        XF86AudioLowerVolume = { "volume-controller down", "Decrease Volume" },
        -- Music
        XF86AudioStop = {"music-controller stop", "Stop Music"},
        XF86AudioPlay = {"music-controller toggle", "Toggle Play/Pause Music"},
        XF86AudioNext = {"music-controller next", "Play Next Song"},
        XF86AudioPrev = {"music-controller prev", "Play Previous Song"},
        -- Brightness
        XF86MonBrightnessUp = {"brightness-controller up", "Increase Brightness"},
        XF86MonBrightnessDown = {"brightness-controller down", "Decrease Brightness"}
    }),

    l.keys("Apps: Controller", { shiftkey }, {
        Print = { "shot select", "Shot Selected" }
    }),

    l.keys("Apps: Controller", { altkey }, {
        Print = { "shot active", "Shot Focused" }
    })

)

return keys
