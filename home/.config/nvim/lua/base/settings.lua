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
    lazyredraw = false,
    list = true,
    magic = true,
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
    foldmethod = "marker",
    fillchars = { vert = "│", eob = " " },
    guicursor = {
        ["n-v-c"] = "block",
        ["i-ci"] = "ver25",
        ["r-cr"] = "hor25",
        o = "hor50",
        a = "blinkwait800-blinkoff500-blinkon300-Cursor/lCursor",
        sm = "block-blinkwait175-blinkoff150-blinkon175"
    },
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
    matchpairs = { ["("] = ")", ["["] = "]", ["{"] = "}", ["<"] = ">" },
    mouse = "a",
    shell = "$SHELL",
    signcolumn = "yes",
    shortmess = "csa",
    showbreak = "↪",
    t_Co = "256",
    undodir = "~/.local/share/nvim/undo",

    -- Number
    -- colorcolumn = 100,
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
    updatetime = 150,
}

-- Call apply_options func
apply_options(options)
