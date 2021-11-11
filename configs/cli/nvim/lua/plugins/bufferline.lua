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
                filetype = {"NvimTree", "nnn", "CHADTree"},
                text = "File Explorer",
                text_align = "center",
            },
            {
                filetype = "SidebarNvim",
                text = "Sidebar",
                text_align = "center",
            },
        },
    },
})
