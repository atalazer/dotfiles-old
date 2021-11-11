local awful = require("awful")
local ruled = require("ruled")

-- Flaten table
-- Required for make rules
local function flatten(flattened, target)
    flattened = flattened or {}
    for _--[[ i --]], element in ipairs(target) do
        if type(element) == "table" then
            flatten(flattened, element)
        else
            table.insert(flattened, element)
        end
    end
    return flattened
end

local rule_tags = {
    ["1"] = {
        class = {},
        instance = { terminal_instance },
        name = {},
    },
    ["2"] = {
        class = { browser_class, chatting_class },
        instance = { browser_instance },
        name = {},
    },
    ["3"] = {
        class = { file_manager_class, image_editor_class, office_class, "Gucharmap", "mail" },
        instance = { office_instance, "mail" },
        name = { "Mozilla Firefox (Private Browsing)" },
    },
    ["4"] = {
        class = { game_class },
        instance = { game_instance },
        name = {},
    },
    ["5"] = {
        class = { "Steam" },
        instance = {},
        name = { "Steam" },
    },
}

ruled.client.connect_signal("request::rules", function()
    local function make_rules_for_tag(tag_number)
        ruled.client.append_rule({
            rule_any = {
                class = flatten({}, rule_tags[tag_number].class),
                instance = flatten({}, rule_tags[tag_number].instance),
                name = flatten({}, rule_tags[tag_number].name),
            },
            except_any = {
                role = { "GtkFileChooserDialog" },
                instance = { "Toolkit" },
                type = { "dialog" },
            },
            properties = {
                tag = awful.screen.focused().tags[tonumber(tag_number)].name,
                switch_to_tags = true,
            },
        })
    end

    for number, _ --[[ rules --]] in pairs(rule_tags) do
        make_rules_for_tag(number)
    end

end)
