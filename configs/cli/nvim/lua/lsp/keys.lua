local k = vim.keymap
local nnoremap = function(...) k.nnoremap({...}) end
local vnoremap = function(...) k.vnoremap({...}) end
local inoremap = function(...) k.inoremap({...}) end

local M = {}

local buf = vim.lsp.buf
local codelens = vim.lsp.codelens
local diagnostic = vim.lsp.diagnostic
local telescope = require("telescope.builtin")

M.mappings = function()
    local opts = mapx.silent
    mapx.nname("<Leader>l", "LSP")
    inoremap( "<C-l>", buf.signature_help, opts )
    nnoremap( "<Leader>la", telescope.lsp_code_actions, opts )
    nnoremap( "<Leader>lf", buf.formatting_seq_sync, opts )
    vnoremap( "<Leader>lf", buf.range_formatting, opts )
    nnoremap( "<Leader>ld", buf.definition, opts )
    nnoremap( "<Leader>lc", codelens.run, opts )
    nnoremap( "<Leader>lr", telescope.lsp_references, opts )
    nnoremap( "<Leader>lR", buf.rename, opts )
    nnoremap( "<Leader>lt", "<Cmd>TroubleToggle<CR>", opts )
    nnoremap( ";l", buf.hover, opts )
    nnoremap( "K", buf.hover, opts )
    nnoremap(
        "<Leader>ll",
        function()
            diagnostic.show_line_diagnostics({
                show_header = false,
                border = Util.borders,
            })
        end,
        opts
    )
    nnoremap(
        "]l",
        function()
            diagnostic.goto_next({
                popup_opts = {
                    show_header = false,
                    border = Util.borders,
                },
            })
        end,
        opts
    )
    nnoremap(
        "[l",
        function()
            diagnostic.goto_prev({
                popup_opts = {
                    show_header = false,
                    border = Util.borders,
                },
            })
        end,
        opts
    )
end

return M
