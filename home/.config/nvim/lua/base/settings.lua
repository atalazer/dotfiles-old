require("utils.opts")

-- Function to apply options table
local apply_options = function(opts)
    for k, v in pairs(opts) do
        vim.opt[k] = v
    end
end

-- Settings vim options
local options = {
    -- Booleans
    autoread = true,
    autochdir = true,
    autoindent = true,
    backup = false,
    cursorline = true,
    cursorcolumn = false,
    expandtab = true,
    hidden = true,
    hlsearch = false,
    ignorecase = true,
    lazyredraw = true,
    list = true,
    number = true,
    relativenumber = false,
    showmode = false,
    smartcase = true,
    smartindent = true,
    smarttab = true,
    splitbelow = true,
    splitright = true,
    startofline = false,
    swapfile = false,
    termguicolors = true,
    undofile = false,
    wrap = true,
    writebackup = false,

    -- String
    background = "dark",
    backspace = "eol,start,indent",
    backupcopy = "yes",
    clipboard = "unnamedplus",
    completeopt = { "menu", "menuone", "noselect", "noinsert" },
    encoding = "UTF-8",
    -- foldmethod  = "expr",
    -- foldexpr    = "nvim_treesitter#foldexpr()",
    fillchars = { vert = "│", eob = " " },
    inccommand = "split",
    listchars = {
        tab = "  ",
        eol = "↴",
        nbsp = "_",
        trail = "·",
        extends = "❯",
        precedes = "❮",
    },
    matchpairs = { ["("] = ")", ["["] = "]", ["{"] = "}", ["<"] = ">" },
    mouse = "a",
    signcolumn = "yes",
    shortmess = "csa",
    showbreak = "↳ ",
    t_Co = "256",
    undodir = "~/.local/share/nvim/undo",

    -- Number
    colorcolumn = 100,
    cmdheight = 1,
    laststatus = 2,
    pumheight = 10,
    re = 0,
    redrawtime = 500,
    scrolloff = 2,
    sidescroll = 2,
    sidescrolloff = 15,
    shiftwidth = 4,
    tabstop = 4,
    timeoutlen = 400,
    updatetime = 100,
}
-- Others options
vim.g.python_host_prog = "/usr/bin/python"
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.node_host_prog = "/home/atalariq/.nvm/versions/node/v14.15.4/bin/neovim-node-host"

-- Call apply_options func
apply_options(options)
