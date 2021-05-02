vim.cmd([[packadd emmet-vim]])

vim.g.user_emmet_mode = "a"
vim.g.user_emmet_install_global = 0

local _Key = require("astronauta.keymap")
local imap = _Key.imap

imap({ "<C-m>,", "<plug>(emmet-expand-abbr)" })
imap({ "<C-m>;", "<plug>(emmet-expand-word)" })
imap({ "<C-m>u", "<plug>(emmet-update-tag)" })
imap({ "<C-m>d", "<plug>(emmet-balance-tag-inward)" })
imap({ "<C-m>D", "<plug>(emmet-balance-tag-outward)" })
imap({ "<C-m>n", "<plug>(emmet-move-next)" })
imap({ "<C-m>N", "<plug>(emmet-move-prev)" })
imap({ "<C-m>i", "<plug>(emmet-image-size)" })
imap({ "<C-m>/", "<plug>(emmet-toggle-comment)" })
imap({ "<C-m>j", "<plug>(emmet-split-join-tag)" })
imap({ "<C-m>k", "<plug>(emmet-remove-tag)" })
imap({ "<C-m>a", "<plug>(emmet-anchorize-url)" })
imap({ "<C-m>A", "<plug>(emmet-anchorize-summary)" })
imap({ "<C-m>m", "<plug>(emmet-merge-lines)" })
imap({ "<C-m>c", "<plug>(emmet-code-pretty)" })

vim.g.user_emmet_settings = {
    html = {
        filters = "html",
        indentation = " ",
        expandos = {
            ol = "ol>li",
            list = "ul>li*3",
        },
        aliases = {
            bq = "blackquote",
            obj = "object",
            src = "source",
        },
        snippets = {
            ["!"] = table.concat({
                "<!DOCTYPE html>",
                "<html>",
                "\t<head>",
                "\t\t<title>${cursor}</title>",
                "\t\t<meta charset=\"utf-8\" />",
                "\t\t<meta name=\"viewport\" content=\"width=device-width,initial-scale=1.0\" />",
                "\t</head>",
                "\t<body>",
                "\t</body>",
                "</html>",
            }, "\n"),
        },
    },
}
