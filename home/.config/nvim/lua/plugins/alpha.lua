-- Stole from https://github.com/hhn-pham/dotfiles/blob/main/.config/nvim/lua/configs/alpha.lua

local alpha = require("alpha")
local telescope = require("plugins.telescope")

local section = {}

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
    if command then
        opts.keymap = { "n", shortcut, command, { noremap = true, silent = true } }
    end

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
        button("CTRL p  ", "  Find File   ", "Telescope find_files"),
        button("SPC  f o", "  Recents     ", "Telescope oldfiles"),
        button("SPC  f f", "  Frecency    ", telescope.frecency ),
        button("SPC  f d", "  Bookmarks   ", "Telescope marks"),
        button("F1      ", "  Session     ", Util.session.last),
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


