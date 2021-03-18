vim.cmd([[packadd emmet-vim]])

vim.g.user_emmet_install_global = 1
vim.g.user_emmet_mode = "a"

vim.g.user_emmet_leader_key = "<C-m>"
vim.g.user_emmet_expandabbr_key = "<C-m>,"
vim.g.user_emmet_expandword_key = "<C-m>;"
vim.g.user_emmet_update_tag = "<C-m>u"
vim.g.user_emmet_balancetaginward_key = "<C-m>d"
vim.g.user_emmet_balancetagoutward_key = "<C-m>D"
vim.g.user_emmet_next_key = "<C-m>]"
vim.g.user_emmet_prev_key = "<C-m>["
vim.g.user_emmet_imagesize_key = "<C-m>i"
vim.g.user_emmet_togglecomment_key = "<C-m>/"
vim.g.user_emmet_splitjointag_key = "<C-m>j"
vim.g.user_emmet_removetag_key = "<C-m>k"
vim.g.user_emmet_anchorizeurl_key = "<C-m>a"
vim.g.user_emmet_anchorizesummary_key = "<C-m>A"
vim.g.user_emmet_mergelines_key = "<C-m>m"
vim.g.user_emmet_codepretty_key = "<C-m>c"

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
            ["!"] = table.concat(
                {
                    "<!DOCTYPE html>",
                    "<html lang=\"en\">",
                    "\t<head>",
                    "\t\t<meta charset=\"utf-8\" />",
                    "\t\t<meta name=\"viewport\" content=\"width=device-width,initial-scale=1.0\" />",
                    "\t\t<title>${cursor}</title>",
                    "\t</head>",
                    "\t<body>",
                    "\t\t<div>${child}</div>",
                    "\t</body>",
                    "</html>",
                },
                "\n"
            ),
        },
    },
}
