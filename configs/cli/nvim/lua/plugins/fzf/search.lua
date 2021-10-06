local fzf = require("fzf")
local M = {}

M.search = function(opts)
    opts = opts or {}
    local vim_cmd = opts.vim_cmd or "edit"
    local previewer = opts.previewer or "bat --style=numbers --color=always"
    local extension = opts.extension or nil
    local dir = opts.dir or string.format("%s/Documents/Notes", vim.loop.os_homedir())

    local cmd = nil
    if extension == nil or extension == "*" then
        cmd = string.format("fd . %s --type file --color never | sed -e 's#%s/##'", dir, dir)
        extension = ""
    else
        cmd = string.format(
            "fd . %s -e %s --type file --color never | sed -e 's#%s/##' -e 's#.%s##'",
            dir,
            extension,
            dir,
            extension
        )
        extension = "." .. extension
    end

    if cmd == nil then
        return
    end
    if not vim.fn.executable("fd") then
        return
    end

    coroutine.wrap(function()
        local files = fzf.fzf(cmd, string.format("--height 100%% --preview '%s %s/{}%s'", previewer, dir, extension))
        if not files then
            return
        else
            vim.cmd(vim_cmd .. dir .. "/" .. files[1] .. extension)
        end
    end)()
end

return M
