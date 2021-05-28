-- require("lsp.custom.emmetls")
-- local sumneko_cmd = {sumneko_root .. "/bin/Linux/lua-language-server", "-E", sumneko_root .. "/main.lua"}
local sumneko_cmd = "lua-language-server"

local library = {}

local add = function(lib)
    for _, p in pairs(vim.fn.expand(lib, false, true)) do
        p = vim.loop.fs_realpath(p)
        library[p] = true
    end
end

-- Neovim
-- base VIMRUNTIME library
add("$VIMRUNTIME")
-- user config
add("~/.config/nvim")
-- all neovim plugins
add("~/.local/share/nvim/site/pack/packer/start/*")
add("~/.local/share/nvim/site/pack/packer/opt/*")

-- AwesomeWM
-- base library
add("/usr/share/awesome/lib")
-- user config
add("~/.config/awesome")

require("lspconfig").sumneko_lua.setup({
    cmd = {
        sumneko_cmd,
    },
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
                maxPreload = 2000,
                preloadFileSize = 50000,
                library = library,
            },
        },
    },
})
