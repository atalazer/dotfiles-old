local kind = {}
local fmt = string.format

kind.presets = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

local kind_order = {
    "Text",
    "Method",
    "Function",
    "Constructor",
    "Field",
    "Variable",
    "Class",
    "Interface",
    "Module",
    "Property",
    "Unit",
    "Value",
    "Enum",
    "Keyword",
    "Snippet",
    "Color",
    "File",
    "Reference",
    "Folder",
    "EnumMember",
    "Constant",
    "Struct",
    "Event",
    "Operator",
    "TypeParameter",
}

kind.init = function()
    local symbol_map = kind.presets

    local symbols = {}
    local len = 25
    for i = 1, len do
        local name = kind_order[i]
        local symbol = symbol_map[name]
        symbol = symbol and (symbol .. " ") or ""
        symbols[i] = fmt("%s%s", symbol, name)
    end
    require("vim.lsp.protocol").CompletionItemKind = symbols
end

return kind
