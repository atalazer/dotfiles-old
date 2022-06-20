local M = {}

M.Comment = function()
    require("Comment").setup({
        padding = true,
        sticky = true,
        ignore = function()
            return "^$"
        end,
        mappings = {
            basic = true,
            extra = false,
        },
        toggler = {
            line = "gcc",
            block = "gbc",
        },
        opleader = {
            line = "gc",
            block = "gb",
        },
        pre_hook = function(ctx)
            -- require("ts_context_commentstring.internal").update_commentstring()

            -- Only calculate commentstring for tsx filetypes
            if vim.bo.filetype == "typescriptreact" then
                local U = require("Comment.utils")

                -- Detemine whether to use linewise or blockwise commentstring
                local type = ctx.ctype == U.ctype.line and "__default" or "__multiline"

                -- Determine the location where to calculate commentstring from
                local location = nil
                if ctx.ctype == U.ctype.block then
                    location = require("ts_context_commentstring.utils").get_cursor_location()
                elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                    location = require("ts_context_commentstring.utils").get_visual_start_location()
                end

                return require("ts_context_commentstring.internal").calculate_commentstring({
                    key = type,
                    location = location,
                })
            end
        end,
    })
end

M.comment_frame = function()
    require("nvim-comment-frame").setup({
        disable_default_keymap = false,
        keymap = "<leader>cc",
        multiline_keymap = "<leader>C",
        start_str = "//",
        end_str = "//",
        fill_char = "-",
        frame_width = 70,
        line_wrap_len = 50,
        auto_indent = true,
        add_comment_above = true,
    })
end

M.neogen = function()
    local opts = { silent = true }
    nnoremap("gca", "<CMD>lua require('neogen').generate()<CR>", opts)
    nnoremap("<C-e>", "<CMD>lua require('neogen').jump_next()<CR>", opts)

    require("neogen").setup({
        enabled = true,
        languages = {
            lua = { template = { annotation_convention = "emmylua" } },
            python = { template = { annotation_convention = "google_docstrings" } },
        },
    })
end

return M
