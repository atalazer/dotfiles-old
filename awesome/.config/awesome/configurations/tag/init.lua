local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local ruled = require("ruled")

local icons = require(P.config.tag .. ".icons.init")
local apps = require(P.config.apps)

RC.settings.tags = {
    icon = {
        -- If disable will use tag name
        enable = false,
        -- Use icons and tag name together if false
        icon_only = true,
    },
    -- 1 = Text     ; 2 = Bullet Number + Text  ; 3 = Japanese Number
    name = 3,
    gap_single_client = true,
}

RC.tags = {
    {
        type = "terminals",
        name = { "Term", "❶ Term", "一" },
        icon = icons.terminal,
        default_app = apps.default.terminal,
        gap = beautiful.useless_gap,
        layout = awful.layout.suit.tile,
        layouts = {
            awful.layout.suit.tile,
            awful.layout.suit.fair,
            awful.layout.suit.spiral.dwindle,
            awful.layout.suit.floating,
        },
    },
    {
        type = "internet",
        name = { "Inet", "❷ Inet", "二" },
        icon = icons.web_browser,
        default_app = apps.default.web_browser,
        layout = awful.layout.suit.max,
    },
    {
        type = "files",
        name = { "Files", "❸ Files", "三" },
        icon = icons.file_manager,
        default_app = apps.default.file_manager,
        layout = awful.layout.suit.floating,
    },
    {
        type = "-",
        name = { "----", " ----", "四" },
        icon = icons.terminal,
    },
    {
        type = "-",
        name = { "----", " ----", "五" },
        icon = icons.terminal,
    },
    {
        type = "-",
        name = { "----", " ----", "六" },
        icon = icons.terminal,
    },
}

-- Set tags layout
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.floating,
        -- awful.layout.suit.tile,
        -- awful.layout.suit.tile.left,
        -- awful.layout.suit.tile.bottom,
        -- awful.layout.suit.tile.top,
        awful.layout.suit.fair,
        -- awful.layout.suit.fair.horizontal,
        -- awful.layout.suit.spiral,
        -- awful.layout.suit.spiral.dwindle,
        awful.layout.suit.max,
        -- awful.layout.suit.max.fullscreen,
        -- awful.layout.suit.magnifier,
        -- awful.layout.suit.corner.nw,
        -- awful.layout.suit.corner.ne,
        -- awful.layout.suit.corner.sw,
        -- awful.layout.suit.corner.se,
    })
end)

-- Create tags for each screen
screen.connect_signal("request::desktop_decoration", function(s)

    if RC.settings.tags.icon.enable == true then
        for i, tag in pairs(RC.tags) do
            awful.tag.add(i, {
                name = tag.name[RC.settings.tags.name] or tag.name[1],
                icon = tag.icon or icons.close,
                icon_only = RC.settings.tags.icon.icon_only or true,
                layout = tag.layout or awful.layout.suit.floating,
                layouts = tag.layouts or awful.layout.layouts,
                gap_single_client = RC.settings.tags.gap_single_client or true,
                gap = tag.gap,
                screen = s,
                default_app = tag.default_app or apps.default.terminal,
                selected = i == 1,
            })
        end
    elseif RC.settings.tags.icon.enable == false then
        for i, tag in pairs(RC.tags) do
            awful.tag.add(i, {
                name = tag.name[RC.settings.tags.name] or tag.name[1],
                layout = tag.layout or awful.layout.suit.floating,
                layouts = tag.layouts or awful.layout.layouts,
                gap_single_client = RC.settings.tags.gap_single_client or true,
                gap = tag.gap,
                screen = s,
                default_app = tag.default_app or apps.default.terminal,
                selected = i == 1,
            })
        end
    else
        awful.tag(
            { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
            s,
            awful.layout.floating
        )
    end
end)

local update_gap_and_shape = function(t)
    -- Get current tag layout
    local current_layout = awful.tag.getproperty(t, "layout")
    -- If the current layout is awful.layout.suit.max
    if (current_layout == awful.layout.suit.max) then
        -- Set clients gap to 0 and shape to rectangle if maximized
        t.gap = 0
        for _, c in ipairs(t:clients()) do
            if not c.floating or not c.round_corners or c.maximized or c.fullscreen then
                c.shape = beautiful.client_shape_rectangle
            else
                c.shape = beautiful.client_shape_rounded
            end
        end
    else
        t.gap = beautiful.useless_gap
        for _, c in ipairs(t:clients()) do
            if not c.round_corners or c.maximized or c.fullscreen then
                c.shape = beautiful.client_shape_rectangle
            else
                c.shape = beautiful.client_shape_rounded
            end
        end
    end
end

-- Change tag's client's shape and gap on change
tag.connect_signal("property::layout", function(t)
    update_gap_and_shape(t)
end)

-- Change tag's client's shape and gap on move to tag
tag.connect_signal("tagged", function(t)
    update_gap_and_shape(t)
end)

-- Focus on urgent clients
awful.tag.attached_connect_signal(s, "property::selected", function()
    local urgent_clients = function(c)
        return awful.rules.match(c, { urgent = true })
    end
    for c in awful.client.iterate(urgent_clients) do
        if c.first_tag == mouse.screen.selected_tag then
            c:emit_signal("request::activate")
            c:raise()
        end
    end
end)
