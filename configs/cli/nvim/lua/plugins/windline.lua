local windline = require("windline")
local wlfloatline = require("wlfloatline")
local helper = require("windline.helpers")
local state = _G.WindLine.state

local sep = helper.separators
local comps = require("windline.components.basic")
local lsp_comps = require("windline.components.lsp")
local git_comps = require("windline.components.git")

local animation = require("wlanimation")
local efffects = require("wlanimation.effects")

local hl_list = {
    Black = { "white", "black" },
    White = { "black", "white" },
    Inactive = { "InactiveFg", "black" },
    Active = { "ActiveFg", "ActiveBg" },
}
local basic = {}

local breakpoint_width = 100
local offset_width = 20

local luffy_text = "" -- For Animations
local unsaved_text = "" -- For Animations

basic.divider = { comps.divider, hl_list.Black }
basic.bg = { " ", "StatusLine" }

basic.vi_mode = {
    name = "vi_mode",
    hl_colors = {
        default = hl_list.Black,
        Normal = { "black", "red", "bold" },
        Insert = { "black", "green", "bold" },
        Visual = { "black", "yellow", "bold" },
        Replace = { "black", "blue_light", "bold" },
        Command = { "black", "magenta", "bold" },
        NormalBefore = { "red", "black" },
        InsertBefore = { "green", "black" },
        VisualBefore = { "yellow", "black" },
        ReplaceBefore = { "blue_light", "black" },
        CommandBefore = { "magenta", "black" },
        NormalAfter = { "white", "red" },
        InsertAfter = { "white", "green" },
        VisualAfter = { "white", "yellow" },
        ReplaceAfter = { "white", "blue_light" },
        CommandAfter = { "white", "magenta" },
    },
    text = function(_, winnr)
        local space = " "
        if state.mode[1] == "INSERT" then
            luffy_text = luffy_text
        else
            luffy_text = ""
        end

        if vim.api.nvim_win_get_width(winnr) > breakpoint_width then
            return {
                { space .. luffy_text .. state.mode[1] .. space, state.mode[2] },
                { sep.slant_left_2, state.mode[2] .. "After" },
            }
        end
        return {
            { space .. state.mode[1]:sub(1, 1) .. space, state.mode[2] },
            { sep.slant_left_2, state.mode[2] .. "After" },
        }
    end,
}

basic.file = {
    name = "file",
    hl_colors = {
        default = { "black", "white_light" },
        file = { "black", "white_light" },
    },
    text = function(_, winnr)
        local unsaved_icon = unsaved_text or " "
        if vim.api.nvim_win_get_width(winnr) > breakpoint_width then
            return {
                { " ", "default" },
                { comps.cache_file_icon({ default = "" }), "file" },
                { " ", "default" },
                { comps.cache_file_name("[No Name]", "unique"), "file" },
                { comps.file_modified(unsaved_icon), "default" },
                -- { b_components.cache_file_size(), "default" },
                -- { " ", "default" },
                { sep.slant_left_2, "" },
            }
        end
        return {
            { " ", "default" },
            { comps.cache_file_icon({ default = "" }), "default" },
            { " ", "default" },
            { comps.cache_file_name("[No Name]", "unique"), "" },
            { " ", "" },
            { comps.file_modified(unsaved_icon), "" },
            { " ", "default" },
            { sep.slant_left_2, "" },
        }
    end,
}

basic.info = {
    hl_colors = basic.vi_mode.hl_colors,
    text = function(_, winnr)
        if vim.api.nvim_win_get_width(winnr) > breakpoint_width then
            local _file_type = function()
                return function(bufnr)
                    local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
                    if filetype == "" then
                        return "  "
                    end
                    return filetype:upper()
                end
            end
            local file_type = _file_type()

            return {
                { sep.slant_left, state.mode[2] .. "Before" },
                { " ", state.mode[2] },
                { file_type, state.mode[2] },
                { " ", state.mode[2] },
                { comps.line_col, state.mode[2] },
                { " ", state.mode[2] },
                { comps.progress, state.mode[2] },
                { " ", state.mode[2] },
            }
        end
        return {
            { sep.slant_left, state.mode[2] .. "Before" },
            { " ", state.mode[2] },
            { comps.line_col, state.mode[2] },
            { " ", state.mode[2] },
            { comps.progress, state.mode[2] },
            { " ", state.mode[2] },
        }
    end,
}

basic.git = {
    name = "git",
    hl_colors = {
        green = { "green", "black" },
        red = { "red", "black" },
        blue = { "blue", "black" },
    },
    width = breakpoint_width,
    text = function(_, winnr)
        if vim.api.nvim_win_get_width(winnr) > breakpoint_width and git_comps.is_git() then
            return {
                { " ", "" },
                { git_comps.diff_added({ format = " %s", show_zero = false }), "green" },
                { git_comps.diff_removed({ format = "  %s", show_zero = false }), "red" },
                { git_comps.diff_changed({ format = " 柳%s", show_zero = false }), "blue" },
            }
        end
        return ""
    end,
}

local get_git_branch = git_comps.git_branch()
basic.git_branch = {
    hl_colors = {
        default = hl_list.Black,
        yellow = { "yellow", "black" },
    },
    text = function(_, winnr)
        local branch_name = get_git_branch()
        if vim.api.nvim_win_get_width(winnr) > breakpoint_width and #branch_name > 1 then
            return {
                { branch_name, "yellow" },
                { " ", "default" },
            }
        end
    end,
}

basic.lsp = {
    name = "diagnostic",
    hl_colors = {
        red = { "red", "black" },
        green = { "green", "black" },
        blue = { "blue", "black" },
        yellow = { "yellow", "black" },
    },
    width = breakpoint_width,
    text = function(_, winnr)
        if vim.api.nvim_win_get_width(winnr) > breakpoint_width and lsp_comps.check_lsp() then
            return {
                { lsp_comps.lsp_error({ format = " %s", show_zero = false }), "red" },
                { lsp_comps.lsp_warning({ format = "  %s", show_zero = false }), "yellow" },
                { lsp_comps.lsp_info({ format = "  %s", show_zero = false }), "blue" },
                { lsp_comps.lsp_hint({ format = "  %s", show_zero = false }), "green" },
            }
        end
        return ""
    end,
}

basic.lsp_server_name = {
    name = "lsp-server",
    hl_colors = {
        default = { "green", "black" },
    },
    width = breakpoint_width,
    text = function(_, winnr)
        if vim.api.nvim_win_get_width(winnr) > breakpoint_width + 20 and lsp_comps.check_lsp() then
            return {
                { lsp_comps.lsp_name(), "default" },
            }
        end
    end,
}

basic.inactive = {
    name = "inactive",
    hl_colors = {
        text = { "white", "black" },
        separator = { "black", "black" },
        bg = { "white", "black" },
    },
    text = function(_, winnr)
        if vim.api.nvim_win_get_width(winnr) > breakpoint_width + 20 then
            return {
                { comps.line_col, "text" },
                { sep.slant_left_2, "separator" },
                { comps.divider, "bg" },
                { comps.file_name, "text" },
                { comps.cache_file_name("[No Name]", "unique"), "text" },
                { comps.divider, "bg" },
                { sep.slant_right_2, "separator" },
                { comps.progress, "text" },
            }
        end
        return {
            { comps.divider, "bg" },
            { comps.cache_file_name("[No Name]", "unique"), "text" },
            { comps.divider, "bg" },
        }
    end,
}

local quickfix = {
    filetypes = { "qf", "Trouble" },
    active = {
        { "🚦 Quickfix ", { "white", "black" } },
        { sep.slant_right, { "black", "black_light" } },
        {
            function()
                return vim.fn.getqflist({ title = 0 }).title
            end,
            { "cyan", "black_light" },
        },
        { " Total : %L ", { "cyan", "black_light" } },
        { sep.slant_right, { "black_light", "InactiveBg" } },
        { " ", { "InactiveFg", "InactiveBg" } },
        basic.divider,
        { sep.slant_right, { "InactiveBg", "black" } },
        { "🧛 ", { "white", "black" } },
    },

    show_inactive = true,
}

local explorer = {
    filetypes = { "fern", "NvimTree", "lir", "SidebarNvim" },
    active = {
        { "  ", { "white", "black_light" } },
        { sep.slant_left_2, { "black", "black_light" } },
        basic.divider,
        { sep.slant_right_2, { "black", "black_light" } },
        { comps.file_name(""), { "white", "black_light" } },
    },
    show_inactive = true,
    show_last_status = false,
}

local default = {
    filetypes = { "default" },
    active = {
        basic.vi_mode,
        basic.file,
        basic.git_branch,
        basic.git,
        -- basic.divider,
        -- basic.lsp_server_name,
        basic.divider,
        basic.lsp,
        { " ", hl_list.Black },
        basic.info,
    },
    inactive = { basic.inactive },
}

local minimal = {
    filetypes = { "", "help", "text", "tsplayground" },
    active = {
        basic.vi_mode,
        basic.file,
        basic.divider,
        basic.git,
        { git_comps.git_branch(), { "yellow", "black" }, breakpoint_width },
        basic.info,
    },
    inactive = {
        basic.inactive,
    },
}

hidden = {
    filetypes = { "alpha" },
    active = { basic.divider },
    inactive = { basic.divider },
}

windline.setup({
    colors_name = function(colors)
        colors.File = colors.white_light
        return colors
    end,
    statuslines = {
        default,
        quickfix,
        explorer,

        minimal,
        hidden,
    },
})

-- -- Setup Floatline
-- wlfloatline.setup({
--     interval = 300,
--     ui = {
--         active_char = "▁",
--         active_color = "blue",
--         -- active_hl = nil,
--     },
--     skip_filetypes = {
--         "TelescopePrompt",
--         "NvimTree",
--         "lir",
--     },
-- })

-- Animations
-- need to use font family: Fira Code iCursive S12
-- https://github.com/windwp/windline.nvim/wiki/fonts/FiraCodeiCursiveS12-Regular.ttf
local luffy = { "􏾾", "􏾿", "􏿀", "􏿁", "􏿂", "􏿃" }
animation.stop_all()
animation.basic_animation({
    timeout = nil,
    delay = 200,
    interval = 150,
    effect = efffects.list_text(luffy),
    on_tick = function(value)
        luffy_text = value .. " "
    end,
})

animation.basic_animation({
    timeout = nil,
    delay = 200,
    interval = 500,
    effect = efffects.list_text({ " ", " " }),
    on_tick = function(value)
        unsaved_text = value or " "
    end,
})

animation.animation({
    data = {
        -- { "File", efffects.list_color(color_list) },
        { "File", efffects.rainbow() },
    },
    timeout = nil,
    delay = 250,
    interval = 750,
})
