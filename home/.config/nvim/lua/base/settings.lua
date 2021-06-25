local o = vim.opt

-- Settings vim options
local options = {
    -- Booleans
    autoread = true,
    autochdir = true,
    autoindent = true,
    backup = false,
    cursorline = true,
    expandtab = true,
    hidden = true,
    ignorecase = true,
    joinspaces = false,
    lazyredraw = false,
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
    wrap = true,
    writebackup = false,

    -- String
    background = "dark",
    backspace = "eol,start,indent",
    backupcopy = "yes",
    clipboard = "unnamedplus",
    completeopt = { "menu", "menuone", "noselect", "noinsert" },
    encoding = "UTF-8",
    fillchars = { vert = "│", eob = " ", fold = " ", diff = " " },
    formatoptions = o.formatoptions - "a" - "t" + "c" + "q" - "o" + "r" + "n" + "j" - "2",
    foldmethod = "manual",
    foldopen = { "percent", "search" },
    -- foldcolumn     = "1",
    -- foldexpr       = "nvim_treesitter#foldexpr()",
    -- foldlevel      = 0,
    -- foldnestmax    = 1,
    inccommand = "split",
    listchars = {
        -- tab = "  ",
        tab = "→ ",
        eol = "↴",
        nbsp = "_",
        trail = "·",
        extends = "❯",
        precedes = "❮",
    },
    mouse = "a",
    shell = "/usr/bin/bash", -- use bash instead of zsh
    signcolumn = "yes",
    shortmess = "csa",
    showbreak = "↪",
    undodir = "~/.local/share/nvim/undo",

    -- Number
    colorcolumn = { "120" },
    cmdheight = 2,
    laststatus = 2,
    pumheight = 10,
    re = 0,
    scrolloff = 3,
    sidescroll = 3,
    sidescrolloff = 15,
    shiftwidth = 4,
    tabstop = 4,
    timeoutlen = 400,
    updatetime = 100,
}

-- Function to apply options table
local apply_options = function(opts)
    for k, v in pairs(opts) do
        o[k] = v
    end
end

-- Call apply_options func for options
apply_options(options)
