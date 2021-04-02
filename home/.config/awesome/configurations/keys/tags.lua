local awful         = require('awful')
local gears         = require('gears')
local collision_enabled = RC.settings.collision_enabled or false

-- ========================================= Tag Related
if  collision_enabled == true then
    require(P.module.collision)()
else
    awful.keyboard.append_global_keybindings({
        awful.key({ W, A, S }, "Left",
            function ()
                -- get current tag
                local t = client.focus and client.focus.first_tag or nil
                if t == nil then
                    return
                end
            -- get previous tag (modulo 9 excluding 0 to wrap from 1 to 9)
                local tag = client.focus.screen.tags[(t.index - 2) % 9 + 1]
                awful.client.movetotag(tag)
                awful.tag.viewprev()
            end,
        {description = "move client to previous tag and switch to it", group = "tag"}),

        awful.key({ W, A, S }, "Right",
            function ()
              -- get current tag
              local t = client.focus and client.focus.first_tag or nil
              if t == nil then
                return
              end
              -- get next tag (modulo 9 excluding 0 to wrap from 9 to 1)
              local tag = client.focus.screen.tags[(t.index % 9) + 1]
              awful.client.movetotag(tag)
              awful.tag.viewnext()
            end,
        {description = "move client to next tag and switch to it", group = "tag"}),

        awful.key({ W, A }, "Left",
        --awful.key({ W }, "Left",
            awful.tag.viewprev,
        {description = "view previous", group = "tag"}),

        awful.key({ W, A }, "Right",  
        --awful.key({ W }, "Right",  
            awful.tag.viewnext,
        {description = "view next", group = "tag"}),

    })
end

awful.keyboard.append_global_keybindings({
    -- restore previous tag
    awful.key({ W, C }, "Escape", 
        awful.tag.history.restore,
    {description = "go back", group = "tag"}),

   -- Gap control
   awful.key({W, A}, "-",
      function()
         awful.tag.incgap(5, nil)
      end,
      {description = "increment gaps size for the current tag", group = "gaps"}),

   awful.key({W, A}, "=",
      function()
         awful.tag.incgap(-5, nil)
      end,
      {description = "decrement gap size for the current tag", group = "gaps"}),

    -- Tag Move
    awful.key {
        modifiers   = { W },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers   = { W, C },
        keygroup    = "numrow",
        description = "toggle tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { W, S },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { W, A },
        keygroup    = "numrow",
        description = "toggle focused client on tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { W, C, A },
        keygroup    = "numpad",
        description = "select layout directly",
        group       = "layout",
        on_press    = function (index)
            local t = awful.screen.focused().selected_tag
            if t then
                t.layout = t.layouts[index] or t.layout
            end
        end,
    }
})
local function delete_tag()
    local t = awful.screen.focused().selected_tag
    if not t then return end
    t:delete()
end

local function add_tag()
    awful.tag.add("NewTag", {
        screen = awful.screen.focused(),
        layout = awful.layout.suit.floating }):view_only()
end

local function rename_tag()
    awful.prompt.run {
        prompt       = "New tag name: ",
        textbox      = awful.screen.focused().mypromptbox.widget,
        exe_callback = function(new_name)
            if not new_name or #new_name == 0 then return end

            local t = awful.screen.focused().selected_tag
            if t then
                t.name = new_name
            end
        end
    }
end

local function move_to_new_tag()
    local c = client.focus
    if not c then return end

    local t = awful.tag.add(c.class,{screen= c.screen })
    c:tags({t})
    t:view_only()
end

local function copy_tag()
    local t = awful.screen.focused().selected_tag
    if not t then return end

    local clients = t:clients()
    local t2 = awful.tag.add(t.name, awful.tag.getdata(t))
    t2:clients(clients)
    t2:view_only()
end

awful.keyboard.append_global_keybindings({
    
    awful.key({ W, A }, "a", 
        add_tag,
    {description = "Add a tag", group = "tag"}),
    
    awful.key({ W, A }, "d", 
        delete_tag,
    {description = "delete the current tag", group = "tag"}),
    
    awful.key({ W, A }, "s", 
        move_to_new_tag,
    {description = "add a tag with the focused client", group = "tag"}),
    
    awful.key({ W, A }, "c", 
        copy_tag,
    {description = "create a copy of the current tag", group = "tag"}),

    awful.key({ W, A }, "r", 
        rename_tag,
    {description = "rename the current tag", group = "tag"}),

})
