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
-- add("~/.config/awesome")
-- add("/usr/share/awesome/lib")
-- add("/usr/share/lua/5.1")
-- add("/usr/share/lua/5.3")
-- add("/usr/share/lua/5.4")

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
                disable = {
                    "undefined-global",
                    "lowercase-global",
                },
                globals = {
                    "vim",
                    "awesome",
                    "screen",
                    "client",
                    "mouse",
                    "root",
                    "tag",
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
