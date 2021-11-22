-- Stole from https://github.com/hhn-pham/dotfiles/blob/main/.config/nvim/lua/configs/alpha.lua

local alpha = require("alpha")
local telescope_exist, telescope = pcall(require, "telescope")
local fzf_exist, fzf = pcall(require, "fzf-lua")

local section = {}

-- string(for vim command) or function
local cmd = {}
cmd.find_files = ""
cmd.recent_files = ""
cmd.frecency = ""
cmd.marks = ""
cmd.last_session = Util.session.last
cmd.quit = "Sayonara"

if telescope_exist then
    cmd.find_files = "Telescope files"
    cmd.recent_files = "Telescope oldfiles"
    cmd.frecency = "Telescope frecency"
    cmd.marks = "Telescope marks"
else
    cmd.find_files = "FzfLua files"
    cmd.recent_files = "FzfLua oldfiles"
    cmd.frecency = "FzfLua oldfiles"
    cmd.marks = "FzfLua marks"
end

section.header = {
    type = "text",
    val = {
        " ⠀⠀⠀⠀⣠⣶⡾⠏⠉⠙⠳⢦⡀⠀⠀⠀⢠⠞⠉⠙⠲⡀⠀ ",
        " ⠀⠀⠀⣴⠿⠏⠀⠀⠀⠀⠀⠀⢳⡀⠀ ⡏⠀⠀⠀⠀⢷  ",
        " ⠀⠀⢠⣟⣋⡀⢀⣀⣀⡀⠀⣀⡀⣧⠀⢸⠀⠀⠀⠀⠀ ⡇ ",
        " ⠀⠀⢸⣯⡭⠁⠸⣛⣟⠆⡴⣻⡲⣿⠀⣸⠀⠀OK⠀ ⡇ ",
        " ⠀⠀⣟⣿⡭⠀⠀⠀⠀⠀⢱⠀⠀⣿⠀⢹⠀⠀⠀⠀⠀ ⡇ ",
        " ⠀⠀⠙⢿⣯⠄⠀⠀⠀⢀⡀⠀⠀⡿⠀⠀⡇⠀⠀⠀⠀⡼  ",
        " ⠀⠀⠀⠀⠹⣶⠆⠀⠀⠀⠀⠀⡴⠃⠀⠀⠘⠤⣄⣠⠞⠀  ",
        "  ⠀⠀⠀⠀⢸⣷⡦⢤⡤⢤⣞⣁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
        "  ⠀⢀⣤⣴⣿⣏⠁⠀⠀⠸⣏⢯⣷⣖⣦⡀⠀⠀⠀⠀⠀⠀ ",
        " ⢀⣾⣽⣿⣿⣿⣿⠛⢲⣶⣾⢉⡷⣿⣿⠵⣿⠀⠀⠀⠀⠀⠀ ",
        " ⣼⣿⠍⠉⣿⡭⠉⠙⢺⣇⣼⡏⠀⠀⠀⣄⢸⠀⠀⠀⠀⠀⠀ ",
        " ⣿⣿⣧⣀⣿.........⣀⣰⣏⣘⣆⣀    ",
    },
    opts = {
        position = "center",
        hl = "AlphaHeader",
    },
}

section.footer = {
    type = "text",
    val = "Atalazer",
    opts = {
        position = "center",
        hl = "AlphaFooter",
    },
}

local function button(shortcut, text, command)
    local opts = {
        position = "center",
        text = text,
        shortcut = shortcut,
        cursor = 5,
        width = 50,
        align_shortcut = "right",
        hl_shortcut = "AlphaShortcut",
        hl_text = "AlphaText",
    }

    return {
        type = "button",
        val = text,
        on_press = function()
            if type(command) == "function" then
                command()
            else
                vim.cmd(command)
            end
        end,
        opts = opts,
    }
end

section.buttons = {
    type = "group",
    val = {
        button("CTRL p",    "  Find File", cmd.find_files),
        button("SPC f o",   "  Recents",   cmd.recent_files),
        button("SPC f f",   "  Frecency",  cmd.frecency ),
        button("SPC f d",   "  Bookmarks", cmd.marks),
        button("F1",        "  Session",   cmd.last_session),
        button("",          "  Quit",      cmd.quit)
    },
    opts = { spacing = 1 },
}

alpha.setup({
    layout = {
        { type = "padding", val = 2 },
        section.header,
        { type = "padding", val = 3 },
        section.buttons,
        { type = "padding", val = 4 },
        section.footer,
    },
    opts = { margin = 3 },
})
