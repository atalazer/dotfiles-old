-- Stole from https://github.com/hhn-pham/dotfiles/blob/main/.config/nvim/lua/configs/alpha.lua

local alpha = require("alpha")

local header = {
    type = "text",
    val = {
        " ⠀⠀⠀⠀⣠⣶⡾⠏⠉⠙⠳⢦⡀⠀⠀⠀⢠⠞⠉⠙⠲⡀⠀ ",
        " ⠀⠀⠀⣴⠿⠏⠀⠀⠀⠀⠀⠀⢳⡀⠀⡏⠀⠀⠀⠀⠀⢷  ",
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

local footer = {
    type = "text",
    val = "Atalazer",
    opts = {
        position = "center",
        hl = "AlphaFooter",
    },
}

local function button(sc, txt, keybind)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
        position = "center",
        text = txt,
        shortcut = sc,
        cursor = 5,
        width = 24,
        align_shortcut = "right",
        hl_shortcut = "AlphaShortcut",
        hl_text = "AlphaText",
    }
    if keybind then
        opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
    end

    return {
        type = "button",
        val = txt,
        on_press = function()
            local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
            vim.api.nvim_feedkeys(key, "normal", false)
        end,
        opts = opts,
    }
end

local buttons = {
    type = "group",
    val = {
        button("CTRL p  ", "  Find File   ", ":Telescope find_files<CR>"),
        button("SPC  f o", "  Recents     ", ":Telescope oldfiles<CR>"),
        button("SPC  f d", "  Bookmarks   ", ":Telescope marks<CR>"),
        button("        ", "  Session     ", ":lua require('persistence').load({ last = true })<CR>"),
    },
    opts = {
        spacing = 1,
    },
}

local section = {
    header = header,
    buttons = buttons,
    footer = footer,
}

local opts = {
    layout = {
        { type = "padding", val = 2 },
        section.header,
        { type = "padding", val = 3 },
        section.buttons,
        { type = "padding", val = 4 },
        section.footer,
    },
    opts = {
        margin = 5,
    },
}
alpha.setup(opts)
