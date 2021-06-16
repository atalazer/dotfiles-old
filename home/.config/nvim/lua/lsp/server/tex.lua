local M = {}
M.config = {
    cmd = { "texlab" },
    filetypes = { "tex", "bib" },
    settings = {
        texlab = {
            rootDirectory = nil,
            build = TexMagicBuildConfig,
            formatterLineLength = 120,
            forwardSearch = {
                executable = "zathura",
                args = {"--synctex-forward", "%l:1:%f", "%p"}
            }
        }
    }
}
return M
