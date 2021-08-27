local M = {}

local library = {}
local add = function(lib)
    for _, p in pairs(vim.fn.expand(lib, false, true)) do
        p = vim.loop.fs_realpath(p)
        library[p] = true
    end
end
add("$VIMRUNTIME")
add("~/.config/nvim")

M.config = {
    cmd = { "lua-language-server" },
    on_attach = Util.lsp_on_attach,
    on_init = Util.lsp_on_init,
    settings = {
        Lua = {
            telemetry = { enable = false },
            completion = {
                enable = true,
                keywordSnippet = "Disable",
                callSnippet = "Replace",
            },
            runtime = {
                version = "LuaJIT",
                path = (function()
                    local path = vim.split(package.path, ";")
                    table.insert(path, "lua/?.lua")
                    table.insert(path, "lua/?/init.lua")
                    return path
                end)(),
            },
            diagnostics = {
                enable = true,
                disable = {
                    "trailing-space", "unused-local",
                    "lowercase-global", "undefined-global"
                },
                globals = {
                    "vim",
                    "describe",
                    "it",
                    "before_each",
                    "after_each",
                    "awesome",
                    "theme",
                    "client",
                    "P",
                },
            },
            workspace = {
                preloadFileSize = 400,
                library = library,
            },
        },
    },
}

return M
