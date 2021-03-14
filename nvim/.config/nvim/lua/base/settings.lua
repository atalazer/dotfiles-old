local cmd = vim.api.nvim_command

local apply_options = function(opts)
	for k, v in pairs(opts) do
		if v == true then
			cmd("set " .. k)
		elseif v == false then
			cmd(string.format("set no%s", k))
		else
			cmd(string.format("set %s=%s", k, v))
		end
	end
end

local options = {
	compatible = false,
	autochdir = true,
	lazyredraw = true,
	ttyfast = true,
	mouse = "a",

	sessionoptions = "curdir,help,tabpages,winsize",
	viewoptions = "folds,cursor,curdir,slash,unix",

	fileformats = "unix",
	magic = true,
	virtualedit = "block",
	encoding = "UTF-8",

	hidden = true,
	autoread = true,
	autowrite = true,

	backup = false,
	writebackup = false,
	swapfile = false,
	undofile = false,
	undodir = "~/.local/share/nvim/undo",

	wrap = true,
	wrapscan = true,
	whichwrap = "h,l,<,>,[,],~",
	formatoptions = "jcroql",

	display = "lastline",
	-- clipboard = "unnamed",
	clipboard = "unnamedplus",

	diffopt = "filler,iwhite,internal,algorithm:patience",
	jumpoptions = "stack",
	completeopt = "menu,menuone,noselect,noinsert",
	pumblend = 10,
	pumheight = 10,
	helpheight = 12,
	previewheight = 12,
	re = 0,

	foldenable = false,
	foldlevel = 0,
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()",
	foldlevelstart = 99,

	title = true,
	guifont = "JetBrainsMono\\ Nerd\\ Font\\ 11",
	termguicolors = true,
	background = "dark",
	t_Co = 256,

	relativenumber = false,
	number = true,
	cursorline = true,
	showmode = false,
	laststatus = 2,

	wildmenu = true,
	wildmode = "full",
	wildoptions = "pum",
	wildignorecase = true,

	inccommand = "nosplit",
	showcmd = false,
	cmdheight = 2,
	cmdwinheight = 5,

	list = true,
	listchars = "eol:↴,tab:»\\ ,nbsp:_,trail:·,extends:❯,precedes:❮",
	fillchars = "vert:│,eob:\\ ",
	showbreak = "↳⋅",
	shortmess = "csa",
	signcolumn = "yes",
	conceallevel = 1,

	splitbelow = true,
	splitright = true,
	startofline = false,

	linebreak = true,
	linespace = 0,

	synmaxcol = 300,
	sidescroll = 2,
	sidescrolloff = 15,

	hlsearch = false,
	smartcase = true,
	ignorecase = true,
	infercase = true,
	incsearch = true,

	backspace = "eol,start,indent",
	autoindent = true,
	expandtab = true,
	shiftwidth = 4,
	smartindent = true,
	smarttab = true,
	softtabstop = 4,
	shiftround = true,

	errorbells = false,
	visualbell = false,

	timeout = true,
	ttimeout = true,
	timeoutlen = 500,
	ttimeoutlen = 10,
	updatetime = 100,
	redrawtime = 500,

}

apply_options(options)
vim.g.python_host_prog = '/usr/bin/python'
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.node_host_prog = "/home/atalariq/.nvm/versions/node/v14.15.4/bin/neovim-node-host"

