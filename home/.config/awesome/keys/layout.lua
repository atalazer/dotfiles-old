local awful = require("awful")
local gears = require("gears")

local helpers = require("helpers")

local keys = gears.table.join(
    -- Gaps
    awful.key({ superkey, shiftkey }, "minus", function()
        awful.tag.incgap(5, nil)
    end, {
        description = "increment gaps size for the current tag",
        group = "gaps",
    }),
    awful.key({ superkey }, "minus", function()
        awful.tag.incgap(-5, nil)
    end, {
        description = "decrement gap size for the current tag",
        group = "gaps",
    }),

    -- Resize focused client or layout factor
    awful.key({ superkey, shiftkey }, "Down", function()
        helpers.resize_dwim(client.focus, "down")
    end, {
        description = "Resize Client",
        group = "layout",
    }),
    awful.key({ superkey, shiftkey }, "j", function()
        helpers.resize_dwim(client.focus, "down")
    end, {
        description = "Resize Client",
        group = "layout",
    }),

    awful.key({ superkey, shiftkey }, "Up", function()
        helpers.resize_dwim(client.focus, "up")
    end, {
        description = "Resize Client",
        group = "layout",
    }),
    awful.key({ superkey, shiftkey }, "k", function()
        helpers.resize_dwim(client.focus, "up")
    end, {
        description = "Resize Client",
        group = "layout",
    }),

    awful.key({ superkey, shiftkey }, "Left", function()
        helpers.resize_dwim(client.focus, "left")
    end, {
        description = "Resize Client",
        group = "layout",
    }),
    awful.key({ superkey, shiftkey }, "h", function()
        helpers.resize_dwim(client.focus, "left")
    end, {
        description = "Resize Client",
        group = "layout",
    }),

    awful.key({ superkey, shiftkey }, "Right", function()
        helpers.resize_dwim(client.focus, "right")
    end, {
        description = "Resize Client",
        group = "layout",
    }),
    awful.key({ superkey, shiftkey }, "l", function()
        helpers.resize_dwim(client.focus, "right")
    end, {
        description = "Resize Client",
        group = "layout",
    }),

    -- Number of master clients
    awful.key({ superkey, altkey }, "h", function()
        awful.tag.incnmaster(1, nil, true)
    end, {
        description = "increase the number of master clients",
        group = "layout",
    }),

    awful.key({ superkey, altkey }, "l", function()
        awful.tag.incnmaster(-1, nil, true)
    end, {
        description = "decrease the number of master clients",
        group = "layout",
    }),

    awful.key({ superkey, altkey }, "Left", function()
        awful.tag.incnmaster(1, nil, true)
    end, {
        description = "increase the number of master clients",
        group = "layout",
    }),

    awful.key({ superkey, altkey }, "Right", function()
        awful.tag.incnmaster(-1, nil, true)
    end, {
        description = "decrease the number of master clients",
        group = "layout",
    }),

    -- Number of columns
    awful.key({ superkey, altkey }, "k", function()
        awful.tag.incncol(1, nil, true)
    end, {
        description = "increase the number of columns",
        group = "layout",
    }),

    awful.key({ superkey, altkey }, "j", function()
        awful.tag.incncol(-1, nil, true)
    end, {
        description = "decrease the number of columns",
        group = "layout",
    }),

    awful.key({ superkey, altkey }, "Up", function()
        awful.tag.incncol(1, nil, true)
    end, {
        description = "increase the number of columns",
        group = "layout",
    }),

    awful.key({ superkey, altkey }, "Down", function()
        awful.tag.incncol(-1, nil, true)
    end, {
        description = "decrease the number of columns",
        group = "layout",
    }),

    awful.key({ superkey }, "space", function()
        awful.layout.inc(1)
    end, {
        description = "select next",
        group = "layout",
    }),

    awful.key({ superkey, shiftkey }, "space", function()
        awful.layout.inc(-1)
    end, {
        description = "select previous",
        group = "layout",
    })

)

return keys
