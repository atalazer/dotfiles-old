local M = {}

local path = vim.split(package.path, ";")
table.insert(path, "lua/?.lua")
table.insert(path, "lua/?/init.lua")

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
    on_attach = Util.lsp_on_attach,
    on_init = Util.lsp_on_init,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = path,
            },
            completion = {
                enable = true,
                callSnippet = "Both",
            },
            diagnostics = {
                enable = true,
                globals = {
                    "vim",
                    "describe",
                    "it",
                    "before_each",
                    "after_each",
                    "theme",
                    "awesome",
                    "screen",
                    "client",
                    "mouse",
                    "root",
                    "tag",
                    "P",
                },
            },
            workspace = {
                maxPreload = 100000,
                preloadFileSize = 10000,
                library = library,
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

return M
