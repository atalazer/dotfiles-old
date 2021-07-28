local windline = require("windline")
local helper = require("windline.helpers")
local b_components = require("windline.components.basic")
local state = _G.WindLine.state

local lsp_comps = require("windline.components.lsp")
local git_comps = require("windline.components.git")

local hl_list = {
    Black = { "white", "black" },
    White = { "black", "white" },
    Inactive = { "InactiveFg", "InactiveBg" },
    Active = { "ActiveFg", "ActiveBg" },
}

local basic = {}

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
        return { { "  ", state.mode[2] } }
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
    width = 90,
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
basic.file = {
    name = "file",
    hl_colors = {
        default = hl_list.Black,
        white = { "white", "black" },
        magenta = { "magenta", "black" },
    },
    text = function()
        return {
            { b_components.cache_file_size(), "default" },
            { " ", "" },
            { b_components.cache_file_name("[No Name]", ""), "magenta" },
            { b_components.line_col, "white" },
            { b_components.progress, "" },
            { " ", "" },
            { b_components.file_modified(" "), "magenta" },
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
    width = 90,
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
        { "Quickfix ", { "white", "black" } },
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
        { helper.separators.slant_right, { "black", "black_light" } },
        { b_components.divider, "" },
        { b_components.file_name(""), { "white", "black_light" } },
    },
    show_in_active = true,
}
local default = {
    filetypes = { "default" },
    active = {
        basic.square_mode,
        basic.vi_mode,
        basic.file,
        basic.lsp_diagnos,
        basic.divider,
        { lsp_comps.lsp_name(), { "magenta", "black" }, 90 },
        basic.git,
        { git_comps.git_branch(), { "magenta", "black" }, 90 },
        { " ", hl_list.Black },
        basic.square_mode,
    },
    in_active = {
        { b_components.full_file_name, hl_list.Inactive },
        basic.file_name_inactive,
        basic.divider,
        basic.divider,
        { b_components.line_col, hl_list.Inactive },
        { b_components.progress, hl_list.Inactive },
    },
}

windline.setup({
    statuslines = {
        default,
        quickfix,
        explorer,
    },
})
