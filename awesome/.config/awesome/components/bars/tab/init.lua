local awful = require("awful")

local tbar = require(P.appearance.bars.."."..RC.appearance.bar..".top")
local bbar = require(P.appearance.bars.."."..RC.appearance.bar..".bottom")

awful.screen.connect_for_each_screen(
    function(s)
        tbar.bar(s)
        bbar.bar(s)
    end
)
-- }}}
