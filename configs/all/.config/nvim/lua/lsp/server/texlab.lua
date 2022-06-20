local M = {}

M.config = {
    filetypes = { "tex", "bib" },
    on_attach = function(client, bufnr)
        require("lsp.keys").mappings()
        nnoremap({"<F10>", ":TexlabBuild<CR>", { silent = true }})
        inoremap({"<F10>", "<Esc>:TexlabBuild<CR>a", { silent = true }})
        nnoremap({"<F12>", ":TexlabForward<CR>", { silent = true }})
    end,
    settings = {
        texlab = {
            build = _G.TexMagicBuildConfig,
            forwardSearch = {
                executable = "zathura",
                args = {"--synctex-forward", "%l:1:%f", "%p"}
            }
        }
    }
}

return M
