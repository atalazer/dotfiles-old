local Job = require("plenary.job")

_G.Util = {}

Util.get_word = function()
    local first_line_num, last_line_num = vim.fn.getpos("'<")[2], vim.fn.getpos("'>")[2]
    local first_col, last_col = vim.fn.getpos("'<")[3], vim.fn.getpos("'>")[3]
    local current_word = vim.fn.getline(first_line_num, last_line_num)[1]:sub(first_col, last_col)
    return current_word
end

Util.t = function(cmd)
    return vim.api.nvim_replace_termcodes(cmd, true, true, true)
end

Util.open = function()
    local filename = vim.fn.expand("<cfile>")
    vim.loop.spawn("opener", { args = { filename } })
end

Util.translate = function(lang)
    local word = Util.get_word()
    local job = Job:new({
        command = "trans",
        args = { "-b", ":" .. (lang or "id"), word },
    })
    local ok, result = pcall(function() return vim.trim(job:sync()[1]) end)
    if ok then
        print(result)
        vim.cmd(string.format(
            [[silent! !echo "%s" | tr --delete "\n" | xclip -selection clipboard ]],
            result)
        )
    end
end
vim.cmd("command! -range -nargs=? Translate call v:lua.Util.translate(<f-args>)")

Util.check_back_space = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

-- Use nvim-autopairs cr instead
-- see lua/plugins/{cmp,coq}.lua for context
Util.trigger_completion = function()
    local npair_exist, npairs = pcall(require, "nvim-autopairs")

    if npair_exist then
        if vim.fn.pumvisible() ~= 0 then
            if vim.fn.complete_info({ "selected" }).selected ~= -1 then
                return npairs.esc("<C-y>")
            else
                -- you can change <c-g><c-g> to <c-e> if you don't use other i_CTRL-X modes
                return npairs.esc("<C-g><C-g>") .. npairs.autopairs_cr()
            end
        else
            return npairs.autopairs_cr()
        end
    end

    return Util.t("<CR>")
end

-- see lua/plugins/{cmp,coq}.lua for context
Util.backspace = function()
    local npair_exist, npairs = pcall(require, "nvim-autopairs")

    if npair_exist then
        if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
            return npairs.esc("<C-e>") .. npairs.autopairs_bs()
        else
            return npairs.autopairs_bs()
        end
    end
    return Util.t("<BS>")
end

-- see lua/plugins/cmp.lua for context
Util.tab_complete = function(fallback)
    local luasnip_exist, luasnip = pcall(require, "luasnip")
    if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(Util.t("<C-n>"), "n")
    elseif luasnip_exist and luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(Util.t("<Plug>luasnip-expand-or-jump"), "")
    elseif Util.check_back_space() then
        vim.fn.feedkeys(Util.t("<Tab>"), "n")
    else
        fallback()
    end
end

-- see lua/plugins/cmp.lua for context
Util.s_tab_complete = function(fallback)
    local luasnip_exist, luasnip = pcall(require, "luasnip")
    if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(Util.t("<C-p>"), "n")
    elseif luasnip_exist and luasnip.jumpable(-1) then
        vim.fn.feedkeys(Util.t("<Plug>luasnip-jump-prev"), "")
    else
        fallback()
    end
end

Util.borders = {
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
}

Util.lsp_on_attach = function(client, bufnr)
    if client.resolved_capabilities.code_lens then
        vim.cmd([[
            augroup CodeLens
                au!
                au InsertEnter,InsertLeave * lua vim.lsp.codelens.refresh()
            augroup END
        ]])
    end

    require("lsp.keys").mappings()
end

Util.lsp_on_init = function(client)
    local notify = notify or vim.notify
    notify("Language Server Client successfully started!", "info", {
        title = client.name,
    })
end

vim.g.dont_write = false
local write = function()
    vim.g.dont_write = false
    vim.cmd("write")
end

-- See lua/plugins/firenvim.lua for context
Util.delay_write = function()
    if vim.g.dont_write then return end
    vim.g.dont_write = true
    vim.defer_fn(function()
        write()
    end, 1000)
end

local session_dir = vim.fn.expand(vim.fn.stdpath("cache") .. "/sessions")
local last_session = session_dir .. "/last.vim"

Util.session = {
    last = function() vim.cmd("source " .. last_session) end,
    save = function(session_name)
        local session = session_dir .. "/" .. ( session_name or "last" ) .. ".vim"
        vim.cmd("mksession! " .. session)
    end,
    search = function()
        require("plugins.fzf.search").search({
            vim_cmd = "source",
            extension = "vim",
            previewer = "bat --style=numbers --color=always",
            dir = session_dir
        })
    end,
}
vim.cmd("command! -range -nargs=? SessionSave call v:lua.Util.session.save(<f-args>)")
vim.cmd("command! -range -nargs=0 SessionLast call v:lua.Util.session.last()")
vim.cmd("command! -range -nargs=0 SessionSearch call v:lua.Util.session.search()")

Util.notes = {
    index = function()
        local note_dir = vim.env.NOTE_DIR or (vim.loop.os_homedir() .. "/Documents/Notes")
        vim.cmd("edit " .. note_dir .. "/index.md")
    end,
    search = function(dir)
        local note_dir = dir or vim.env.NOTE_DIR or (vim.loop.os_homedir() .. "/Documents/Notes")
        if dir == "notes" then
            note_dir = vim.env.NOTE_DIR or "~/Documents/Notes"
        elseif dir == "school" then
            note_dir = vim.env.SCHOOL_DIR or "~/Documents/School"
        elseif dir == "dict" then
            note_dir = "~/Documents/Dictionary"
        end
        require("plugins.fzf.search").search({
            vim_cmd = "edit",
            extension = "md",
            previewer = "glow -s auto",
            dir = note_dir
        })
    end,
}
vim.cmd("command! -range -nargs=0 NoteIndex call v:lua.Util.notes.index()")
vim.cmd("command! -range -nargs=? NoteFind call v:lua.Util.notes.search(<f-args>)")

return Util
