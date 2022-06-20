-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/atalariq/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/atalariq/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/atalariq/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/atalariq/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/atalariq/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { 'require("plugins.comment").Comment()' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\2¢\4\0\0\4\0\v\0\0176\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\a\0006\2\3\0009\2\4\0029\2\5\2'\3\6\0B\2\2\2=\2\b\1B\0\2\0016\0\3\0009\0\t\0'\1\n\0B\0\2\1K\0\1\0‰\3                    imap <silent><expr> <C-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-j>'\n                    snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(1)<CR>\n                    snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>\n                    inoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>\n                \bcmd\npaths\1\0\0\vconfig\fstdpath\afn\bvim\14lazy_load luasnip.loaders.from_vscode\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { 'require("plugins.alpha")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/hhn-pham/alpha-nvim"
  },
  ["better-escape.nvim"] = {
    config = { "\27LJ\2\2’\1\0\0\3\0\n\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0016\2\6\0009\2\a\0029\2\b\2=\2\t\1B\0\2\1K\0\1\0\ftimeout\15timeoutlen\6o\bvim\fmapping\1\0\1\tkeys\15<Esc><Esc>\1\2\0\0\ajk\nsetup\18better_escape\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/better-escape.nvim",
    url = "https://github.com/max397574/better-escape.nvim"
  },
  ["clipboard-image.nvim"] = {
    config = { "\27LJ\2\2-\0\0\2\0\3\0\0046\0\0\0009\0\1\0'\1\2\0D\0\2\0\18%Y%m%d-%H%M%S\tdate\aosJ\0\0\3\0\5\0\b6\0\0\0009\0\1\0009\0\2\0'\1\3\0B\0\2\0026\1\4\0\18\2\0\0D\1\2\0\rtostring\17Image Name: \ninput\afn\bvimÚ\1\1\0\4\0\v\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\6\0005\2\3\0003\3\4\0=\3\5\2=\2\a\0015\2\b\0003\3\t\0=\3\5\2=\2\n\1B\0\2\1K\0\1\0\rmarkdown\0\1\0\3\16img_dir_txt\bimg\naffix\17![Image](%s)\fimg_dir\bimg\fdefault\1\0\0\rimg_name\0\1\0\3\16img_dir_txt\bimg\naffix\a%s\fimg_dir\bimg\nsetup\20clipboard-image\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/clipboard-image.nvim",
    url = "https://github.com/ekickx/clipboard-image.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-dictionary"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-dictionary",
    url = "https://github.com/uga-rosa/cmp-dictionary"
  },
  ["cmp-latex-symbols"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-latex-symbols",
    url = "https://github.com/kdheepak/cmp-latex-symbols"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-rg"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-rg",
    url = "https://github.com/lukas-reineke/cmp-rg"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["cmp-under-comparator"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-under-comparator",
    url = "https://github.com/lukas-reineke/cmp-under-comparator"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["curstr.nvim"] = {
    config = { 'require("plugins.curstr")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/curstr.nvim",
    url = "https://github.com/notomo/curstr.nvim"
  },
  ["dial.nvim"] = {
    config = { 'require("plugins.dial")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/dial.nvim",
    url = "https://github.com/monaqa/dial.nvim"
  },
  ["editorconfig.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/editorconfig.nvim",
    url = "https://github.com/gpanders/editorconfig.nvim"
  },
  ["emmet-vim"] = {
    commands = { "EmmetInstall" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["filetype.nvim"] = {
    config = { 'require("plugins.filetype")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["fzf-lua"] = {
    config = { 'require("plugins.fzf")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["gitlinker.nvim"] = {
    config = { "\27LJ\2\2R\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\rmappings\15<leader>gw\nsetup\14gitlinker\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/gitlinker.nvim",
    url = "https://github.com/ruifm/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { 'require("plugins.gitsigns")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim",
    wants = { "plenary.nvim" }
  },
  ["glow.nvim"] = {
    commands = { "Glow" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/glow.nvim",
    url = "https://github.com/npxbr/glow.nvim"
  },
  ["headlines.nvim"] = {
    config = { "\27LJ\2\2ö\3\0\0\4\0\19\0#6\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\0\0009\0\1\0'\1\3\0B\0\2\0016\0\0\0009\0\1\0'\1\4\0B\0\2\0016\0\0\0009\0\5\0009\0\6\0'\1\a\0005\2\b\0B\0\3\0016\0\0\0009\0\5\0009\0\6\0'\1\t\0005\2\n\0B\0\3\0016\0\v\0'\1\f\0B\0\2\0029\0\r\0005\1\17\0005\2\14\0005\3\15\0=\3\16\2=\2\18\1B\0\2\1K\0\1\0\rmarkdown\1\0\0\19headline_signs\1\3\0\0\14Headline1\14Headline2\1\0\4\21headline_pattern\b^#+\25source_pattern_start\t^```\23source_pattern_end\n^```$\17dash_pattern\v^---+$\nsetup\14headlines\frequire\1\0\1\vlinehl\14Headline2\14Headline2\1\0\1\vlinehl\14Headline1\14Headline1\16sign_define\afn&highlight CodeBlock guibg=#1c1c1c&highlight Headline2 guibg=#21262d&highlight Headline1 guibg=#1e2718\bcmd\bvim\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/headlines.nvim",
    url = "https://github.com/lukas-reineke/headlines.nvim"
  },
  ["hop.nvim"] = {
    commands = { "HopWord" },
    config = { "\27LJ\2\2[\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\2\18term_seq_bias\4\0€€€ÿ\3\tkeys\rasdfhjkl\nsetup\bhop\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { 'require("plugins.indent-blankline")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["kmonad-vim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/kmonad-vim",
    url = "https://github.com/kmonad/kmonad-vim"
  },
  ["lazygit.nvim"] = {
    commands = { "LazyGit" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["lightspeed.nvim"] = {
    config = { 'require("plugins.lightspeed")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lsp-trouble.nvim"] = {
    commands = { "Trouble", "TroubleToggle" },
    config = { 'require("plugins.trouble")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/lsp-trouble.nvim",
    url = "https://github.com/folke/lsp-trouble.nvim"
  },
  ["mapx.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/mapx.nvim",
    url = "https://github.com/b0o/mapx.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { 'require("plugins.neoscroll")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { 'require("plugins.autopairs")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    config = { 'require("plugins.bufferline")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    config = { 'require("plugins.cmp")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-fzf"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-fzf",
    url = "https://github.com/vijaymarupudi/nvim-fzf"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { 'require("lsp")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\2Ð\1\0\0\3\0\6\0\v6\0\0\0'\1\1\0B\0\2\0027\0\1\0006\0\1\0009\0\2\0005\1\3\0005\2\4\0=\2\5\1B\0\2\1K\0\1\0\nicons\1\0\6\tHINT\tï µ \nTRACE\bâœŽ\nDEBUG\tï†ˆ \tWARN\tï”© \tINFO\tï‘‰ \nERROR\tï™™ \1\0\3\22background_colour\f#161822\ftimeout\3Ð\15\vstages\22fade_in_slide_out\nsetup\vnotify\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { 'require("plugins.nvim-tree")' },
    loaded = true,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["parinfer-rust"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/parinfer-rust",
    url = "https://github.com/eraserhd/parinfer-rust"
  },
  playground = {
    commands = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  sniprun = {
    commands = { "SnipRun" },
    config = { 'require("plugins.sniprun")' },
    keys = { { "", "<Plug>SnipRun" }, { "", "<Plug>SnupClose" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/sniprun",
    url = "https://github.com/michaelb/sniprun"
  },
  ["sqlite.lua"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["startuptime.vim"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/startuptime.vim",
    url = "https://github.com/tweekmonster/startuptime.vim"
  },
  ["suda.vim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/suda.vim",
    url = "https://github.com/lambdalisue/suda.vim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { 'require("plugins.telescope")' },
    keys = { { "n", "<Leader>f" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim",
    wants = { "sqlite.lua", "plenary.nvim", "telescope-fzf-native.nvim", "telescope-media-files.nvim", "telescope-frecency.nvim" }
  },
  ["texmagic.nvim"] = {
    config = { "\27LJ\2\2ä\1\0\0\5\0\14\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\1\5\0B\0\2\0029\0\6\0005\1\f\0005\2\n\0005\3\a\0005\4\b\0=\4\t\3=\3\v\2=\2\r\1B\0\2\1K\0\1\0\fengines\1\0\0\rpdflatex\1\0\0\targs\1\6\0\0\14-pdflatex\29-interaction=nonstopmode\15-synctex=1\b-pv\a%f\1\0\1\15executable\flatexmk\nsetup\rtexmagic\frequire\nlatex\15tex_flavor\6g\bvim\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/texmagic.nvim",
    url = "https://github.com/jakewvincent/texmagic.nvim"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
  },
  ["vim-easy-align"] = {
    keys = { { "", "<Plug>(EasyAlign)" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-fugitive"] = {
    loaded = true,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-hexokinase"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-hexokinase",
    url = "https://github.com/RRethy/vim-hexokinase"
  },
  ["vim-markdown"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-markdown",
    url = "https://github.com/plasticboy/vim-markdown"
  },
  ["vim-matchup"] = {
    after_files = { "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = true,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-sayonara"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-sayonara",
    url = "https://github.com/mhinz/vim-sayonara"
  },
  ["vim-silicon"] = {
    commands = { "Silicon" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-silicon",
    url = "https://github.com/segeljakt/vim-silicon"
  },
  ["vim-table-mode"] = {
    commands = { "TableModeRealign", "TableModeToggle" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["wally.nvim"] = {
    config = { 'require("wally").colorscheme()' },
    loaded = true,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/wally.nvim",
    url = "/home/atalariq/Documents/Programming/Repo/wally.nvim"
  },
  ["which-key.nvim"] = {
    config = { 'require("plugins.which-key")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["windline.nvim"] = {
    config = { "\27LJ\2\0027\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0\24WindLineFloatToggle\bcmd\bvimR\1\0\3\0\5\0\t6\0\0\0'\1\1\0B\0\2\0016\0\2\0009\0\3\0003\1\4\0)\2,\1B\0\3\1K\0\1\0\0\rdefer_fn\bvim\21plugins.windline\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/windline.nvim",
    url = "https://github.com/windwp/windline.nvim"
  },
  ["yuck.vim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/yuck.vim",
    url = "https://github.com/elkowar/yuck.vim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  telescope = "telescope.nvim",
  ["telescope.*"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: hop.nvim
time([[Setup for hop.nvim]], true)
try_loadstring("\27LJ\2\2H\0\0\4\0\4\0\0066\0\0\0'\1\1\0'\2\2\0'\3\3\0B\0\4\1K\0\1\0\tWord\21<CMD>HopWord<CR>\14<leader>w\rnnoremap\0", "setup", "hop.nvim")
time([[Setup for hop.nvim]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\2•\1\0\0\2\0\a\0\0176\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0K\0\1\0\tsurf\17mkdp_browser\22mkdp_refresh_slow\20mkdp_auto_close\20mkdp_auto_start\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Setup for: vim-easy-align
time([[Setup for vim-easy-align]], true)
try_loadstring("\27LJ\2\2o\0\0\5\0\6\0\r6\0\0\0'\1\1\0'\2\2\0'\3\3\0'\4\4\0B\0\5\0016\0\5\0'\1\1\0'\2\2\0'\3\3\0'\4\4\0B\0\5\1K\0\1\0\rxnoremap\nAlign\vsilent\22<Plug>(EasyAlign)\aga\rnnoremap\0", "setup", "vim-easy-align")
time([[Setup for vim-easy-align]], false)
-- Setup for: vim-silicon
time([[Setup for vim-silicon]], true)
try_loadstring("\27LJ\2\2´\3\0\0\3\0\15\0\0306\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0009\0\2\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0009\0\2\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0009\0\2\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0009\0\2\0006\1\v\0009\1\f\1'\2\r\0B\1\2\2'\2\14\0&\1\2\1=\1\n\0K\0\1\0=/Pictures/Screenshots/silicon-{time:%Y-%m-%d-%H%M%S}.png\tHOME\vgetenv\aos\voutput\f#f8f8f2\15background\23FiraCode Nerd Font\tfont\fDracula\ntheme\1\0\n\rline-pad\3\3\14pad-horiz\3\30\rpad-vert\3\30\20window-controls\2\20shadow-offset-x\3\b\23shadow-blur-radius\3\5\16line-number\2\20shadow-offset-y\3\b\17round-corner\2\17shadow-color\f#434434\fsilicon\6g\bvim\0", "setup", "vim-silicon")
time([[Setup for vim-silicon]], false)
-- Setup for: vim-matchup
time([[Setup for vim-matchup]], true)
try_loadstring("\27LJ\2\2j\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\3\14highlight\vNormal\14fullwidth\2\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0", "setup", "vim-matchup")
time([[Setup for vim-matchup]], false)
time([[packadd for vim-matchup]], true)
vim.cmd [[packadd vim-matchup]]
time([[packadd for vim-matchup]], false)
-- Setup for: vim-hexokinase
time([[Setup for vim-hexokinase]], true)
try_loadstring("\27LJ\2\2›\2\0\0\2\0\b\0\r6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0K\0\1\0\1\0\2\thtml,full_hex,rgb,rgba,hsl,hsla,colour_names\bcss,full_hex,rgb,rgba,hsl,hsla,colour_names\31Hexokinase_ftOptInPatterns\1\6\0\0\rfull_hex\brgb\trgba\bhsl\thsla\29Hexokinase_optInPatterns\1\2\0\0\19backgroundfull\28Hexokinase_highlighters\6g\bvim\0", "setup", "vim-hexokinase")
time([[Setup for vim-hexokinase]], false)
time([[packadd for vim-hexokinase]], true)
vim.cmd [[packadd vim-hexokinase]]
time([[packadd for vim-hexokinase]], false)
-- Setup for: emmet-vim
time([[Setup for emmet-vim]], true)
require("plugins.emmet")
time([[Setup for emmet-vim]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\2S\0\0\4\0\4\0\0066\0\0\0'\1\1\0'\2\2\0'\3\3\0B\0\4\1K\0\1\0\21Toggle Nvim Tree\28<CMD>NvimTreeToggle<CR>\6`\rnnoremap\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
time([[packadd for nvim-tree.lua]], true)
vim.cmd [[packadd nvim-tree.lua]]
time([[packadd for nvim-tree.lua]], false)
-- Setup for: vim-better-whitespace
time([[Setup for vim-better-whitespace]], true)
try_loadstring("\27LJ\2\2Û\2\0\0\2\0\v\0\0296\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0006\0\0\0009\0\1\0)\1è\3=\1\b\0006\0\0\0009\0\1\0)\1\1\0=\1\t\0006\0\0\0009\0\1\0)\1\1\0=\1\n\0K\0\1\0'better_whitespace_skip_empty_lines\28strip_whitelines_at_eof\24strip_max_file_size\1\2\0\0\rmarkdown*better_whitespace_filetypes_blacklist\14<leader>s\31better_whitespace_operator\29strip_whitespace_on_save\30better_whitespace_enabled\6g\bvim\0", "setup", "vim-better-whitespace")
time([[Setup for vim-better-whitespace]], false)
time([[packadd for vim-better-whitespace]], true)
vim.cmd [[packadd vim-better-whitespace]]
time([[packadd for vim-better-whitespace]], false)
-- Setup for: glow.nvim
time([[Setup for glow.nvim]], true)
try_loadstring("\27LJ\2\2c\0\0\5\0\5\0\a6\0\0\0'\1\1\0'\2\2\0'\3\3\0'\4\4\0B\0\5\1K\0\1\0\27Preview File With Glow\vsilent\18<CMD>Glow<CR>\15<leader>pm\rnnoremap\0", "setup", "glow.nvim")
time([[Setup for glow.nvim]], false)
-- Setup for: vim-fugitive
time([[Setup for vim-fugitive]], true)
try_loadstring("\27LJ\2\2¡\3\0\0\4\0\23\0$6\0\0\0009\0\1\0'\1\2\0'\2\3\0B\0\3\0016\0\4\0'\1\5\0'\2\6\0'\3\a\0B\0\4\0016\0\4\0'\1\b\0'\2\t\0'\3\n\0B\0\4\0016\0\4\0'\1\v\0'\2\f\0'\3\r\0B\0\4\0016\0\4\0'\1\14\0'\2\15\0'\3\16\0B\0\4\0016\0\4\0'\1\17\0'\2\18\0'\3\19\0B\0\4\0016\0\4\0'\1\20\0'\2\21\0'\3\22\0B\0\4\1K\0\1\0\vBranch\22<CMD>G branch<CR>\15<Leader>gb\nMerge\21<CMD>G merge<CR>\15<Leader>gm\vCommit\22<CMD>G commit<CR>\15<Leader>gc\24Merge Right (3-Way)\25<CMD>diffget //3<CR>\15<Leader>gf\23Merge Left (2-Way)\25<CMD>diffget //2<CR>\15<Leader>gh\tMain\15<CMD>G<CR>\15<Leader>gg\tnmap\bGit\14<leader>g\nnname\tmapx\0", "setup", "vim-fugitive")
time([[Setup for vim-fugitive]], false)
time([[packadd for vim-fugitive]], true)
vim.cmd [[packadd vim-fugitive]]
time([[packadd for vim-fugitive]], false)
-- Setup for: lazygit.nvim
time([[Setup for lazygit.nvim]], true)
try_loadstring("\27LJ\2\2ü\2\0\0\5\0\r\1\0276\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0*\1\0\0=\1\3\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\6\0006\0\0\0009\0\1\0)\1\0\0=\1\a\0006\0\b\0'\1\t\0'\2\n\0'\3\v\0'\4\f\0B\0\5\1K\0\1\0\18Open Lazy Git\vsilent\21<CMD>LazyGit<CR>\15<leader>gt\rnnoremap\30lazygit_use_neovim_remote(lazygit_floating_window_use_plenary\1\5\0\0\bâ•­\bâ•®\bâ•°\bâ•¯)lazygit_floating_window_corner_chars+lazygit_floating_window_scaling_factor%lazygit_floating_window_winblend\6g\bvimÍ™³æ\fæÌ©ÿ\3\0", "setup", "lazygit.nvim")
time([[Setup for lazygit.nvim]], false)
-- Setup for: vim-sayonara
time([[Setup for vim-sayonara]], true)
try_loadstring("\27LJ\2\2p\0\0\6\0\5\0\b5\0\0\0006\1\1\0'\2\2\0'\3\3\0\18\4\0\0'\5\4\0B\1\5\1K\0\1\0\28Close Window/Buffer/Vim\22<CMD>Sayonara<CR>\15<C-w><C-w>\rnnoremap\1\0\1\vsilent\2\0", "setup", "vim-sayonara")
time([[Setup for vim-sayonara]], false)
time([[packadd for vim-sayonara]], true)
vim.cmd [[packadd vim-sayonara]]
time([[packadd for vim-sayonara]], false)
-- Setup for: sqlite.lua
time([[Setup for sqlite.lua]], true)
try_loadstring("\27LJ\2\2M\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\31/lib64/libsqlite3.so.0.8.6\21sqlite_clib_path\6g\bvim\0", "setup", "sqlite.lua")
time([[Setup for sqlite.lua]], false)
time([[packadd for sqlite.lua]], true)
vim.cmd [[packadd sqlite.lua]]
time([[packadd for sqlite.lua]], false)
-- Setup for: wally.nvim
time([[Setup for wally.nvim]], true)
try_loadstring("\27LJ\2\2°\1\0\0\2\0\a\0\r6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0K\0\1\0\1\a\0\0\aqf\15vista_kind\rterminal\rNvimtree\fTrouble\vpacker\19wally_sidebars\17~/.cache/wal\18wally_wal_dir\22wally_transparent\6g\bvim\0", "setup", "wally.nvim")
time([[Setup for wally.nvim]], false)
time([[packadd for wally.nvim]], true)
vim.cmd [[packadd wally.nvim]]
time([[packadd for wally.nvim]], false)
-- Setup for: suda.vim
time([[Setup for suda.vim]], true)
try_loadstring("\27LJ\2\2`\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0K\0\1\0\23[Suda] Password : \16suda#prompt\20suda_smart_edit\6g\bvim\0", "setup", "suda.vim")
time([[Setup for suda.vim]], false)
time([[packadd for suda.vim]], true)
vim.cmd [[packadd suda.vim]]
time([[packadd for suda.vim]], false)
-- Setup for: vim-markdown
time([[Setup for vim-markdown]], true)
try_loadstring('\27LJ\2\2Š\1\0\0\2\0\5\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0\22vim_markdown_math\29vim_markdown_frontmatter"vim_markdown_folding_disabled\6g\bvim\0', "setup", "vim-markdown")
time([[Setup for vim-markdown]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require("lsp")
time([[Config for nvim-lspconfig]], false)
-- Config for: fzf-lua
time([[Config for fzf-lua]], true)
require("plugins.fzf")
time([[Config for fzf-lua]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require("plugins.which-key")
time([[Config for which-key.nvim]], false)
-- Config for: gitlinker.nvim
time([[Config for gitlinker.nvim]], true)
try_loadstring("\27LJ\2\2R\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\rmappings\15<leader>gw\nsetup\14gitlinker\frequire\0", "config", "gitlinker.nvim")
time([[Config for gitlinker.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require("plugins.indent-blankline")
time([[Config for indent-blankline.nvim]], false)
-- Config for: clipboard-image.nvim
time([[Config for clipboard-image.nvim]], true)
try_loadstring("\27LJ\2\2-\0\0\2\0\3\0\0046\0\0\0009\0\1\0'\1\2\0D\0\2\0\18%Y%m%d-%H%M%S\tdate\aosJ\0\0\3\0\5\0\b6\0\0\0009\0\1\0009\0\2\0'\1\3\0B\0\2\0026\1\4\0\18\2\0\0D\1\2\0\rtostring\17Image Name: \ninput\afn\bvimÚ\1\1\0\4\0\v\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\6\0005\2\3\0003\3\4\0=\3\5\2=\2\a\0015\2\b\0003\3\t\0=\3\5\2=\2\n\1B\0\2\1K\0\1\0\rmarkdown\0\1\0\3\16img_dir_txt\bimg\naffix\17![Image](%s)\fimg_dir\bimg\fdefault\1\0\0\rimg_name\0\1\0\3\16img_dir_txt\bimg\naffix\a%s\fimg_dir\bimg\nsetup\20clipboard-image\frequire\0", "config", "clipboard-image.nvim")
time([[Config for clipboard-image.nvim]], false)
-- Config for: curstr.nvim
time([[Config for curstr.nvim]], true)
require("plugins.curstr")
time([[Config for curstr.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require("plugins.autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
require("plugins.bufferline")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: texmagic.nvim
time([[Config for texmagic.nvim]], true)
try_loadstring("\27LJ\2\2ä\1\0\0\5\0\14\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\1\5\0B\0\2\0029\0\6\0005\1\f\0005\2\n\0005\3\a\0005\4\b\0=\4\t\3=\3\v\2=\2\r\1B\0\2\1K\0\1\0\fengines\1\0\0\rpdflatex\1\0\0\targs\1\6\0\0\14-pdflatex\29-interaction=nonstopmode\15-synctex=1\b-pv\a%f\1\0\1\15executable\flatexmk\nsetup\rtexmagic\frequire\nlatex\15tex_flavor\6g\bvim\0", "config", "texmagic.nvim")
time([[Config for texmagic.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\2¢\4\0\0\4\0\v\0\0176\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\a\0006\2\3\0009\2\4\0029\2\5\2'\3\6\0B\2\2\2=\2\b\1B\0\2\0016\0\3\0009\0\t\0'\1\n\0B\0\2\1K\0\1\0‰\3                    imap <silent><expr> <C-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-j>'\n                    snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(1)<CR>\n                    snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>\n                    inoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>\n                \bcmd\npaths\1\0\0\vconfig\fstdpath\afn\bvim\14lazy_load luasnip.loaders.from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: better-escape.nvim
time([[Config for better-escape.nvim]], true)
try_loadstring("\27LJ\2\2’\1\0\0\3\0\n\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0016\2\6\0009\2\a\0029\2\b\2=\2\t\1B\0\2\1K\0\1\0\ftimeout\15timeoutlen\6o\bvim\fmapping\1\0\1\tkeys\15<Esc><Esc>\1\2\0\0\ajk\nsetup\18better_escape\frequire\0", "config", "better-escape.nvim")
time([[Config for better-escape.nvim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
require("plugins.neoscroll")
time([[Config for neoscroll.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require("plugins.nvim-tree")
time([[Config for nvim-tree.lua]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
require("plugins.comment").Comment()
time([[Config for Comment.nvim]], false)
-- Config for: wally.nvim
time([[Config for wally.nvim]], true)
require("wally").colorscheme()
time([[Config for wally.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
require("plugins.alpha")
time([[Config for alpha-nvim]], false)
-- Config for: headlines.nvim
time([[Config for headlines.nvim]], true)
try_loadstring("\27LJ\2\2ö\3\0\0\4\0\19\0#6\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\0\0009\0\1\0'\1\3\0B\0\2\0016\0\0\0009\0\1\0'\1\4\0B\0\2\0016\0\0\0009\0\5\0009\0\6\0'\1\a\0005\2\b\0B\0\3\0016\0\0\0009\0\5\0009\0\6\0'\1\t\0005\2\n\0B\0\3\0016\0\v\0'\1\f\0B\0\2\0029\0\r\0005\1\17\0005\2\14\0005\3\15\0=\3\16\2=\2\18\1B\0\2\1K\0\1\0\rmarkdown\1\0\0\19headline_signs\1\3\0\0\14Headline1\14Headline2\1\0\4\21headline_pattern\b^#+\25source_pattern_start\t^```\23source_pattern_end\n^```$\17dash_pattern\v^---+$\nsetup\14headlines\frequire\1\0\1\vlinehl\14Headline2\14Headline2\1\0\1\vlinehl\14Headline1\14Headline1\16sign_define\afn&highlight CodeBlock guibg=#1c1c1c&highlight Headline2 guibg=#21262d&highlight Headline1 guibg=#1e2718\bcmd\bvim\0", "config", "headlines.nvim")
time([[Config for headlines.nvim]], false)
-- Config for: windline.nvim
time([[Config for windline.nvim]], true)
try_loadstring("\27LJ\2\0027\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0\24WindLineFloatToggle\bcmd\bvimR\1\0\3\0\5\0\t6\0\0\0'\1\1\0B\0\2\0016\0\2\0009\0\3\0003\1\4\0)\2,\1B\0\3\1K\0\1\0\0\rdefer_fn\bvim\21plugins.windline\frequire\0", "config", "windline.nvim")
time([[Config for windline.nvim]], false)
-- Config for: filetype.nvim
time([[Config for filetype.nvim]], true)
require("plugins.filetype")
time([[Config for filetype.nvim]], false)
-- Config for: dial.nvim
time([[Config for dial.nvim]], true)
require("plugins.dial")
time([[Config for dial.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\2Ð\1\0\0\3\0\6\0\v6\0\0\0'\1\1\0B\0\2\0027\0\1\0006\0\1\0009\0\2\0005\1\3\0005\2\4\0=\2\5\1B\0\2\1K\0\1\0\nicons\1\0\6\tHINT\tï µ \nTRACE\bâœŽ\nDEBUG\tï†ˆ \tWARN\tï”© \tINFO\tï‘‰ \nERROR\tï™™ \1\0\3\22background_colour\f#161822\ftimeout\3Ð\15\vstages\22fade_in_slide_out\nsetup\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: lightspeed.nvim
time([[Config for lightspeed.nvim]], true)
require("plugins.lightspeed")
time([[Config for lightspeed.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require("plugins.cmp")
time([[Config for nvim-cmp]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Silicon lua require("packer.load")({'vim-silicon'}, { cmd = "Silicon", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TableModeToggle lua require("packer.load")({'vim-table-mode'}, { cmd = "TableModeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file EmmetInstall lua require("packer.load")({'emmet-vim'}, { cmd = "EmmetInstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipRun lua require("packer.load")({'sniprun'}, { cmd = "SnipRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopWord lua require("packer.load")({'hop.nvim'}, { cmd = "HopWord", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'lsp-trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TableModeRealign lua require("packer.load")({'vim-table-mode'}, { cmd = "TableModeRealign", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LazyGit lua require("packer.load")({'lazygit.nvim'}, { cmd = "LazyGit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Glow lua require("packer.load")({'glow.nvim'}, { cmd = "Glow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSHighlightCapturesUnderCursor lua require("packer.load")({'playground'}, { cmd = "TSHighlightCapturesUnderCursor", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'lsp-trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <Plug>(EasyAlign) <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "<lt>Plug>(EasyAlign)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>SnupClose <cmd>lua require("packer.load")({'sniprun'}, { keys = "<lt>Plug>SnupClose", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>f <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>Leader>f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>SnipRun <cmd>lua require("packer.load")({'sniprun'}, { keys = "<lt>Plug>SnipRun", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-table-mode', 'vim-markdown', 'markdown-preview.nvim', 'glow.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType text ++once lua require("packer.load")({'vim-table-mode'}, { ft = "text" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'gitsigns.nvim'}, { event = "BufEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
