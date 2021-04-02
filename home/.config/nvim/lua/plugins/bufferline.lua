-- originally was taken from https://github.com/cooper-anderson/dotfiles
-- with some modifications and refactoring that I did

vim.cmd([[packadd nvim-bufferline.lua]])

local options = {
    tab_size = 15,
    max_name_length = 12,
    max_prefix_length = 3,
    mappings = true,
    show_buffer_close_icons = true,
    buffer_close_icon = "",
    separator_style = { "|", "|" },
    diagnostics = "nvim_lsp",
}

nnoremap({ "<M-d>", ":BufferLineCycleNext<CR>", { silent = true } })
nnoremap({ "<M-e>", ":BufferLineMoveNext<CR>", { silent = true } })
nnoremap({ "<M-a>", ":BufferLineCyclePrev<CR>", { silent = true } })
nnoremap({ "<M-q>", ":BufferLineMovePrev<CR>", { silent = true } })
nnoremap({ "<M-w>", ":bdelete<CR>", { silent = true } })
nnoremap({ "<M-w><M-w>", ":bdelete!<CR>", { silent = true } })

nnoremap({ "<M-1>", ":lua require'bufferline'.go_to_buffer(1)<CR>", { silent = true } })
nnoremap({ "<M-2>", ":lua require'bufferline'.go_to_buffer(2)<CR>", { silent = true } })
nnoremap({ "<M-3>", ":lua require'bufferline'.go_to_buffer(3)<CR>", { silent = true } })
nnoremap({ "<M-4>", ":lua require'bufferline'.go_to_buffer(4)<CR>", { silent = true } })
nnoremap({ "<M-5>", ":lua require'bufferline'.go_to_buffer(5)<CR>", { silent = true } })
nnoremap({ "<M-6>", ":lua require'bufferline'.go_to_buffer(6)<CR>", { silent = true } })
nnoremap({ "<M-7>", ":lua require'bufferline'.go_to_buffer(7)<CR>", { silent = true } })
nnoremap({ "<M-8>", ":lua require'bufferline'.go_to_buffer(8)<CR>", { silent = true } })
nnoremap({ "<M-9>", ":lua require'bufferline'.go_to_buffer(9)<CR>", { silent = true } })
nnoremap({ "<M-0>", ":lua require'bufferline'.go_to_buffer(10)<CR>", { silent = true } })

local function get_diagnostics_count()
    local error = vim.lsp.diagnostic.get_count(0, [[Error]])
    local warning = vim.lsp.diagnostic.get_count(0, [[Warning]])
    local information = vim.lsp.diagnostic.get_count(0, [[Information]])
    local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])

    return error, warning, information, hint
end

function _G.nvim_diagnostics_tab()
    local bufferline = _G.nvim_bufferline()
    bufferline = string.sub(bufferline, 1, #bufferline - 16)

    local _, tabstart = string.find(bufferline, "Fill#%%=")
    local tabline = string.sub(bufferline, tabstart + 1)

    bufferline = string.sub(bufferline, 1, tabstart)

    local err, warn, info, hint = get_diagnostics_count()
    local prefix = "%#Tabline"

    if #tabline ~= 0 then
        prefix = "%#Tabline"
    end

    local diagnostics = ""

    local format_sign = function(hl_group, count)
        return string.format("%s%s%s%s", diagnostics, prefix, hl_group, count)
    end

    if hint ~= 0 then
        diagnostics = format_sign("Hint# ﬤ ", hint)
    end
    if info ~= 0 then
        diagnostics = format_sign("Information#  ", info)
    end
    if warn ~= 0 then
        diagnostics = format_sign("Warning#  ", warn)
    end
    if err ~= 0 then
        diagnostics = format_sign("Error#  ", err)
    end

    if err + warn + info + hint == 0 then
        diagnostics = format_sign("Success#  ", "")
    end

    return bufferline .. tabline .. "#" .. diagnostics
end

require("bufferline").setup({
    options = options,
})

vim.o.tabline = "%!v:lua.nvim_diagnostics_tab()"
