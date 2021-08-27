local windline = require("windline")
local helper = require("windline.helpers")
local b_components = require("windline.components.basic")
local state = _G.WindLine.state

local sep = helper.separators
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

local breakpoint_width = 80

local luffy_text = ""
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
    text = function()
        if state.mode[1] == "INSERT" then
            luffy_text = luffy_text
        else
            luffy_text = ""
        end

        return {
            { sep.left_rounded, state.mode[2] .. "Before" },
            { luffy_text .. state.mode[1], state.mode[2] },
            { sep.right_rounded, state.mode[2] .. "Before" },
            { " ", "default" },
        }
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
    text = function()
        if lsp_comps.check_lsp() then
            return {
                { " ", "red" },
                { lsp_comps.lsp_error({ format = " %s", show_zero = true }), "red" },
                { lsp_comps.lsp_warning({ format = "  %s", show_zero = true }), "yellow" },
                { lsp_comps.lsp_hint({ format = "  %s", show_zero = true }), "blue" },
            }
        end
        return ""
    end,
}

basic.file_info = {
    hl_colors = {
        default = hl_list.Black,
        Normal = { "cyan", "black" },
        Inverse = { "black", "cyan" },
    },
    text = function(_, winnr)
        if vim.api.nvim_win_get_width(winnr) > breakpoint_width then
            return {
                { " ", "default" },
                { sep.left_rounded, "Normal" },
                { "", "Inverse" },
                { b_components.progress, "Inverse" },
                { " ", "Inverse" },
                { b_components.line_col, "Inverse" },
                { sep.right_rounded, "Normal" },
            }
        end
    end,
}
basic.file = {
    name = "file",
    hl_colors = {
        default = hl_list.Black,
        white = { "white", "black" },
        magenta = { "magenta", "black" },
    },
    text = function(_, winnr)
        if vim.api.nvim_win_get_width(winnr) > breakpoint_width then
            return {
                { b_components.cache_file_icon({ default = "" }), "default" },
                { " ", "" },
                { b_components.cache_file_name("[No Name]", ""), "magenta" },
                { b_components.cache_file_size(), "default" },
                { " ", "" },
                { b_components.file_modified(" "), "magenta" },
            }
        else
            return {
                { b_components.cache_file_icon({ default = "" }), "default" },
                { " ", "" },
                { b_components.cache_file_name("[No Name]", ""), "magenta" },
                { " ", "" },
                { b_components.file_modified(" "), "magenta" },
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
    text = function()
        if git_comps.is_git() then
            return {
                { " ", "" },
                { git_comps.diff_added({ format = " %s", show_zero = true }), "green" },
                { git_comps.diff_removed({ format = "  %s", show_zero = true }), "red" },
                { git_comps.diff_changed({ format = " 柳%s", show_zero = true }), "blue" },
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

    show_in_active = true,
}

local explorer = {
    filetypes = { "fern", "NvimTree", "lir" },
    active = {
        { "  ", { "white", "black" } },
        { sep.right_rounded, { "black", "black_light" } },
        { b_components.divider, "" },
        { sep.left_rounded, { "black", "black_light" } },
        { b_components.file_name(""), { "white", "black_light" } },
    },
    show_in_active = true,
    show_last_status = true,
}

local default = {
    filetypes = { "default" },
    active = {
        basic.vi_mode,
        basic.file,
        { git_comps.git_branch(), { "yellow", "black" }, breakpoint_width },
        basic.git,
        basic.divider,
        basic.lsp_diagnos,
        { " ", hl_list.Black },
        { lsp_comps.lsp_name(), { "green", "black" }, breakpoint_width },
        basic.file_info,
    },
    in_active = {
        { " ", hl_list.Black },
        { b_components.line_col, hl_list.Inactive },
        basic.divider,
        { b_components.full_file_name, hl_list.Inactive },
        { " ", hl_list.Black },
        basic.divider,
        { b_components.progress, hl_list.Inactive },
        { " ", hl_list.Black },
    },
}

local writing = {
    filetypes = { "markdown", "text", "help" },
    active = {
        basic.vi_mode,
        basic.file,
        basic.divider,
        basic.file_info,
        basic.divider,
        basic.git,
        { git_comps.git_branch(), { "yellow", "black" }, breakpoint_width },
    },
    in_active = {
        { " ", hl_list.Black },
        { b_components.line_col, hl_list.Inactive },
        basic.divider,
        { b_components.full_file_name, hl_list.Inactive },
        { " ", hl_list.Black },
        basic.divider,
        { b_components.progress, hl_list.Inactive },
        { " ", hl_list.Black },
    },
}

windline.setup({
    statuslines = {
        default,
        writing,
        quickfix,
        explorer,
    },
})

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
