vim.g.user_emmet_install_global = 0
vim.g.user_emmet_mode = "a"
vim.g.user_emmet_leader_key = ","
vim.g.user_emmet_settings = {
    variables = { lang = "en" },
    html = {
        snippets = {
            ["html:5"] = "<!DOCTYPE html>\n"
                .. '<html lang="${lang}">\n'
                .. "<head>\n"
                .. '\t<meta charset="${charset}">\n'
                .. '\t<meta name="viewport" content="width=device-width, initial-scale=1.0">\n'
                .. '\t<meta http-equiv="X-UA-Compatible" content="ie=edge">\n'
                .. "\t<title>Document</title>\n"
                .. "</head>\n"
                .. "<body>\n\t${child}|\n</body>\n"
                .. "</html>",
        },
    },
}
