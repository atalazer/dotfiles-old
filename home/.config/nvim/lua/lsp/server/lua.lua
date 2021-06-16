local sumneko_cmd = "lua-language-server"
local M = {}
local library = {}

local add = function(lib)
    for _, p in pairs(vim.fn.expand(lib, false, true)) do
        p = vim.loop.fs_realpath(p)
        library[p] = true
    end
end

-- Neovim
add("$VIMRUNTIME")
add("~/.config/nvim")

-- AwesomeWM
add("/usr/share/awesome/lib")

M.config = {
    cmd = { sumneko_cmd },
    on_attach = Util.lsp_on_attach,
    on_init = Util.lsp_on_init,
    on_new_config = function(config, root)
        local libs = vim.tbl_deep_extend("force", {}, library)
        libs[root] = nil
        config.settings.Lua.workspace.library = libs
        return config
    end,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = (function()
                    local path = vim.split(package.path, ";")
                    table.insert(path, "lua/?.lua")
                    table.insert(path, "lua/?/init.lua")
                    return path
                end)(),
            },
            completion = {
                keywordSnippet = "Disable",
                callSnippet = "Disable",
            },
            telemetry = { enable = false },
            diagnostics = {
                enable = true,
                disable = { "trailing-space", "lowercase-global" },
                globals = {
                    -- VIM
                    "vim",
                    -- AwesomeWM
                    "awesome",
                    "root",
                    "client",
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
