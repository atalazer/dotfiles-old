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
local package_path_str = "/home/atalariq/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/atalariq/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/atalariq/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/atalariq/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/atalariq/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
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
    config = { "\27LJ\1\2^\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequire�\1\1\0\3\0\f\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0:\2\t\0011\2\n\0:\2\v\1>\0\2\1G\0\1\0\rpre_hook\0\ropleader\1\0\2\nblock\agb\tline\agc\ftoggler\1\0\2\nblock\bgbc\tline\bgcc\rmappings\1\0\2\nextra\1\nbasic\2\1\0\2\vignore\a^$\fpadding\2\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\1\2�\4\0\0\4\0\v\0\0174\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\a\0004\2\3\0007\2\4\0027\2\5\2%\3\6\0>\2\2\2:\2\b\1>\0\2\0014\0\3\0007\0\t\0%\1\n\0>\0\2\1G\0\1\0�\3                    imap <silent><expr> <C-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-j>'\n                    snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(1)<CR>\n                    snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>\n                    inoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>\n                \bcmd\npaths\1\0\0\vconfig\fstdpath\afn\bvim\14lazy_load luasnip.loaders.from_vscode\frequire\0" },
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
    config = { "\27LJ\1\2�\1\0\0\3\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0014\2\6\0007\2\a\0027\2\b\2:\2\t\1>\0\2\1G\0\1\0\ftimeout\15timeoutlen\6o\bvim\fmapping\1\0\1\tkeys\15<Esc><Esc>\1\2\0\0\ajk\nsetup\18better_escape\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/better-escape.nvim",
    url = "https://github.com/max397574/better-escape.nvim"
  },
  ["cheat.sh-vim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/cheat.sh-vim",
    url = "https://github.com/dbeniamine/cheat.sh-vim"
  },
  ["clipboard-image.nvim"] = {
    config = { "\27LJ\1\2-\0\0\2\0\3\0\0044\0\0\0007\0\1\0%\1\2\0@\0\2\0\18%Y%m%d-%H%M%S\tdate\aos�\1\1\0\4\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\6\0003\2\3\0001\3\4\0:\3\5\2:\2\a\0013\2\b\0:\2\t\1>\0\2\1G\0\1\0\rmarkdown\1\0\3\16img_dir_txt\bimg\naffix\17![Image](%s)\fimg_dir\bimg\fdefault\1\0\0\rimg_name\0\1\0\3\16img_dir_txt\bimg\naffix\a%s\fimg_dir\bimg\nsetup\20clipboard-image\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/clipboard-image.nvim",
    url = "https://github.com/ekickx/clipboard-image.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
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
  ["cmp-spell"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["curstr.nvim"] = {
    config = { "\27LJ\1\2�\a\0\0\14\0001\0c3\0\16\0002\1\17\0003\2\0\0;\2\1\0013\2\1\0;\2\2\0013\2\2\0;\2\3\0013\2\3\0;\2\4\0013\2\4\0;\2\5\0013\2\5\0;\2\6\0013\2\6\0;\2\a\0013\2\a\0;\2\b\0013\2\b\0;\2\t\0013\2\t\0;\2\n\0013\2\n\0;\2\v\0013\2\v\0;\2\f\0013\2\f\0;\2\r\0013\2\r\0;\2\14\0013\2\14\0;\2\15\0013\2\15\0;\2\16\1:\1\17\0003\1\21\0003\2\19\0003\3\18\0:\3\20\2:\2\22\0013\2\23\0002\3\0\0:\3\20\2:\2\17\0012\2\0\0004\3\24\0007\4\17\0>\3\2\4T\6\25�3\b\26\0003\t\25\0:\t\20\b3\t\27\0002\n\3\0008\v\1\a;\v\1\n8\v\2\a;\v\2\n:\n\28\t:\t\29\b%\t\30\0\16\n\6\0$\t\n\t9\b\t\0024\t\31\0007\t \t7\n\17\0017\n\20\n4\v!\0%\f\30\0\16\r\6\0$\f\r\f>\v\2\0=\t\1\1A\6\3\3N\6�4\3\"\0007\3#\3%\4$\0\16\5\1\0\16\6\2\0>\3\4\2\16\1\3\0004\3%\0%\4&\0>\3\2\0027\3'\0033\4(\0:\1)\0043\5.\0003\6+\0003\a*\0:\a\29\0063\a,\0:\a-\6:\6/\5:\0050\4>\3\2\1G\0\1\0\fsources\26vim/autoload_function\1\0\0\14filetypes\1\4\0\0\bvim\vpython\blua\1\0\0\1\0\1\21include_packpath\2\19source_aliases\1\0\0\nsetup\vcurstr\frequire\nforce\15tbl_extend\bvim\rtostring\vinsert\ntable\tword\topts\nwords\1\0\1\15normalized\2\1\0\0\1\2\0\0\19togglable/word\vipairs\1\0\0\ropenable\1\0\0\nnames\1\0\0\1\6\0\0\17vim/function\16vim/runtime\14directory\tfile\blua\14togglable\1\0\0\1\3\0\0\rvertical\15horizontal\1\3\0\0\tnext\rprevious\1\3\0\0\nlight\tdark\1\3\0\0\nwhite\nblack\1\3\0\0\afg\abg\1\3\0\0\15foreground\15background\1\3\0\0\valways\nnever\1\3\0\0\nright\tleft\1\3\0\0\btop\vbottom\1\3\0\0\topen\nclose\1\3\0\0\aor\band\1\3\0\0\aon\boff\1\3\0\0\byes\ano\1\3\0\0\venable\fdisable\1\3\0\0\ttrue\nfalse\1\3\0\0\0061\0060\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/curstr.nvim",
    url = "https://github.com/notomo/curstr.nvim"
  },
  ["dial.nvim"] = {
    config = { "\27LJ\1\2�\1\0\0\3\0\6\0\b4\0\0\0%\1\1\0>\0\2\0027\1\2\0007\1\3\0013\2\5\0:\2\4\1G\0\1\0\1\n\0\0\19number#decimal\15number#hex\18number#binary\14color#hex\17date#[%H:%M]\20date#[%Y-%m-%d]\25char#alph#small#word\27char#alph#capital#word\27markup#markdown#header\vnormal\15searchlist\vconfig\tdial\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/dial.nvim",
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
    config = { "\27LJ\1\2R\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\rmappings\15<leader>gw\nsetup\14gitlinker\frequire\0" },
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
    config = { "\27LJ\1\2�\2\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\a\25grey_out_search_area\2\24jump_to_first_match\2)jump_on_partial_input_safety_timeout\3�\3+match_only_the_start_of_same_char_seqs\2\30full_inclusive_prefix_key\n<C-x>\27highlight_unique_chars\1\21limit_ft_matches\3\b\nsetup\15lightspeed\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/lightspeed.nvim",
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
  ["mkdnflow.nvim"] = {
    config = { "\27LJ\1\2�\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\14filetypes\1\0\3\amd\2\brmd\2\rmarkdown\2\1\0\5\20new_file_prefix\25os.date('%Y-%m-%d-')\16create_dirs\2\20evaluate_prefix\2\21default_mappings\2\22links_relative_to\nfirst\nsetup\rmkdnflow\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/mkdnflow.nvim",
    url = "https://github.com/jakewvincent/mkdnflow.nvim"
  },
  neorg = {
    config = { 'require("plugins.neorg")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/neorg",
    url = "https://github.com/nvim-neorg/neorg",
    wants = { "plenary.nvim" }
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
  ["nvim-align"] = {
    config = { "\27LJ\1\2\0\0\4\0\b\0\0184\0\0\0%\1\1\0>\0\2\0014\0\2\0007\0\3\0007\0\4\0004\1\2\0007\1\3\0017\1\5\1>\1\1\0=\0\0\0024\1\2\0007\1\6\1%\2\a\0\16\3\0\0$\2\3\2>\1\2\1G\0\1\0\vAlign \bcmd\fgetchar\fnr2char\afn\bvim\fAlign: \nprint#\1\0\2\0\3\0\0044\0\0\0001\1\2\0:\1\1\0G\0\1\0\0\nalign\tUtil\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-align",
    url = "https://github.com/RRethy/nvim-align"
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
    config = { "\27LJ\1\2�\1\0\0\3\0\6\0\v4\0\0\0%\1\1\0>\0\2\0025\0\1\0004\0\1\0007\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\nicons\1\0\6\tHINT\t \nTRACE\b✎\nDEBUG\t \tWARN\t \tINFO\t \nERROR\t \1\0\3\22background_colour\f#161822\ftimeout\3�\15\vstages\22fade_in_slide_out\nsetup\vnotify\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2�\r\0\0\t\0K\0�\0014\0\0\0%\1\1\0>\0\2\0027\0\2\0004\1\0\0%\2\3\0>\1\2\0027\1\4\0013\2\5\0003\3\6\0:\3\a\0023\3\b\0002\4\0\0:\4\t\3:\3\n\0023\3\v\0:\3\f\0023\3\r\0003\4\14\0002\5\29\0003\6\15\0\16\a\0\0%\b\16\0>\a\2\2:\a\17\6;\6\1\0053\6\18\0\16\a\0\0%\b\19\0>\a\2\2:\a\17\6;\6\2\0053\6\20\0\16\a\0\0%\b\21\0>\a\2\2:\a\17\6;\6\3\0053\6\22\0\16\a\0\0%\b\23\0>\a\2\2:\a\17\6;\6\4\0053\6\24\0\16\a\0\0%\b\25\0>\a\2\2:\a\17\6;\6\5\0053\6\26\0\16\a\0\0%\b\27\0>\a\2\2:\a\17\6;\6\6\0053\6\28\0\16\a\0\0%\b\29\0>\a\2\2:\a\17\6;\6\a\0053\6\30\0\16\a\0\0%\b\31\0>\a\2\2:\a\17\6;\6\b\0053\6 \0\16\a\0\0%\b!\0>\a\2\2:\a\17\6;\6\t\0053\6\"\0\16\a\0\0%\b#\0>\a\2\2:\a\17\6;\6\n\0053\6$\0\16\a\0\0%\b%\0>\a\2\2:\a\17\6;\6\v\0053\6&\0\16\a\0\0%\b'\0>\a\2\2:\a\17\6;\6\f\0053\6(\0\16\a\0\0%\b)\0>\a\2\2:\a\17\6;\6\r\0053\6*\0\16\a\0\0%\b+\0>\a\2\2:\a\17\6;\6\14\0053\6,\0\16\a\0\0%\b-\0>\a\2\2:\a\17\6;\6\15\0053\6.\0\16\a\0\0%\b/\0>\a\2\2:\a\17\6;\6\16\0053\0060\0\16\a\0\0%\b1\0>\a\2\2:\a\17\6;\6\17\0053\0062\0\16\a\0\0%\b3\0>\a\2\2:\a\17\6;\6\18\0053\0064\0\16\a\0\0%\b5\0>\a\2\2:\a\17\6;\6\19\0053\0066\0\16\a\0\0%\b7\0>\a\2\2:\a\17\6;\6\20\0053\0068\0\16\a\0\0%\b9\0>\a\2\2:\a\17\6;\6\21\0053\6:\0\16\a\0\0%\b;\0>\a\2\2:\a\17\6;\6\22\0053\6<\0\16\a\0\0%\b=\0>\a\2\2:\a\17\6;\6\23\0053\6>\0\16\a\0\0%\b?\0>\a\2\2:\a\17\6;\6\24\0053\6@\0\16\a\0\0%\bA\0>\a\2\2:\a\17\6;\6\25\0053\6B\0\16\a\0\0%\bC\0>\a\2\2:\a\17\6;\6\26\0053\6D\0\16\a\0\0%\bE\0>\a\2\2:\a\17\6;\6\27\0053\6F\0\16\a\0\0%\bG\0>\a\2\2:\a\17\6;\6\28\5:\5H\4:\4I\3:\3J\2>\1\2\1G\0\1\0\tview\rmappings\tlist\16toggle_help\1\0\1\bkey\6?\nclose\1\0\1\bkey\6q\16system_open\1\0\1\bkey\6O\vdir_up\1\0\1\bkey\6-\18next_git_item\1\0\1\bkey\a]c\18prev_git_item\1\0\1\bkey\a[c\23copy_absolute_path\1\0\1\bkey\agy\14copy_path\1\0\1\bkey\6Y\14copy_name\1\0\1\bkey\6y\npaste\1\0\1\bkey\6p\tcopy\1\0\1\bkey\6c\bcut\1\0\1\bkey\6x\16full_rename\1\0\1\bkey\6R\vrename\1\0\1\bkey\6r\vremove\1\0\1\bkey\6d\vcreate\1\0\1\bkey\6a\frefresh\1\0\1\bkey\n<C-r>\20toggle_dotfiles\1\0\1\bkey\6.\19toggle_ignored\1\0\1\bkey\6,\15close_node\1\0\1\bkey\t<BS>\16parent_node\1\0\1\bkey\6P\17next_sibling\1\0\1\bkey\6>\17prev_sibling\1\0\1\bkey\6<\vtabnew\1\0\1\bkey\n<C-t>\nsplit\1\0\1\bkey\n<C-x>\vvsplit\1\0\1\bkey\n<C-v>\acd\1\0\1\bkey\n<C-]>\acb\tedit\1\0\1\bkey\t<CR>\1\0\1\16custom_only\2\1\0\3\nwidth\3\30\tside\tleft\16auto_resize\2\vignore\1\a\0\0\t.git\17node_modules\15__sapper__\r.routify\tdist\v.cache\24update_focused_file\16ignore_list\1\0\2\15update_cwd\2\venable\2\16diagnostics\1\0\1\venable\2\1\0\5\15update_cwd\2\18disable_netrw\1\18hide_dotfiles\3\0\18hijack_cursor\2\17hijack_netrw\2\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\0" },
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
    config = { "\27LJ\1\2�\1\0\0\3\0\b\0\f4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\5\0004\2\3\0007\2\4\2:\2\4\0013\2\6\0:\2\a\1>\0\2\1G\0\1\0\fdisplay\1\3\0\0\rTerminal\18VirtualTextOk\1\0\0\fborders\tUtil\nsetup\fsniprun\frequire\0" },
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
    config = { "\27LJ\1\2�\1\0\0\5\0\14\0\0174\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\4\0%\1\5\0>\0\2\0027\0\6\0003\1\f\0003\2\n\0003\3\a\0003\4\b\0:\4\t\3:\3\v\2:\2\r\1>\0\2\1G\0\1\0\fengines\1\0\0\rpdflatex\1\0\0\targs\1\6\0\0\14-pdflatex\29-interaction=nonstopmode\15-synctex=1\b-pv\a%f\1\0\2\17isContinuous\1\15executable\flatexmk\nsetup\rtexmagic\frequire\nlatex\15tex_flavor\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/texmagic.nvim",
    url = "https://github.com/jakewvincent/texmagic.nvim"
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
    url = "https://github.com/atalazer/wally.nvim"
  },
  ["which-key.nvim"] = {
    config = { 'require("plugins.which-key")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["windline.nvim"] = {
    config = { "\27LJ\1\0027\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\24WindLineFloatToggle\bcmd\bvimR\1\0\3\0\5\0\t4\0\0\0%\1\1\0>\0\2\0014\0\2\0007\0\3\0001\1\4\0'\2,\1>\0\3\1G\0\1\0\0\rdefer_fn\bvim\21plugins.windline\frequire\0" },
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

-- Setup for: cheat.sh-vim
time([[Setup for cheat.sh-vim]], true)
try_loadstring("\27LJ\1\2�\1\0\0\2\0\t\0\0214\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0%\1\4\0:\1\3\0004\0\0\0007\0\1\0%\1\6\0:\1\5\0004\0\0\0007\0\1\0'\1\0\0:\1\a\0004\0\0\0007\0\1\0'\1\0\0:\1\b\0G\0\1\0\21CheatSheetSilent\26CheatSheetDefaultMode\tline\31CheatSheetDefaultSelection\v_cheat\25CheatSheetBufferName\28CheatSheetStayInOrigBuf\6g\bvim\0", "setup", "cheat.sh-vim")
time([[Setup for cheat.sh-vim]], false)
time([[packadd for cheat.sh-vim]], true)
vim.cmd [[packadd cheat.sh-vim]]
time([[packadd for cheat.sh-vim]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\1\2�\1\0\0\3\0\n\0\0234\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0'\1\0\0:\1\3\0004\0\0\0007\0\1\0'\1\0\0:\1\4\0004\0\0\0007\0\1\0004\1\6\0007\1\a\1%\2\b\0>\1\2\2\14\0\1\0T\2\1�%\1\t\0:\1\5\0G\0\1\0\ffirefox\fBROWSER\vgetenv\aos\17mkdp_browser\22mkdp_refresh_slow\20mkdp_auto_close\20mkdp_auto_start\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Setup for: dial.nvim
time([[Setup for dial.nvim]], true)
try_loadstring("\27LJ\1\2�\2\0\0\5\0\t\0\31%\0\0\0%\1\1\0004\2\2\0\16\3\0\0%\4\3\0>\2\3\0014\2\4\0\16\3\0\0%\4\3\0>\2\3\0014\2\4\0%\3\5\0\16\4\0\0$\3\4\3%\4\6\0>\2\3\0014\2\2\0\16\3\1\0%\4\a\0>\2\3\0014\2\4\0\16\3\1\0%\4\a\0>\2\3\0014\2\4\0%\3\5\0\16\4\1\0$\3\4\3%\4\b\0>\2\3\1G\0\1\0&<Plug>(dial-decrement-additional)\27<Plug>(dial-decrement)&<Plug>(dial-increment-additional)\6g\tvmap\27<Plug>(dial-increment)\tnmap\n<C-x>\n<C-a>\0", "setup", "dial.nvim")
time([[Setup for dial.nvim]], false)
time([[packadd for dial.nvim]], true)
vim.cmd [[packadd dial.nvim]]
time([[packadd for dial.nvim]], false)
-- Setup for: sniprun
time([[Setup for sniprun]], true)
try_loadstring("\27LJ\1\2�\1\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0�\1                nmap <leader>sc <Plug>SnipClose\n                nmap <leader>sr <Plug>SnipRun\n                vmap sr <Plug>SnipRun\n                \bcmd\bvim\0", "setup", "sniprun")
time([[Setup for sniprun]], false)
-- Setup for: vim-easy-align
time([[Setup for vim-easy-align]], true)
try_loadstring("\27LJ\1\2o\0\0\5\0\6\0\r4\0\0\0%\1\1\0%\2\2\0%\3\3\0%\4\4\0>\0\5\0014\0\5\0%\1\1\0%\2\2\0%\3\3\0%\4\4\0>\0\5\1G\0\1\0\rxnoremap\nAlign\vsilent\22<Plug>(EasyAlign)\aga\rnnoremap\0", "setup", "vim-easy-align")
time([[Setup for vim-easy-align]], false)
-- Setup for: vim-silicon
time([[Setup for vim-silicon]], true)
try_loadstring("\27LJ\1\2�\3\0\0\3\0\15\0\0304\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\0\0007\0\1\0007\0\2\0%\1\5\0:\1\4\0004\0\0\0007\0\1\0007\0\2\0%\1\a\0:\1\6\0004\0\0\0007\0\1\0007\0\2\0%\1\t\0:\1\b\0004\0\0\0007\0\1\0007\0\2\0004\1\v\0007\1\f\1%\2\r\0>\1\2\2%\2\14\0$\1\2\1:\1\n\0G\0\1\0=/Pictures/Screenshots/silicon-{time:%Y-%m-%d-%H%M%S}.png\tHOME\vgetenv\aos\voutput\f#f8f8f2\15background\23FiraCode Nerd Font\tfont\fDracula\ntheme\1\0\n\rline-pad\3\3\14pad-horiz\3\30\rpad-vert\3\30\20window-controls\2\20shadow-offset-x\3\b\23shadow-blur-radius\3\5\16line-number\2\20shadow-offset-y\3\b\17round-corner\2\17shadow-color\f#434434\fsilicon\6g\bvim\0", "setup", "vim-silicon")
time([[Setup for vim-silicon]], false)
-- Setup for: curstr.nvim
time([[Setup for curstr.nvim]], true)
try_loadstring("\27LJ\1\2�\2\0\0\6\0\b\0\0143\0\0\0004\1\1\0%\2\2\0%\3\3\0\16\4\0\0%\5\4\0>\1\5\0014\1\1\0%\2\5\0%\3\6\0\16\4\0\0%\5\a\0>\1\5\1G\0\1\0\29Toggle Word Under Cursor8<CMD>lua require('curstr').execute('togglable')<CR>\21<Leader><Leader>\28Go To File Under CursorJ<CMD>lua require('curstr').execute('openable', {action = 'open'})<CR>\agf\rnnoremap\1\0\1\vsilent\2\0", "setup", "curstr.nvim")
time([[Setup for curstr.nvim]], false)
time([[packadd for curstr.nvim]], true)
vim.cmd [[packadd curstr.nvim]]
time([[packadd for curstr.nvim]], false)
-- Setup for: vim-sayonara
time([[Setup for vim-sayonara]], true)
try_loadstring("\27LJ\1\2p\0\0\6\0\5\0\b3\0\0\0004\1\1\0%\2\2\0%\3\3\0\16\4\0\0%\5\4\0>\1\5\1G\0\1\0\28Close Window/Buffer/Vim\22<CMD>Sayonara<CR>\15<C-w><C-w>\rnnoremap\1\0\1\vsilent\2\0", "setup", "vim-sayonara")
time([[Setup for vim-sayonara]], false)
time([[packadd for vim-sayonara]], true)
vim.cmd [[packadd vim-sayonara]]
time([[packadd for vim-sayonara]], false)
-- Setup for: vim-hexokinase
time([[Setup for vim-hexokinase]], true)
try_loadstring("\27LJ\1\2�\2\0\0\2\0\b\0\r4\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\0\0007\0\1\0003\1\5\0:\1\4\0004\0\0\0007\0\1\0003\1\a\0:\1\6\0G\0\1\0\1\0\2\thtml,full_hex,rgb,rgba,hsl,hsla,colour_names\bcss,full_hex,rgb,rgba,hsl,hsla,colour_names\31Hexokinase_ftOptInPatterns\1\6\0\0\rfull_hex\brgb\trgba\bhsl\thsla\29Hexokinase_optInPatterns\1\2\0\0\19backgroundfull\28Hexokinase_highlighters\6g\bvim\0", "setup", "vim-hexokinase")
time([[Setup for vim-hexokinase]], false)
time([[packadd for vim-hexokinase]], true)
vim.cmd [[packadd vim-hexokinase]]
time([[packadd for vim-hexokinase]], false)
-- Setup for: nvim-align
time([[Setup for nvim-align]], true)
try_loadstring("\27LJ\1\2g\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0Hcommand! -range=% -nargs=1 Align lua require'align'.align(<f-args>)\bcmd\bvim\0", "setup", "nvim-align")
time([[Setup for nvim-align]], false)
time([[packadd for nvim-align]], true)
vim.cmd [[packadd nvim-align]]
time([[packadd for nvim-align]], false)
-- Setup for: emmet-vim
time([[Setup for emmet-vim]], true)
try_loadstring("\27LJ\1\2�\1\0\0\2\0\a\0\r4\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0%\1\4\0:\1\3\0004\0\0\0007\0\1\0%\1\6\0:\1\5\0G\0\1\0\6,\26user_emmet_leader_key\6a\20user_emmet_mode\30user_emmet_install_global\6g\bvim\0", "setup", "emmet-vim")
time([[Setup for emmet-vim]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2�\1\0\0\4\0\a\0\v4\0\0\0%\1\1\0%\2\2\0%\3\3\0>\0\4\0014\0\4\0%\1\5\0>\0\2\0027\0\6\0>\0\1\1G\0\1\0\nsetup\22plugins.nvim-tree\frequire\21Toggle Nvim Tree\28<CMD>NvimTreeToggle<CR>\6`\rnnoremap\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
time([[packadd for nvim-tree.lua]], true)
vim.cmd [[packadd nvim-tree.lua]]
time([[packadd for nvim-tree.lua]], false)
-- Setup for: glow.nvim
time([[Setup for glow.nvim]], true)
try_loadstring("\27LJ\1\2c\0\0\5\0\5\0\a4\0\0\0%\1\1\0%\2\2\0%\3\3\0%\4\4\0>\0\5\1G\0\1\0\27Preview File With Glow\vsilent\18<CMD>Glow<CR>\15<leader>pm\rnnoremap\0", "setup", "glow.nvim")
time([[Setup for glow.nvim]], false)
-- Setup for: suda.vim
time([[Setup for suda.vim]], true)
try_loadstring("\27LJ\1\2`\0\0\2\0\5\0\t4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0%\1\4\0:\1\3\0G\0\1\0\23[Suda] Password : \16suda#prompt\20suda_smart_edit\6g\bvim\0", "setup", "suda.vim")
time([[Setup for suda.vim]], false)
time([[packadd for suda.vim]], true)
vim.cmd [[packadd suda.vim]]
time([[packadd for suda.vim]], false)
-- Setup for: vim-fugitive
time([[Setup for vim-fugitive]], true)
try_loadstring("\27LJ\1\2�\3\0\0\4\0\23\0$4\0\0\0007\0\1\0%\1\2\0%\2\3\0>\0\3\0014\0\4\0%\1\5\0%\2\6\0%\3\a\0>\0\4\0014\0\4\0%\1\b\0%\2\t\0%\3\n\0>\0\4\0014\0\4\0%\1\v\0%\2\f\0%\3\r\0>\0\4\0014\0\4\0%\1\14\0%\2\15\0%\3\16\0>\0\4\0014\0\4\0%\1\17\0%\2\18\0%\3\19\0>\0\4\0014\0\4\0%\1\20\0%\2\21\0%\3\22\0>\0\4\1G\0\1\0\vBranch\22<CMD>G branch<CR>\15<Leader>gb\nMerge\21<CMD>G merge<CR>\15<Leader>gm\vCommit\22<CMD>G commit<CR>\15<Leader>gc\24Merge Right (3-Way)\25<CMD>diffget //3<CR>\15<Leader>gf\23Merge Left (2-Way)\25<CMD>diffget //2<CR>\15<Leader>gh\tMain\15<CMD>G<CR>\15<Leader>gg\tnmap\bGit\14<leader>g\nnname\tmapx\0", "setup", "vim-fugitive")
time([[Setup for vim-fugitive]], false)
time([[packadd for vim-fugitive]], true)
vim.cmd [[packadd vim-fugitive]]
time([[packadd for vim-fugitive]], false)
-- Setup for: vim-matchup
time([[Setup for vim-matchup]], true)
try_loadstring("\27LJ\1\2j\0\0\2\0\4\0\0054\0\0\0007\0\1\0003\1\3\0:\1\2\0G\0\1\0\1\0\3\14highlight\vNormal\14fullwidth\2\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0", "setup", "vim-matchup")
time([[Setup for vim-matchup]], false)
time([[packadd for vim-matchup]], true)
vim.cmd [[packadd vim-matchup]]
time([[packadd for vim-matchup]], false)
-- Setup for: vim-markdown
time([[Setup for vim-markdown]], true)
try_loadstring("\27LJ\1\2�\1\0\0\2\0\5\0\r4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\3\0004\0\0\0007\0\1\0'\1\1\0:\1\4\0G\0\1\0\22vim_markdown_math\29vim_markdown_frontmatter\"vim_markdown_folding_disabled\6g\bvim\0", "setup", "vim-markdown")
time([[Setup for vim-markdown]], false)
-- Setup for: sqlite.lua
time([[Setup for sqlite.lua]], true)
try_loadstring("\27LJ\1\2M\0\0\2\0\4\0\0054\0\0\0007\0\1\0%\1\3\0:\1\2\0G\0\1\0\31/lib64/libsqlite3.so.0.8.6\21sqlite_clib_path\6g\bvim\0", "setup", "sqlite.lua")
time([[Setup for sqlite.lua]], false)
time([[packadd for sqlite.lua]], true)
vim.cmd [[packadd sqlite.lua]]
time([[packadd for sqlite.lua]], false)
-- Setup for: wally.nvim
time([[Setup for wally.nvim]], true)
try_loadstring("\27LJ\1\2�\1\0\0\2\0\6\0\t4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0003\1\5\0:\1\4\0G\0\1\0\1\a\0\0\aqf\15vista_kind\rterminal\rNvimtree\fTrouble\vpacker\19wally_sidebars\17~/.cache/wal\18wally_wal_dir\6g\bvim\0", "setup", "wally.nvim")
time([[Setup for wally.nvim]], false)
time([[packadd for wally.nvim]], true)
vim.cmd [[packadd wally.nvim]]
time([[packadd for wally.nvim]], false)
-- Setup for: lightspeed.nvim
time([[Setup for lightspeed.nvim]], true)
try_loadstring('\27LJ\1\2�\3\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0�\2    nmap <expr> f reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"\n    nmap <expr> F reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"\n    nmap <expr> t reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"\n    nmap <expr> T reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"\n    \bcmd\bvim\0', "setup", "lightspeed.nvim")
time([[Setup for lightspeed.nvim]], false)
time([[packadd for lightspeed.nvim]], true)
vim.cmd [[packadd lightspeed.nvim]]
time([[packadd for lightspeed.nvim]], false)
-- Setup for: lazygit.nvim
time([[Setup for lazygit.nvim]], true)
try_loadstring("\27LJ\1\2�\2\0\0\5\0\r\1\0274\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0(\1\0\0:\1\3\0004\0\0\0007\0\1\0003\1\5\0:\1\4\0004\0\0\0007\0\1\0'\1\0\0:\1\6\0004\0\0\0007\0\1\0'\1\0\0:\1\a\0004\0\b\0%\1\t\0%\2\n\0%\3\v\0%\4\f\0>\0\5\1G\0\1\0\18Open Lazy Git\vsilent\21<CMD>LazyGit<CR>\15<leader>gt\rnnoremap\30lazygit_use_neovim_remote(lazygit_floating_window_use_plenary\1\5\0\0\b╭\b╮\b╰\b╯)lazygit_floating_window_corner_chars+lazygit_floating_window_scaling_factor%lazygit_floating_window_winblend\6g\bvim͙��\f�̩�\3\0", "setup", "lazygit.nvim")
time([[Setup for lazygit.nvim]], false)
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
try_loadstring("\27LJ\1\2R\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\rmappings\15<leader>gw\nsetup\14gitlinker\frequire\0", "config", "gitlinker.nvim")
time([[Config for gitlinker.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require("plugins.indent-blankline")
time([[Config for indent-blankline.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
require("plugins.alpha")
time([[Config for alpha-nvim]], false)
-- Config for: curstr.nvim
time([[Config for curstr.nvim]], true)
try_loadstring("\27LJ\1\2�\a\0\0\14\0001\0c3\0\16\0002\1\17\0003\2\0\0;\2\1\0013\2\1\0;\2\2\0013\2\2\0;\2\3\0013\2\3\0;\2\4\0013\2\4\0;\2\5\0013\2\5\0;\2\6\0013\2\6\0;\2\a\0013\2\a\0;\2\b\0013\2\b\0;\2\t\0013\2\t\0;\2\n\0013\2\n\0;\2\v\0013\2\v\0;\2\f\0013\2\f\0;\2\r\0013\2\r\0;\2\14\0013\2\14\0;\2\15\0013\2\15\0;\2\16\1:\1\17\0003\1\21\0003\2\19\0003\3\18\0:\3\20\2:\2\22\0013\2\23\0002\3\0\0:\3\20\2:\2\17\0012\2\0\0004\3\24\0007\4\17\0>\3\2\4T\6\25�3\b\26\0003\t\25\0:\t\20\b3\t\27\0002\n\3\0008\v\1\a;\v\1\n8\v\2\a;\v\2\n:\n\28\t:\t\29\b%\t\30\0\16\n\6\0$\t\n\t9\b\t\0024\t\31\0007\t \t7\n\17\0017\n\20\n4\v!\0%\f\30\0\16\r\6\0$\f\r\f>\v\2\0=\t\1\1A\6\3\3N\6�4\3\"\0007\3#\3%\4$\0\16\5\1\0\16\6\2\0>\3\4\2\16\1\3\0004\3%\0%\4&\0>\3\2\0027\3'\0033\4(\0:\1)\0043\5.\0003\6+\0003\a*\0:\a\29\0063\a,\0:\a-\6:\6/\5:\0050\4>\3\2\1G\0\1\0\fsources\26vim/autoload_function\1\0\0\14filetypes\1\4\0\0\bvim\vpython\blua\1\0\0\1\0\1\21include_packpath\2\19source_aliases\1\0\0\nsetup\vcurstr\frequire\nforce\15tbl_extend\bvim\rtostring\vinsert\ntable\tword\topts\nwords\1\0\1\15normalized\2\1\0\0\1\2\0\0\19togglable/word\vipairs\1\0\0\ropenable\1\0\0\nnames\1\0\0\1\6\0\0\17vim/function\16vim/runtime\14directory\tfile\blua\14togglable\1\0\0\1\3\0\0\rvertical\15horizontal\1\3\0\0\tnext\rprevious\1\3\0\0\nlight\tdark\1\3\0\0\nwhite\nblack\1\3\0\0\afg\abg\1\3\0\0\15foreground\15background\1\3\0\0\valways\nnever\1\3\0\0\nright\tleft\1\3\0\0\btop\vbottom\1\3\0\0\topen\nclose\1\3\0\0\aor\band\1\3\0\0\aon\boff\1\3\0\0\byes\ano\1\3\0\0\venable\fdisable\1\3\0\0\ttrue\nfalse\1\3\0\0\0061\0060\0", "config", "curstr.nvim")
time([[Config for curstr.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require("plugins.autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-align
time([[Config for nvim-align]], true)
try_loadstring("\27LJ\1\2\0\0\4\0\b\0\0184\0\0\0%\1\1\0>\0\2\0014\0\2\0007\0\3\0007\0\4\0004\1\2\0007\1\3\0017\1\5\1>\1\1\0=\0\0\0024\1\2\0007\1\6\1%\2\a\0\16\3\0\0$\2\3\2>\1\2\1G\0\1\0\vAlign \bcmd\fgetchar\fnr2char\afn\bvim\fAlign: \nprint#\1\0\2\0\3\0\0044\0\0\0001\1\2\0:\1\1\0G\0\1\0\0\nalign\tUtil\0", "config", "nvim-align")
time([[Config for nvim-align]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require("plugins.cmp")
time([[Config for nvim-cmp]], false)
-- Config for: clipboard-image.nvim
time([[Config for clipboard-image.nvim]], true)
try_loadstring("\27LJ\1\2-\0\0\2\0\3\0\0044\0\0\0007\0\1\0%\1\2\0@\0\2\0\18%Y%m%d-%H%M%S\tdate\aos�\1\1\0\4\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\6\0003\2\3\0001\3\4\0:\3\5\2:\2\a\0013\2\b\0:\2\t\1>\0\2\1G\0\1\0\rmarkdown\1\0\3\16img_dir_txt\bimg\naffix\17![Image](%s)\fimg_dir\bimg\fdefault\1\0\0\rimg_name\0\1\0\3\16img_dir_txt\bimg\naffix\a%s\fimg_dir\bimg\nsetup\20clipboard-image\frequire\0", "config", "clipboard-image.nvim")
time([[Config for clipboard-image.nvim]], false)
-- Config for: better-escape.nvim
time([[Config for better-escape.nvim]], true)
try_loadstring("\27LJ\1\2�\1\0\0\3\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0014\2\6\0007\2\a\0027\2\b\2:\2\t\1>\0\2\1G\0\1\0\ftimeout\15timeoutlen\6o\bvim\fmapping\1\0\1\tkeys\15<Esc><Esc>\1\2\0\0\ajk\nsetup\18better_escape\frequire\0", "config", "better-escape.nvim")
time([[Config for better-escape.nvim]], false)
-- Config for: windline.nvim
time([[Config for windline.nvim]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\24WindLineFloatToggle\bcmd\bvimR\1\0\3\0\5\0\t4\0\0\0%\1\1\0>\0\2\0014\0\2\0007\0\3\0001\1\4\0'\2,\1>\0\3\1G\0\1\0\0\rdefer_fn\bvim\21plugins.windline\frequire\0", "config", "windline.nvim")
time([[Config for windline.nvim]], false)
-- Config for: mkdnflow.nvim
time([[Config for mkdnflow.nvim]], true)
try_loadstring("\27LJ\1\2�\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\14filetypes\1\0\3\amd\2\brmd\2\rmarkdown\2\1\0\5\20new_file_prefix\25os.date('%Y-%m-%d-')\16create_dirs\2\20evaluate_prefix\2\21default_mappings\2\22links_relative_to\nfirst\nsetup\rmkdnflow\frequire\0", "config", "mkdnflow.nvim")
time([[Config for mkdnflow.nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
require("plugins.bufferline")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2�\r\0\0\t\0K\0�\0014\0\0\0%\1\1\0>\0\2\0027\0\2\0004\1\0\0%\2\3\0>\1\2\0027\1\4\0013\2\5\0003\3\6\0:\3\a\0023\3\b\0002\4\0\0:\4\t\3:\3\n\0023\3\v\0:\3\f\0023\3\r\0003\4\14\0002\5\29\0003\6\15\0\16\a\0\0%\b\16\0>\a\2\2:\a\17\6;\6\1\0053\6\18\0\16\a\0\0%\b\19\0>\a\2\2:\a\17\6;\6\2\0053\6\20\0\16\a\0\0%\b\21\0>\a\2\2:\a\17\6;\6\3\0053\6\22\0\16\a\0\0%\b\23\0>\a\2\2:\a\17\6;\6\4\0053\6\24\0\16\a\0\0%\b\25\0>\a\2\2:\a\17\6;\6\5\0053\6\26\0\16\a\0\0%\b\27\0>\a\2\2:\a\17\6;\6\6\0053\6\28\0\16\a\0\0%\b\29\0>\a\2\2:\a\17\6;\6\a\0053\6\30\0\16\a\0\0%\b\31\0>\a\2\2:\a\17\6;\6\b\0053\6 \0\16\a\0\0%\b!\0>\a\2\2:\a\17\6;\6\t\0053\6\"\0\16\a\0\0%\b#\0>\a\2\2:\a\17\6;\6\n\0053\6$\0\16\a\0\0%\b%\0>\a\2\2:\a\17\6;\6\v\0053\6&\0\16\a\0\0%\b'\0>\a\2\2:\a\17\6;\6\f\0053\6(\0\16\a\0\0%\b)\0>\a\2\2:\a\17\6;\6\r\0053\6*\0\16\a\0\0%\b+\0>\a\2\2:\a\17\6;\6\14\0053\6,\0\16\a\0\0%\b-\0>\a\2\2:\a\17\6;\6\15\0053\6.\0\16\a\0\0%\b/\0>\a\2\2:\a\17\6;\6\16\0053\0060\0\16\a\0\0%\b1\0>\a\2\2:\a\17\6;\6\17\0053\0062\0\16\a\0\0%\b3\0>\a\2\2:\a\17\6;\6\18\0053\0064\0\16\a\0\0%\b5\0>\a\2\2:\a\17\6;\6\19\0053\0066\0\16\a\0\0%\b7\0>\a\2\2:\a\17\6;\6\20\0053\0068\0\16\a\0\0%\b9\0>\a\2\2:\a\17\6;\6\21\0053\6:\0\16\a\0\0%\b;\0>\a\2\2:\a\17\6;\6\22\0053\6<\0\16\a\0\0%\b=\0>\a\2\2:\a\17\6;\6\23\0053\6>\0\16\a\0\0%\b?\0>\a\2\2:\a\17\6;\6\24\0053\6@\0\16\a\0\0%\bA\0>\a\2\2:\a\17\6;\6\25\0053\6B\0\16\a\0\0%\bC\0>\a\2\2:\a\17\6;\6\26\0053\6D\0\16\a\0\0%\bE\0>\a\2\2:\a\17\6;\6\27\0053\6F\0\16\a\0\0%\bG\0>\a\2\2:\a\17\6;\6\28\5:\5H\4:\4I\3:\3J\2>\1\2\1G\0\1\0\tview\rmappings\tlist\16toggle_help\1\0\1\bkey\6?\nclose\1\0\1\bkey\6q\16system_open\1\0\1\bkey\6O\vdir_up\1\0\1\bkey\6-\18next_git_item\1\0\1\bkey\a]c\18prev_git_item\1\0\1\bkey\a[c\23copy_absolute_path\1\0\1\bkey\agy\14copy_path\1\0\1\bkey\6Y\14copy_name\1\0\1\bkey\6y\npaste\1\0\1\bkey\6p\tcopy\1\0\1\bkey\6c\bcut\1\0\1\bkey\6x\16full_rename\1\0\1\bkey\6R\vrename\1\0\1\bkey\6r\vremove\1\0\1\bkey\6d\vcreate\1\0\1\bkey\6a\frefresh\1\0\1\bkey\n<C-r>\20toggle_dotfiles\1\0\1\bkey\6.\19toggle_ignored\1\0\1\bkey\6,\15close_node\1\0\1\bkey\t<BS>\16parent_node\1\0\1\bkey\6P\17next_sibling\1\0\1\bkey\6>\17prev_sibling\1\0\1\bkey\6<\vtabnew\1\0\1\bkey\n<C-t>\nsplit\1\0\1\bkey\n<C-x>\vvsplit\1\0\1\bkey\n<C-v>\acd\1\0\1\bkey\n<C-]>\acb\tedit\1\0\1\bkey\t<CR>\1\0\1\16custom_only\2\1\0\3\nwidth\3\30\tside\tleft\16auto_resize\2\vignore\1\a\0\0\t.git\17node_modules\15__sapper__\r.routify\tdist\v.cache\24update_focused_file\16ignore_list\1\0\2\15update_cwd\2\venable\2\16diagnostics\1\0\1\venable\2\1\0\5\15update_cwd\2\18disable_netrw\1\18hide_dotfiles\3\0\18hijack_cursor\2\17hijack_netrw\2\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\1\2^\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequire�\1\1\0\3\0\f\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0:\2\t\0011\2\n\0:\2\v\1>\0\2\1G\0\1\0\rpre_hook\0\ropleader\1\0\2\nblock\agb\tline\agc\ftoggler\1\0\2\nblock\bgbc\tline\bgcc\rmappings\1\0\2\nextra\1\nbasic\2\1\0\2\vignore\a^$\fpadding\2\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\1\2�\1\0\0\3\0\6\0\v4\0\0\0%\1\1\0>\0\2\0025\0\1\0004\0\1\0007\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\nicons\1\0\6\tHINT\t \nTRACE\b✎\nDEBUG\t \tWARN\t \tINFO\t \nERROR\t \1\0\3\22background_colour\f#161822\ftimeout\3�\15\vstages\22fade_in_slide_out\nsetup\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
require("plugins.neoscroll")
time([[Config for neoscroll.nvim]], false)
-- Config for: neorg
time([[Config for neorg]], true)
require("plugins.neorg")
time([[Config for neorg]], false)
-- Config for: dial.nvim
time([[Config for dial.nvim]], true)
try_loadstring("\27LJ\1\2�\1\0\0\3\0\6\0\b4\0\0\0%\1\1\0>\0\2\0027\1\2\0007\1\3\0013\2\5\0:\2\4\1G\0\1\0\1\n\0\0\19number#decimal\15number#hex\18number#binary\14color#hex\17date#[%H:%M]\20date#[%Y-%m-%d]\25char#alph#small#word\27char#alph#capital#word\27markup#markdown#header\vnormal\15searchlist\vconfig\tdial\frequire\0", "config", "dial.nvim")
time([[Config for dial.nvim]], false)
-- Config for: wally.nvim
time([[Config for wally.nvim]], true)
require("wally").colorscheme()
time([[Config for wally.nvim]], false)
-- Config for: lightspeed.nvim
time([[Config for lightspeed.nvim]], true)
try_loadstring("\27LJ\1\2�\2\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\a\25grey_out_search_area\2\24jump_to_first_match\2)jump_on_partial_input_safety_timeout\3�\3+match_only_the_start_of_same_char_seqs\2\30full_inclusive_prefix_key\n<C-x>\27highlight_unique_chars\1\21limit_ft_matches\3\b\nsetup\15lightspeed\frequire\0", "config", "lightspeed.nvim")
time([[Config for lightspeed.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\1\2�\4\0\0\4\0\v\0\0174\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\a\0004\2\3\0007\2\4\0027\2\5\2%\3\6\0>\2\2\2:\2\b\1>\0\2\0014\0\3\0007\0\t\0%\1\n\0>\0\2\1G\0\1\0�\3                    imap <silent><expr> <C-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-j>'\n                    snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(1)<CR>\n                    snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>\n                    inoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>\n                \bcmd\npaths\1\0\0\vconfig\fstdpath\afn\bvim\14lazy_load luasnip.loaders.from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Silicon lua require("packer.load")({'vim-silicon'}, { cmd = "Silicon", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TableModeToggle lua require("packer.load")({'vim-table-mode'}, { cmd = "TableModeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file EmmetInstall lua require("packer.load")({'emmet-vim'}, { cmd = "EmmetInstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipRun lua require("packer.load")({'sniprun'}, { cmd = "SnipRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
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
vim.cmd [[nnoremap <silent> <Leader>f <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>Leader>f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>SnupClose <cmd>lua require("packer.load")({'sniprun'}, { keys = "<lt>Plug>SnupClose", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>SnipRun <cmd>lua require("packer.load")({'sniprun'}, { keys = "<lt>Plug>SnipRun", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>(EasyAlign) <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "<lt>Plug>(EasyAlign)", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType bib ++once lua require("packer.load")({'texmagic.nvim'}, { ft = "bib" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-table-mode', 'vim-markdown', 'glow.nvim', 'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType text ++once lua require("packer.load")({'vim-table-mode'}, { ft = "text" }, _G.packer_plugins)]]
vim.cmd [[au FileType latex ++once lua require("packer.load")({'texmagic.nvim'}, { ft = "latex" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'texmagic.nvim'}, { ft = "tex" }, _G.packer_plugins)]]
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
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
