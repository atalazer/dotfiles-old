local o = vim.opt

-- Booleans
o.autoread = true
o.autochdir = true
o.autoindent = true
o.backup = false
o.breakindent = true
o.cursorline = true
o.expandtab = true
o.hidden = true
o.ignorecase = true
o.joinspaces = false
o.lazyredraw = true
o.list = true
o.number = true
o.relativenumber = true
o.showmode = false
o.smartcase = true
o.smartindent = true
o.smarttab = true
o.splitbelow = true
o.splitright = true
o.startofline = false
o.swapfile = false
o.termguicolors = true
o.ttyfast = true
o.undofile = false
o.wrap = false
o.writebackup = false

-- String
o.backspace = "eol,start,indent"
o.backupcopy = "yes"
o.clipboard = "unnamedplus"
-- o.completeopt = { "menu", "menuone", "noselect", "noinsert" }
o.completeopt:remove("preview")
o.encoding = "utf-8"
o.fillchars = { vert = "│", eob = " ", fold = " ", diff = " " }
-- o.formatoptions = o.formatoptions - "a" - "t" + "c" + "q" - "o" + "r" + "n" + "j" - "2"
o.formatoptions:remove("cro")
-- o.foldmethod = "marker"
o.foldopen = { "percent", "search" }
-- o.foldcolumn     = "1"
-- o.foldexpr       = "nvim_treesitter#foldexpr()"
-- o.foldlevel      = 0
-- o.foldnestmax    = 1
o.inccommand = "split"
o.listchars = {
    tab = "  ",
    eol = "↴",
    nbsp = "_",
    trail = "·",
    extends = "❯",
    precedes = "❮",
}
o.mouse = "a"
o.signcolumn = "yes:2"
o.shortmess = "csa"
o.showbreak = "↪"
o.breakindentopt = "shift:2"
o.undodir = vim.fn.stdpath("data") .. "/undo"

-- Number
-- o.colorcolumn = { "120" }
o.cmdheight = 2
o.laststatus = 2
o.pumheight = 12
o.pumwidth = 15
o.regexpengine = 0
o.scrolloff = 2
o.sidescroll = 2
o.sidescrolloff = 15
o.shiftwidth = 4
o.softtabstop = 4
o.tabstop = 4
-- o.textwidth = 120
-- o.timeoutlen = 300
o.titlelen = 20
-- o.updatetime = 1000
