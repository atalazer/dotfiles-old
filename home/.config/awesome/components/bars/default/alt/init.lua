local awful = require('awful')
local top_panel = require('bars.default.top')

awful.screen.connect_for_each_screen(
function(s)
    if s.index == 1 then
        s.top_panel = top_panel(s)
    end
end
)

function updateBarsVisibility()
    for s in screen do
        if s.selected_tag then
            local fullscreen = s.selected_tag.fullscreenMode
            s.top_panel.visible = not fullscreen
        end
    end
end

_G.tag.connect_signal(
'property::selected',
function(t)
    updateBarsVisibility()
end
)

_G.client.connect_signal(
'property::fullscreen',
function(c)
    c.screen.selected_tag.fullscreenMode = c.fullscreen
    updateBarsVisibility()
end
)

_G.client.connect_signal(
'unmanage',
function(c)
    if c.fullscreen then
        c.screen.selected_tag.fullscreenMode = false
        updateBarsVisibility()
    end
end
)
