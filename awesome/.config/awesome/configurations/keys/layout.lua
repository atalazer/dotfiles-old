local awful         = require('awful')
local gears         = require('gears')

local delta    = 20
-- ========================================= Layout manipulation
awful.keyboard.append_global_keybindings({
    awful.key({ W, S }, "-",   
        function () 
            awful.client.moveresize( delta/2,  delta/2, -delta, -delta) 
        end,
    {description = "Resize Client", group = "layout"}),

    awful.key({ W, S }, "=",
        function () 
            awful.client.moveresize(-delta/2, -delta/2,  delta,  delta) 
        end,
    {description = "Resize Client", group = "layout"}),

    awful.key({ W, S }, "Up",  
        function () 
            awful.client.moveresize( 0, 0, 0, -delta) 
        end,
    {description = "Resize client", group = "layout"}),
    
    awful.key({ W, S }, "Down",    
        function () 
          awful.client.moveresize( 0, 0, 0,  delta) 
      end,
    {description = "Resize client", group = "layout"}),
    
    awful.key({ W, S }, "Left",  
        function () 
            awful.client.moveresize( 0, 0, -delta, 0) 
        end,
    {description = "Resize client", group = "layout"}),
    
    awful.key({ W, S }, "Right", 
        function () 
            awful.client.moveresize( 0, 0,  delta, 0) 
        end,
    {description = "Resize client", group = "layout"}),
    
    awful.key({ W }, "l",     
        function () awful.tag.incmwfact( 0.05)          end,
    {description = "increase master width factor", group = "layout"}),
  
    awful.key({ W }, "h",     
        function () awful.tag.incmwfact(-0.05)          end,
    {description = "decrease master width factor", group = "layout"}),

    awful.key({ W, S }, "h",
      function () awful.tag.incnmaster( 1, nil, true) end,
    {description = "increase the number of master clients", group = "layout"}),
    
    awful.key({ W, S }, "l",     
        function () awful.tag.incnmaster(-1, nil, true) end,
    {description = "decrease the number of master clients", group = "layout"}),
  
    awful.key({ W, C }, "h",     
        function () awful.tag.incncol( 1, nil, true)    end,
    {description = "increase the number of columns", group = "layout"}),
  
    awful.key({ W, C }, "l",     
        function () awful.tag.incncol(-1, nil, true)    end,
    {description = "decrease the number of columns", group = "layout"}),
    
    awful.key({ W }, "space", 
        function () awful.layout.inc( 1)                end,
    {description = "select next", group = "layout"}),
    
    awful.key({ W, S }, "space", 
        function () awful.layout.inc(-1)                end,
    {description = "select previous", group = "layout"}),
})
