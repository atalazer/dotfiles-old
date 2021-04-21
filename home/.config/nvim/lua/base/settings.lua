-- Settings vim options
local options = {
    -- Booleans
    autoread       = true,
    autochdir      = true,
    autoindent     = true,
    backup         = false,
    compatible     = false,
    cursorline     = true,
    cursorcolumn   = false,
    expandtab      = true,
    errorbells     = false,
    hidden         = true,
    hlsearch       = false,
    ignorecase     = true,
    incsearch      = true,
    lazyredraw     = true,
    list           = true,
    number         = true,
    relativenumber = false,
    swapfile       = false,
    showmode       = false,
    splitbelow     = true,
    splitright     = true,
    startofline    = false,
    smartcase      = true,
    smartindent    = true,
    smarttab       = true,
    ttyfast        = true,
    termguicolors  = true,
    undofile       = false,
    visualbell     = false,
    wrap           = true,
    writebackup    = false,

    -- String
    background  = "dark",
    backspace   = "eol,start,indent",
    backupcopy  = "yes",
    clipboard   = "unnamedplus",
    completeopt = "menu,menuone,noselect,noinsert",
    encoding    = "UTF-8",
    foldmethod  = "marker",
    -- foldmethod    = "expr",
    -- foldexpr      = "nvim_treesitter#foldexpr()",
    fillchars     = "vert:│,eob:\\ ",
    inccommand    = "split",
    listchars     = "tab:\\ \\ ,eol:↴,nbsp:_,trail:·,extends:❯,precedes:❮",
    matchpairs    = "(:),[:],{:},<:>",
    mouse         = "a",
    signcolumn    = "yes",
    shortmess     = "csa",
    showbreak     = "↳ ",
    undodir       = "~/.local/share/nvim/undo",

    -- Number
    colorcolumn   = 100,
    cmdheight     = 1,
    laststatus    = 2,
    pumheight     = 10,
    re            = 0,
    scrolloff     = 2,
    sidescroll    = 2,
    sidescrolloff = 8,
    shiftwidth    = 4,
    -- synmaxcol      = 300,
    tabstop    = 4,
    timeoutlen = 400,
    updatetime = 100,

}
-- Others options
vim.g.python_host_prog = "/usr/bin/python"
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.node_host_prog = "/home/atalariq/.nvm/versions/node/v14.15.4/bin/neovim-node-host"

-- Function to apply options table
local apply_options = function(opts)
    for k, v in pairs(opts) do
        if v == true then
            vim.cmd("set " .. k)
        elseif v == false then
            vim.cmd(string.format("set no%s", k))
        else
            vim.cmd(string.format("set %s=%s", k, v))
        end
    end
end

-- Call apply_options func
apply_options(options)

