vim.cmd([[packadd kommentary]])
local config = require("kommentary.config")
local lang = require("kommentary.config").configure_language
lang("default",{
    prefer_single_line_comments = true,
    use_consistent_indentation = true,
    ignore_whitespace = true,
})

lang("lua",{
    single_line_comment_string = "--",
    multi_line_comment_strings = { "--[[", "--]]" },
    prefer_single_line_comments = true,
})

lang("rust",{
    single_line_comment_string = "//",
    multi_line_comment_strings = { "/*", "*/" },
})

lang({ "sh", "zsh", "bash", "dosini" },{
    single_line_comment_string = "#",
})

lang("xdefaults",{
    single_line_comment_string = "!",
    prefer_single_line_comments = true,
})

-- kommentary
vim.g.kommentary_create_default_mappings = false
nmap{ "//", "<Plug>kommentary_line_default", {}}
vmap{ "//", "<Plug>kommentary_visual_default", {}}
nmap{ "<leader>//", "<Plug>kommentary_motion_default", {}}

