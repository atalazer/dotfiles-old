-- Settings vim options
local options = {
    -- Booleans
    autochdir      = true,
    autoread       = true,
    autowrite      = true,
    autoindent     = true,
    backup         = false,
    compatible     = false,
    cursorline     = true,
    cursorcolumn   = false,
    expandtab      = true,
    errorbells     = false,
    foldenable     = false,
    hidden         = true,
    hlsearch       = false,
    ignorecase     = true,
    infercase      = true,
    incsearch      = true,
    lazyredraw     = true,
    list           = true,
    linebreak      = true,
    magic          = true,
    number         = true,
    relativenumber = false,
    swapfile       = false,
    showmode       = false,
    showcmd        = false,
    splitbelow     = true,
    splitright     = true,
    startofline    = false,
    smartcase      = true,
    smartindent    = true,
    smarttab       = true,
    shiftround     = true,
    ttyfast        = true,
    title          = true,
    termguicolors  = true,
    timeout        = true,
    ttimeout       = true,
    undofile       = false,
    visualbell     = false,
    wildmenu       = true,
    wildignorecase = true,
    wrap           = true,
    wrapscan       = true,
    writebackup    = false,

    -- String
    background    = "dark",
    backspace     = "eol,start,indent",
    clipboard     = "unnamedplus",
    completeopt   = "menu,menuone,noselect,noinsert",
    display       = "lastline",
    encoding      = "UTF-8",
    foldmethod    = "expr",
    foldexpr      = "nvim_treesitter#foldexpr()",
    formatoptions = "jcroql",
    fileformats   = "unix",
    fillchars     = "vert:│,eob:\\ ",
    inccommand    = "nosplit",
    listchars     = "eol:↴,tab:»\\ ,nbsp:_,trail:·,extends:❯,precedes:❮",
    matchpairs    = "(:),[:],{:},<:>",
    mouse         = "a",
    signcolumn    = "yes",
    shortmess     = "csa",
    showbreak     = "↳⋅",
    undodir       = "~/.local/share/nvim/undo",
    virtualedit   = "block",
    whichwrap     = "h,l,<,>,[,],~",
    wildmode      = "full",
    wildoptions   = "pum",

    -- Number
    cmdheight      = 2,
    cmdwinheight   = 5,
    conceallevel   = 1,
    foldlevel      = 0,
    foldlevelstart = 99,
    helpheight     = 12,
    laststatus     = 2,
    linespace      = 0,
    pumblend       = 10,
    pumheight      = 10,
    previewheight  = 12,
    redrawtime     = 500,
    re             = 0,
    sidescroll     = 2,
    sidescrolloff  = 15,
    shiftwidth     = 4,
    softtabstop    = 4,
    synmaxcol      = 300,
    t_Co           = 256,
    timeoutlen     = 400,
    ttimeoutlen    = 30,
    updatetime     = 150,


}
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

-- Others options
vim.g.python_host_prog = "/usr/bin/python"
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.node_host_prog = "/home/atalariq/.nvm/versions/node/v14.15.4/bin/neovim-node-host"

