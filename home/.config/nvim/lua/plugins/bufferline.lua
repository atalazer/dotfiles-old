require("bufferline").setup({
    options = {
        show_buffer_close_icons = true,
        show_buffer_icons = true,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        tab_size = 20,
        max_name_length = 16,
        max_prefix_length = 4,
        separator_style = "thick",
        indicator_icon = "▎",
        buffer_close_icon = "",
        modified_icon = "●",
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
            },
        },
        custom_areas = {
            right = function()
                local result = {}
                local error = vim.lsp.diagnostic.get_count(0, [[Error]])
                local warning = vim.lsp.diagnostic.get_count(0, [[Warning]])
                local info = vim.lsp.diagnostic.get_count(0, [[Information]])
                local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])

                if error ~= 0 then
                    result[1] = { text = "  " .. error, guifg = "#EC5241" }
                end

                if warning ~= 0 then
                    result[2] = { text = "  " .. warning, guifg = "#EFB839" }
                end

                if hint ~= 0 then
                    result[3] = { text = "  " .. hint, guifg = "#A3BA5E" }
                end

                if info ~= 0 then
                    result[4] = { text = "  " .. info, guifg = "#7EA9A7" }
                end

                return result
            end,
        },
    },
})
