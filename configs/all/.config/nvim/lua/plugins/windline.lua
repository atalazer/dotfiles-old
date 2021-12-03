local windline = require("windline")
local wlfloatline = require("wlfloatline")
local helper = require("windline.helpers")
local b_components = require("windline.components.basic")
local state = _G.WindLine.state

local animation = require("wlanimation")
local effects = require("wlanimation.effects")
local luffy_text -- For Animations
local unsaved_text -- For Animations

local lsp_comps = require("windline.components.lsp")
local git_comps = require("windline.components.git")

local animation = require("wlanimation")
local luffy_text -- For Luffy Animations
local unsaved_text -- For Unsaved File Modified Animation

local lsp_comps = require("windline.components.lsp")
local git_comps = require("windline.components.git")

local hl_list = {
    Black = { "white", "black" },
    White = { "black", "white" },
    Inactive = { "InactiveFg", "InactiveBg" },
    Active = { "ActiveFg", "ActiveBg" },
}
local basic = {}

local breakpoint_width = 90
basic.divider = { b_components.divider, "" }
basic.bg = { " ", "StatusLine" }

local colors_mode = {
    Normal = { "red", "black" },
    Insert = { "green", "black" },
    Visual = { "yellow", "black" },
    Replace = { "blue_light", "black" },
    Command = { "magenta", "black" },
}

basic.vi_mode = {
    name = "vi_mode",
    hl_colors = colors_mode,
    text = function()
        local icon
        if state.mode[1] == "INSERT" then
            icon = luffy_text
        else
            icon = ""
        end
        return { { " " .. icon .. " ", state.mode[2] } }
    end,
}
basic.square_mode = {
    hl_colors = colors_mode,
    text = function()
        return { { "▊", state.mode[2] } }
    end,
}

basic.lsp_diagnos = {
    name = "diagnostic",
    hl_colors = {
        red = { "red", "black" },
        yellow = { "yellow", "black" },
        blue = { "blue", "black" },
    },
    width = breakpoint_width,
    text = function(bufnr)
        if lsp_comps.check_lsp(bufnr) then
            return {
                { lsp_comps.lsp_error({ format = "  %s", show_zero = false }), "red" },
                { lsp_comps.lsp_warning({ format = "  %s", show_zero = false }), "yellow" },
                { lsp_comps.lsp_hint({ format = "  %s", show_zero = false }), "blue" },
            }
        end
        return ""
    end,
}
basic.file = {
    name = "file",
    hl_colors = {
        default = hl_list.Black,
        white = { "white", "black" },
        magenta = { "magenta", "black" },
    },
    text = function(_, _, width)
        local file_modified_icon = unsaved_text or " "

        if width > breakpoint_width then
            return {
                { b_components.cache_file_size(), "default" },
                { " ", "" },
                { b_components.cache_file_name("[No Name]", "unique"), "magenta" },
                { b_components.line_col_lua, "white" },
                { b_components.progress_lua, "" },
                { " ", "" },
                { b_components.file_modified(file_modified_icon), "magenta" },
            }
        else
            return {
                { b_components.cache_file_size(), "default" },
                { " ", "" },
                { b_components.cache_file_name("[No Name]", "unique"), "magenta" },
                { " ", "" },
                { b_components.file_modified(file_modified_icon), "magenta" },
            }
        end
    end,
}
basic.file_right = {
    hl_colors = {
        default = hl_list.Black,
        white = { "white", "black" },
        magenta = { "magenta", "black" },
    },
    text = function(_, _, width)
        if width < breakpoint_width then
            return {
                { b_components.line_col_lua, "white" },
                { b_components.progress_lua, "" },
            }
        end
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
    text = function(bufnr)
        if git_comps.is_git(bufnr) then
            return {
                { git_comps.diff_added({ format = "  %s", show_zero = false }), "green" },
                { git_comps.diff_removed({ format = "  %s", show_zero = false }), "red" },
                { git_comps.diff_changed({ format = " 柳%s", show_zero = false }), "blue" },
            }
        end
        return ""
    end,
}

local quickfix = {
    filetypes = { "qf", "Trouble" },
    active = {
        { "🚦 Quickfix ", { "white", "black" } },
        { helper.separators.slant_right, { "black", "black_light" } },
        {
            function()
                return vim.fn.getqflist({ title = 0 }).title
            end,
            { "cyan", "black_light" },
        },
        { " Total : %L ", { "cyan", "black_light" } },
        { helper.separators.slant_right, { "black_light", "InactiveBg" } },
        { " ", { "InactiveFg", "InactiveBg" } },
        basic.divider,
        { helper.separators.slant_right, { "InactiveBg", "black" } },
        { "🧛 ", { "white", "black" } },
    },

    always_active = true,
    show_last_status = true,
}

local explorer = {
    filetypes = { "fern", "NvimTree", "lir" },
    active = {
        { "  ", { "black", "red" } },
        { helper.separators.slant_right, { "red", "NormalBg" } },
        { b_components.divider, "" },
        { b_components.file_name(""), { "white", "NormalBg" } },
    },
    always_active = true,
    show_last_status = true,
}

basic.lsp_name = {
    width = breakpoint_width,
    name = "lsp_name",
    hl_colors = {
        magenta = { "magenta", "black" },
    },
    text = function(bufnr)
        if lsp_comps.check_lsp(bufnr) then
            return {
                { lsp_comps.lsp_name(), "magenta" },
            }
        end
        return {
            { b_components.cache_file_type({ icon = true }), "magenta" },
        }
    end,
}

local default = {
    filetypes = { "default" },
    active = {
        basic.square_mode,
        basic.vi_mode,
        basic.file,
        basic.lsp_diagnos,
        basic.divider,
        basic.file_right,
        basic.lsp_name,
        basic.git,
        { git_comps.git_branch(), { "magenta", "black" }, breakpoint_width },
        { " ", hl_list.Black },
        basic.square_mode,
    },
    inactive = {
        { b_components.divider, hl_list.Black },
        { b_components.full_file_name, hl_list.Black },
        { b_components.divider, hl_list.Black },
    },
}

-- Windline Setup
-- --------------------------------
windline.setup({
    colors_name = function(colors)
        return colors
    end,
    statuslines = {
        default,
        quickfix,
        explorer,
    },
})

-- -- Floatline Setup
-- -- -------------------------------
-- wlfloatline.setup({
--     interval = 300,
--     ui = {
--         active_char = "▁",
--         active_color = "blue",
--     },
--     skip_filetypes = { "NvimTree", "lir" },
--     floating_show_filetypes = {},
-- })

-- Animations
-- --------------------------------
-- need to use font family: Fira Code iCursive S12
-- https://github.com/windwp/windline.nvim/wiki/fonts/FiraCodeiCursiveS12-Regular.ttf
animation.stop_all()
animation.basic_animation({
    timeout = nil,
    delay = 200,
    interval = 150,
    effect = effects.list_text({ "􏾾", "􏾿", "􏿀", "􏿁", "􏿂", "􏿃" }),
    on_tick = function(value)
        luffy_text = value
    end,
})

animation.basic_animation({
    timeout = nil,
    delay = 200,
    interval = 500,
    effect = effects.list_text({ " ", " " }),
    on_tick = function(value)
        unsaved_text = value
    end,
})
