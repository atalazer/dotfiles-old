vim.cmd([[packadd vim-startify]])

vim.g.startify_enable_special = 0
vim.g.startify_session_dir = "~/.config/nvim/session"
vim.g.startify_fortune_use_unicode = 1
vim.g.startify_files_number = 10

vim.g.startify_lists = {
    { type = "bookmarks", header = { "Bookmarks" } },
    { type = "sessions", header = { "Session" } },
    --{ type = 'dir'      , header = {"Files From " .. vim.fn.getcwd() } },
    { type = "files", header = { "History" } },
    { type = "commands", header = { "Commands" } },
}

vim.g.startify_bookmarks = {
    { aw = "~/.config/awesome/rc.lua" },
    { ac = "~/.config/alacritty/alacritty.yml" },
    { df = "~/dotfiles/README.md"},
    { t = "~/.tmux.conf" },
    { v = "~/.config/nvim/init.lua" },
    { z = "~/.zshrc" },
}

vim.g.startify_commands = {
    { ch = ":checkhealth" },
    { h = ":help" },
    { pu = ":PackerUpdate" },
}

vim.g.startify_custom_header = {
    "                                                                                  ▟▙            ",
    "                                                                                  ▝▘            ",
    "                                          ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖",
    "                                          ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██",
    "                                          ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██",
    "                                          ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██",
    "                                          ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀",
}
-- vim.g.startify_custom_header = {
--     "                                                                    ▄                       ",
--     "                                                                   ▟█▙                      ",
--     "                                                                  ▟███▙                     ",
--     "                                                                 ▟█████▙                    ",
--     "                                                                ▟███████▙                   ",
--     "                                                               ▂▔▀▜██████▙                  ",
--     "                                                              ▟██▅▂▝▜█████▙                 ",
--     "                                                             ▟█████████████▙                ",
--     "                                                            ▟███████████████▙               ",
--     "                                                           ▟█████████████████▙              ",
--     "                                                          ▟███████████████████▙             ",
--     "                                                         ▟█████████▛▀▀▜████████▙            ",
--     "                                                        ▟████████▛      ▜███████▙           ",
--     "                                                       ▟█████████        ████████▙          ",
--     "                                                      ▟██████████        █████▆▅▄▃▂         ",
--     "                                                     ▟██████████▛        ▜█████████▙        ",
--     "                                                    ▟██████▀▀▀              ▀▀██████▙       ",
--     "                                                   ▟███▀▘                       ▝▀███▙      ",
--     "                                                  ▟▛▀                               ▀▜▙     ",
-- }

