vim.cmd([[packadd emmet-vim]])

vim.g.user_emmet_mode = "a"
vim.g.user_emmet_install_global = 0

-- vim.g.user_emmet_leader_key = "<C-m>"
-- vim.g.user_emmet_expandabbr_key = "<C-m>,"
-- vim.g.user_emmet_expandword_key = "<C-m>;"
-- vim.g.user_emmet_update_tag = "<C-m>u"
-- vim.g.user_emmet_balancetaginward_key = "<C-m>d"
-- vim.g.user_emmet_balancetagoutward_key = "<C-m>D"
-- vim.g.user_emmet_next_key = "<C-m>]"
-- vim.g.user_emmet_prev_key = "<C-m>["
-- vim.g.user_emmet_imagesize_key = "<C-m>i"
-- vim.g.user_emmet_togglecomment_key = "<C-m>/"
-- vim.g.user_emmet_splitjointag_key = "<C-m>j"
-- vim.g.user_emmet_removetag_key = "<C-m>k"
-- vim.g.user_emmet_anchorizeurl_key = "<C-m>a"
-- vim.g.user_emmet_anchorizesummary_key = "<C-m>A"
-- vim.g.user_emmet_mergelines_key = "<C-m>m"
-- vim.g.user_emmet_codepretty_key = "<C-m>c"

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
