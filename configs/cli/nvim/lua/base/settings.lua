local o = vim.opt

-- Settings vim options
local options = {
    -- Booleans
    autoread = true,
    autochdir = true,
    autoindent = true,
    backup = false,
    breakindent = true,
    cursorline = true,
    expandtab = true,
    hidden = true,
    ignorecase = true,
    joinspaces = false,
    lazyredraw = true,
    list = true,
    number = true,
    relativenumber = true,
    showmode = false,
    smartcase = true,
    smartindent = true,
    smarttab = true,
    splitbelow = true,
    splitright = true,
    startofline = false,
    swapfile = false,
    termguicolors = true,
    ttyfast = true,
    undofile = false,
    wrap = false,
    writebackup = false,

    -- String
    backspace = "eol,start,indent",
    backupcopy = "yes",
    clipboard = "unnamedplus",
    -- completeopt = { "menu", "menuone", "noselect", "noinsert" },         -- Handle by nvim-cmp
    encoding = "UTF-8",
    fillchars = { vert = "│", eob = " ", fold = " ", diff = " " },
    formatoptions = o.formatoptions - "a" - "t" + "c" + "q" - "o" + "r" + "n" + "j" - "2",
    -- foldmethod = "marker",
    foldopen = { "percent", "search" },
    -- foldcolumn     = "1",
    -- foldexpr       = "nvim_treesitter#foldexpr()",
    -- foldlevel      = 0,
    -- foldnestmax    = 1,
    inccommand = "split",
    listchars = {
        tab = "  ",
        eol = "↴",
        nbsp = "_",
        trail = "·",
        extends = "❯",
        precedes = "❮",
    },
    mouse = "a",
    signcolumn = "yes:2",
    shortmess = "csa",
    showbreak = "↪",
    breakindentopt = "shift:2",
    undodir = vim.fn.stdpath("data") .. "/undo",
    sessionoptions = "blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal",

    -- Number
    -- colorcolumn = { "120" },
    cmdheight = 2,
    laststatus = 2,
    pumheight = 12,
    pumwidth = 15,
    regexpengine = 0,
    scrolloff = 2,
    sidescroll = 2,
    sidescrolloff = 15,
    shiftwidth = 4,
    softtabstop = 4,
    tabstop = 4,
    textwidth = 120,
    timeoutlen = 300,
    updatetime = 1000,
}

-- Function to apply options table
local apply_options = function(opts)
    for k, v in pairs(opts) do
        vim.opt[k] = v
    end
end

-- Call apply_options func for options
apply_options(options)
