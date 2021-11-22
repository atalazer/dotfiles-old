local k = vim.keymap
local nnoremap = function(...) k.nnoremap({...}) end
local vnoremap = function(...) k.vnoremap({...}) end
local inoremap = function(...) k.inoremap({...}) end

local M = {}

local buf = vim.lsp.buf
local codelens = vim.lsp.codelens
local diagnostic = vim.lsp.diagnostic

local telescope_exist, telescope = pcall(require, "telescope.builtin")
local fzf_exist, fzf = pcall(require, "fzf-lua")

local code_action = function()
    if telescope_exist then
        telescope.lsp_code_actions()
    elseif fzf_exist then
        fzf.lsp_code_actions()
    else
        buf.code_action()
    end
end 

local lsp_reference = function()
    if telescope_exist then
        telescope.lsp_references()
    elseif fzf_exist then
        fzf.lsp_references()
    else
        buf.references()
    end
end

M.mappings = function()
    local opts = mapx.silent
    mapx.nname("<Leader>l", "LSP")
    inoremap( "<C-l>", buf.signature_help, opts )
    nnoremap( "<Leader>la", code_action, opts )
    nnoremap( "<Leader>lf", buf.formatting_seq_sync, opts )
    vnoremap( "<Leader>lf", buf.range_formatting, opts )
    nnoremap( "<Leader>ld", buf.definition, opts )
    nnoremap( "<Leader>lc", codelens.run, opts )
    nnoremap( "<Leader>lr", lsp_reference, opts )
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
