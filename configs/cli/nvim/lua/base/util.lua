_G.Util = {}

Util.t = function(cmd)
    return vim.api.nvim_replace_termcodes(cmd, true, true, true)
end

Util.check_back_space = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

-- see lua/plugins/autopairs.lua for context
-- Use nvim-autopairs cr instead
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

-- see lua/plugins/autopairs.lua for context
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
    if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(Util.t("<C-n>"), "n")
    elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(Util.t("<Plug>luasnip-expand-or-jump"), "")
    elseif Util.check_back_space() then
        vim.fn.feedkeys(Util.t("<Tab>"), "n")
    else
        fallback()
    end
end

-- see lua/plugins/cmp.lua for context
Util.s_tab_complete = function(fallback)
    if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(Util.t("<C-p>"), "n")
    elseif require("luasnip").jumpable(-1) then
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

    require("lsp_signature").on_attach({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        hint_enable = false, -- virtual hint enable
        handler_opts = {
            border = Util.borders, -- double, single, shadow, none
        },
    }, bufnr)
    require("lsp.keys").mappings()
end

Util.lsp_on_init = function(client)
    -- print("Language Server Protocol started!")
    vim.notify("Language Server Client successfully started!", "info", {
        title = client.name:upper(),
    })
end

local session_dir = vim.fn.expand(vim.fn.stdpath("cache") .. "/sessions/")
local last_session = session_dir .. "last.vim"
local persistence_exist, persistence = pcall(require, "persistence")

Util.session = {
    save = function()
        if persistence_exist then
            persistence.save()
        else
            vim.cmd("mksession! " .. last_session)
        end
    end,
    last = function()
        if persistence_exist then
            persistence.load({ last = true })
        else
            vim.cmd("source " .. last_session)
        end
    end,
}

Util.notes = {
    index = function()
        local note_dir = vim.env.ZK_NOTEBOOK_DIR or (vim.env.HOME .. "/Documents/Notes/Zettelkasten")
        vim.cmd("edit "..note_dir.."/index.md")
    end,
    search = function ()
        local present = pcall(require("telescope").extensions.zk.zk_notes)
        if present then
            require("telescope").extensions.zk.zk_notes()
        end
    end
}

return Util
