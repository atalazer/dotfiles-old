vim.cmd [[packadd nvim-bufferline.lua]]
vim.cmd[[packadd nvim-web-devicons]]

require'bufferline'.setup{
    options = {
        view = "multiwindow",
        numbers ="ordinal" ,
        separator_style ="thin",
        number_style ="",
        mappings = true ,

        buffer_close_icon= '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',

        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        show_buffer_close_icons = true ,
        show_tab_indicators = true ,
        persist_buffer_sort = true,
        enforce_regular_tabs = fal,
        always_show_bufferline = true ,
        sort_by = function(buffer_a, buffer_b)
            return buffer_a.modified > buffer_b.modified
        end,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or ""
            return " " .. icon .. count
        end,
    }
}


nnoremap{"<silent><M-a>", ":BufferLineCycleNext<CR>"}
nnoremap{"<silent><M-d>", ":BufferLineCyclePrev<CR>"}
nnoremap{"<silent><M-q>", ":BufferLineMoveNext<CR>"}
nnoremap{"<silent><M-e>", ":BufferLineMovePrev<CR>"}
nnoremap{"<silent>bp", ":BufferLinePick<CR>"}

nnoremap{"<M-1>", ":lua require'bufferline'.go_to_buffer(1)<CR>"}
nnoremap{"<M-2>", ":lua require'bufferline'.go_to_buffer(2)<CR>"}
nnoremap{"<M-3>", ":lua require'bufferline'.go_to_buffer(3)<CR>"}
nnoremap{"<M-4>", ":lua require'bufferline'.go_to_buffer(4)<CR>"}
nnoremap{"<M-5>", ":lua require'bufferline'.go_to_buffer(5)<CR>"}
nnoremap{"<M-6>", ":lua require'bufferline'.go_to_buffer(6)<CR>"}
nnoremap{"<M-7>", ":lua require'bufferline'.go_to_buffer(7)<CR>"}
nnoremap{"<M-8>", ":lua require'bufferline'.go_to_buffer(8)<CR>"}
nnoremap{"<M-9>", ":lua require'bufferline'.go_to_buffer(9)<CR>"}
nnoremap{"<M-0>", ":lua require'bufferline'.go_to_buffer(10)<CR>"}

nnoremap{"<silent>be", ":BufferLineSortByExtension<CR>"}
nnoremap{"<silent>bd", ":BufferLineSortByDirectory<CR>"}
nnoremap{"<silent>bf", ":lua function(buffer_a, buffer_b) return buffer_a.modified > buffer_b.modified end"}

