-- ==================================== Global settings
vim.g.mapleader = "."
vim.g.maplocalleader = ","

-- Others options
vim.g.python_host_prog  = "/usr/bin/python"
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.node_host_prog    = "/home/atalariq/.fnm/node-versions/v14.16.1/installation/bin/neovim-node-host"

-- prevent typo when pressing `wq` or `q`
vim.cmd([[
    cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
    cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
    cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
    cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
]])

-- change cwd to current directory
vim.cmd("cd %:p:h")

RC = {
    colorscheme = "material",
    use_xresources = false,
    plug_disabled = {
        biscuits = true,
    },
}

local modules = {
    "base.plugins",
    "base.settings",
    "base.events",
    "base.commands",
    "base.keys",
    "base.appearances",
    "lsp",
}

local errors = {}
for _, v in pairs(modules) do
    local ok, err = pcall(require, v)
    if not ok then
        table.insert(errors, err)
    end
end

if not vim.tbl_isempty(errors) then
    for _, v in pairs(errors) do
        print(v)
    end
end
