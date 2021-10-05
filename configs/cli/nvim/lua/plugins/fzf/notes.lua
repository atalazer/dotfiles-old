local fzf = require("fzf")
local M = {}

M.notes = function(opts)
    opts = opts or {}
    local open = opts.open or "edit"
    local dir = opts.dir or string.format("%s/Documents/Notes", vim.loop.os_homedir())
    local cmd = string.format("fd . %s -e md --type file --color never | sed -e 's#%s/##' -e 's#.md##'", dir, dir)
    local preview = opts.preview or "glow -s auto"

    coroutine.wrap(function()
        local files = fzf.fzf(cmd, string.format("--height 100%% --preview '%s %s/{}.md'", preview, dir))
        if not files then 
            return
        else
            vim.cmd(open..dir.."/"..files[1]..".md")
        end
    end)()
end

return M
