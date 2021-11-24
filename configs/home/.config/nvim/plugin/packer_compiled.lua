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
    config = { "\27LJ\2\2^\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequireŒ\1\1\0\3\0\f\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\0013\2\n\0=\2\v\1B\0\2\1K\0\1\0\rpre_hook\0\ropleader\1\0\2\nblock\agb\tline\agc\ftoggler\1\0\2\nblock\bgbc\tline\bgcc\rmappings\1\0\2\nextra\1\nbasic\2\1\0\2\vignore\a^$\fpadding\2\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\2¢\4\0\0\4\0\v\0\0176\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\a\0006\2\3\0009\2\4\0029\2\5\2'\3\6\0B\2\2\2=\2\b\1B\0\2\0016\0\3\0009\0\t\0'\1\n\0B\0\2\1K\0\1\0â\3                    imap <silent><expr> <C-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-j>'\n                    snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(1)<CR>\n                    snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>\n                    inoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>\n                \bcmd\npaths\1\0\0\vconfig\fstdpath\afn\bvim\14lazy_load luasnip.loaders.from_vscode\frequire\0" },
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
    config = { "\27LJ\2\2í\1\0\0\3\0\n\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0016\2\6\0009\2\a\0029\2\b\2=\2\t\1B\0\2\1K\0\1\0\ftimeout\15timeoutlen\6o\bvim\fmapping\1\0\1\tkeys\15<Esc><Esc>\1\2\0\0\ajk\nsetup\18better_escape\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/better-escape.nvim",
    url = "https://github.com/max397574/better-escape.nvim"
  },
  ["clipboard-image.nvim"] = {
    config = { "\27LJ\2\2-\0\0\2\0\3\0\0046\0\0\0009\0\1\0'\1\2\0D\0\2\0\18%Y%m%d-%H%M%S\tdate\aosJ\0\0\3\0\5\0\b6\0\0\0009\0\1\0009\0\2\0'\1\3\0B\0\2\0026\1\4\0\18\2\0\0D\1\2\0\rtostring\17Image Name: \ninput\afn\bvim⁄\1\1\0\4\0\v\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\6\0005\2\3\0003\3\4\0=\3\5\2=\2\a\0015\2\b\0003\3\t\0=\3\5\2=\2\n\1B\0\2\1K\0\1\0\rmarkdown\0\1\0\3\16img_dir_txt\bimg\naffix\17![Image](%s)\fimg_dir\bimg\fdefault\1\0\0\rimg_name\0\1\0\3\16img_dir_txt\bimg\naffix\a%s\fimg_dir\bimg\nsetup\20clipboard-image\frequire\0" },
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
    config = { "\27LJ\2\2¬\a\0\0\14\0001\0c5\0\16\0004\1\17\0005\2\0\0>\2\1\0015\2\1\0>\2\2\0015\2\2\0>\2\3\0015\2\3\0>\2\4\0015\2\4\0>\2\5\0015\2\5\0>\2\6\0015\2\6\0>\2\a\0015\2\a\0>\2\b\0015\2\b\0>\2\t\0015\2\t\0>\2\n\0015\2\n\0>\2\v\0015\2\v\0>\2\f\0015\2\f\0>\2\r\0015\2\r\0>\2\14\0015\2\14\0>\2\15\0015\2\15\0>\2\16\1=\1\17\0005\1\21\0005\2\19\0005\3\18\0=\3\20\2=\2\22\0015\2\23\0004\3\0\0=\3\20\2=\2\17\0014\2\0\0006\3\24\0009\4\17\0B\3\2\4X\6\25Ä5\b\26\0005\t\25\0=\t\20\b5\t\27\0004\n\3\0:\v\1\a>\v\1\n:\v\2\a>\v\2\n=\n\28\t=\t\29\b'\t\30\0\18\n\6\0&\t\n\t<\b\t\0026\t\31\0009\t \t9\n\17\0019\n\20\n6\v!\0'\f\30\0\18\r\6\0&\f\r\fB\v\2\0A\t\1\1E\6\3\3R\6Â6\3\"\0009\3#\3'\4$\0\18\5\1\0\18\6\2\0B\3\4\2\18\1\3\0006\3%\0'\4&\0B\3\2\0029\3'\0035\4(\0=\1)\0045\5.\0005\6+\0005\a*\0=\a\29\0065\a,\0=\a-\6=\6/\5=\0050\4B\3\2\1K\0\1\0\fsources\26vim/autoload_function\1\0\0\14filetypes\1\4\0\0\bvim\vpython\blua\1\0\0\1\0\1\21include_packpath\2\19source_aliases\1\0\0\nsetup\vcurstr\frequire\nforce\15tbl_extend\bvim\rtostring\vinsert\ntable\tword\topts\nwords\1\0\1\15normalized\2\1\0\0\1\2\0\0\19togglable/word\vipairs\1\0\0\ropenable\1\0\0\nnames\1\0\0\1\6\0\0\17vim/function\16vim/runtime\14directory\tfile\blua\14togglable\1\0\0\1\3\0\0\rvertical\15horizontal\1\3\0\0\tnext\rprevious\1\3\0\0\nlight\tdark\1\3\0\0\nwhite\nblack\1\3\0\0\afg\abg\1\3\0\0\15foreground\15background\1\3\0\0\valways\nnever\1\3\0\0\nright\tleft\1\3\0\0\btop\vbottom\1\3\0\0\topen\nclose\1\3\0\0\aor\band\1\3\0\0\aon\boff\1\3\0\0\byes\ano\1\3\0\0\venable\fdisable\1\3\0\0\ttrue\nfalse\1\3\0\0\0061\0060\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/curstr.nvim",
    url = "https://github.com/notomo/curstr.nvim"
  },
  ["dial.nvim"] = {
    config = { "\27LJ\2\2„\1\0\0\3\0\6\0\b6\0\0\0'\1\1\0B\0\2\0029\1\2\0009\1\3\0015\2\5\0=\2\4\1K\0\1\0\1\n\0\0\19number#decimal\15number#hex\18number#binary\14color#hex\17date#[%H:%M]\20date#[%Y-%m-%d]\25char#alph#small#word\27char#alph#capital#word\27markup#markdown#header\vnormal\15searchlist\vconfig\tdial\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/dial.nvim",
    url = "https://github.com/monaqa/dial.nvim"
  },
  ["due.nvim"] = {
    config = { "\27LJ\2\2ê\2\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\r\foverdue\fOVERDUE\rtoday_hi\14Character\16pattern_end\6>\ntoday\nTODAY\18pattern_start\6<\17prescript_hi\fComment\vdue_hi\vString\14prescript\ndue: \19use_clock_time\2\21default_due_time\rmidnight\15overdue_hi\nError\fdate_hi\fConceal\aft\t*.md\nsetup\rdue_nvim\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/due.nvim",
    url = "https://github.com/NFrid/due.nvim"
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
    config = { "\27LJ\2\2Ö\2\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\a\25grey_out_search_area\2\24jump_to_first_match\2)jump_on_partial_input_safety_timeout\3ê\3+match_only_the_start_of_same_char_seqs\2\30full_inclusive_prefix_key\n<C-x>\27highlight_unique_chars\1\21limit_ft_matches\3\b\nsetup\15lightspeed\frequire\0" },
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
    config = { "\27LJ\2\2“\1\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\1B\0\2\1K\0\1\0\14filetypes\1\0\3\amd\2\brmd\2\rmarkdown\2\1\0\5\20new_file_prefix\25os.date('%Y-%m-%d-')\16create_dirs\2\20evaluate_prefix\2\21default_mappings\1\22links_relative_to\nfirst\nsetup\rmkdnflow\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/mkdnflow.nvim",
    url = "https://github.com/jakewvincent/mkdnflow.nvim"
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
    config = { "\27LJ\2\2\0\0\4\0\b\0\0186\0\0\0'\1\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0006\1\2\0009\1\3\0019\1\5\1B\1\1\0A\0\0\0026\1\2\0009\1\6\1'\2\a\0\18\3\0\0&\2\3\2B\1\2\1K\0\1\0\vAlign \bcmd\fgetchar\fnr2char\afn\bvim\fAlign: \nprint#\1\0\2\0\3\0\0046\0\0\0003\1\2\0=\1\1\0K\0\1\0\0\nalign\tUtil\0" },
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
    config = { "\27LJ\2\2–\1\0\0\3\0\6\0\v6\0\0\0'\1\1\0B\0\2\0027\0\1\0006\0\1\0009\0\2\0005\1\3\0005\2\4\0=\2\5\1B\0\2\1K\0\1\0\nicons\1\0\6\tHINT\tÔ†µ \nTRACE\b‚úé\nDEBUG\tÔÜà \tWARN\tÔî© \tINFO\tÔëâ \nERROR\tÔôô \1\0\3\22background_colour\f#161822\ftimeout\3–\15\vstages\22fade_in_slide_out\nsetup\vnotify\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\2ã\r\0\0\t\0K\0¡\0016\0\0\0'\1\1\0B\0\2\0029\0\2\0006\1\0\0'\2\3\0B\1\2\0029\1\4\0015\2\5\0005\3\6\0=\3\a\0025\3\b\0004\4\0\0=\4\t\3=\3\n\0025\3\v\0=\3\f\0025\3\r\0005\4\14\0004\5\29\0005\6\15\0\18\a\0\0'\b\16\0B\a\2\2=\a\17\6>\6\1\0055\6\18\0\18\a\0\0'\b\19\0B\a\2\2=\a\17\6>\6\2\0055\6\20\0\18\a\0\0'\b\21\0B\a\2\2=\a\17\6>\6\3\0055\6\22\0\18\a\0\0'\b\23\0B\a\2\2=\a\17\6>\6\4\0055\6\24\0\18\a\0\0'\b\25\0B\a\2\2=\a\17\6>\6\5\0055\6\26\0\18\a\0\0'\b\27\0B\a\2\2=\a\17\6>\6\6\0055\6\28\0\18\a\0\0'\b\29\0B\a\2\2=\a\17\6>\6\a\0055\6\30\0\18\a\0\0'\b\31\0B\a\2\2=\a\17\6>\6\b\0055\6 \0\18\a\0\0'\b!\0B\a\2\2=\a\17\6>\6\t\0055\6\"\0\18\a\0\0'\b#\0B\a\2\2=\a\17\6>\6\n\0055\6$\0\18\a\0\0'\b%\0B\a\2\2=\a\17\6>\6\v\0055\6&\0\18\a\0\0'\b'\0B\a\2\2=\a\17\6>\6\f\0055\6(\0\18\a\0\0'\b)\0B\a\2\2=\a\17\6>\6\r\0055\6*\0\18\a\0\0'\b+\0B\a\2\2=\a\17\6>\6\14\0055\6,\0\18\a\0\0'\b-\0B\a\2\2=\a\17\6>\6\15\0055\6.\0\18\a\0\0'\b/\0B\a\2\2=\a\17\6>\6\16\0055\0060\0\18\a\0\0'\b1\0B\a\2\2=\a\17\6>\6\17\0055\0062\0\18\a\0\0'\b3\0B\a\2\2=\a\17\6>\6\18\0055\0064\0\18\a\0\0'\b5\0B\a\2\2=\a\17\6>\6\19\0055\0066\0\18\a\0\0'\b7\0B\a\2\2=\a\17\6>\6\20\0055\0068\0\18\a\0\0'\b9\0B\a\2\2=\a\17\6>\6\21\0055\6:\0\18\a\0\0'\b;\0B\a\2\2=\a\17\6>\6\22\0055\6<\0\18\a\0\0'\b=\0B\a\2\2=\a\17\6>\6\23\0055\6>\0\18\a\0\0'\b?\0B\a\2\2=\a\17\6>\6\24\0055\6@\0\18\a\0\0'\bA\0B\a\2\2=\a\17\6>\6\25\0055\6B\0\18\a\0\0'\bC\0B\a\2\2=\a\17\6>\6\26\0055\6D\0\18\a\0\0'\bE\0B\a\2\2=\a\17\6>\6\27\0055\6F\0\18\a\0\0'\bG\0B\a\2\2=\a\17\6>\6\28\5=\5H\4=\4I\3=\3J\2B\1\2\1K\0\1\0\tview\rmappings\tlist\16toggle_help\1\0\1\bkey\6?\nclose\1\0\1\bkey\6q\16system_open\1\0\1\bkey\6O\vdir_up\1\0\1\bkey\6-\18next_git_item\1\0\1\bkey\a]c\18prev_git_item\1\0\1\bkey\a[c\23copy_absolute_path\1\0\1\bkey\agy\14copy_path\1\0\1\bkey\6Y\14copy_name\1\0\1\bkey\6y\npaste\1\0\1\bkey\6p\tcopy\1\0\1\bkey\6c\bcut\1\0\1\bkey\6x\16full_rename\1\0\1\bkey\6R\vrename\1\0\1\bkey\6r\vremove\1\0\1\bkey\6d\vcreate\1\0\1\bkey\6a\frefresh\1\0\1\bkey\n<C-r>\20toggle_dotfiles\1\0\1\bkey\6.\19toggle_ignored\1\0\1\bkey\6,\15close_node\1\0\1\bkey\t<BS>\16parent_node\1\0\1\bkey\6P\17next_sibling\1\0\1\bkey\6>\17prev_sibling\1\0\1\bkey\6<\vtabnew\1\0\1\bkey\n<C-t>\nsplit\1\0\1\bkey\n<C-x>\vvsplit\1\0\1\bkey\n<C-v>\acd\1\0\1\bkey\n<C-]>\acb\tedit\1\0\1\bkey\t<CR>\1\0\1\16custom_only\2\1\0\3\nwidth\3\30\tside\tleft\16auto_resize\2\vignore\1\a\0\0\t.git\17node_modules\15__sapper__\r.routify\tdist\v.cache\24update_focused_file\16ignore_list\1\0\2\15update_cwd\2\venable\2\16diagnostics\1\0\1\venable\2\1\0\5\15update_cwd\2\18disable_netrw\1\18hide_dotfiles\3\0\18hijack_cursor\2\17hijack_netrw\2\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\0" },
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
    config = { "\27LJ\2\2Ä\1\0\0\3\0\b\0\f6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\5\0006\2\3\0009\2\4\2=\2\4\0015\2\6\0=\2\a\1B\0\2\1K\0\1\0\fdisplay\1\3\0\0\rTerminal\18VirtualTextOk\1\0\0\fborders\tUtil\nsetup\fsniprun\frequire\0" },
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
    config = { "\27LJ\2\2Ú\1\0\0\5\0\14\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\1\5\0B\0\2\0029\0\6\0005\1\f\0005\2\n\0005\3\a\0005\4\b\0=\4\t\3=\3\v\2=\2\r\1B\0\2\1K\0\1\0\fengines\1\0\0\rpdflatex\1\0\0\targs\1\6\0\0\14-pdflatex\29-interaction=nonstopmode\15-synctex=1\b-pv\a%f\1\0\2\17isContinuous\1\15executable\flatexmk\nsetup\rtexmagic\frequire\nlatex\15tex_flavor\6g\bvim\0" },
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

-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\2ï\1\0\0\2\0\a\0\0176\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0K\0\1\0\tsurf\17mkdp_browser\22mkdp_refresh_slow\20mkdp_auto_close\20mkdp_auto_start\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Setup for: dial.nvim
time([[Setup for dial.nvim]], true)
try_loadstring("\27LJ\2\2ç\2\0\0\5\0\t\0\31'\0\0\0'\1\1\0006\2\2\0\18\3\0\0'\4\3\0B\2\3\0016\2\4\0\18\3\0\0'\4\3\0B\2\3\0016\2\4\0'\3\5\0\18\4\0\0&\3\4\3'\4\6\0B\2\3\0016\2\2\0\18\3\1\0'\4\a\0B\2\3\0016\2\4\0\18\3\1\0'\4\a\0B\2\3\0016\2\4\0'\3\5\0\18\4\1\0&\3\4\3'\4\b\0B\2\3\1K\0\1\0&<Plug>(dial-decrement-additional)\27<Plug>(dial-decrement)&<Plug>(dial-increment-additional)\6g\tvmap\27<Plug>(dial-increment)\tnmap\n<C-x>\n<C-a>\0", "setup", "dial.nvim")
time([[Setup for dial.nvim]], false)
time([[packadd for dial.nvim]], true)
vim.cmd [[packadd dial.nvim]]
time([[packadd for dial.nvim]], false)
-- Setup for: sniprun
time([[Setup for sniprun]], true)
try_loadstring("\27LJ\2\2π\1\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0ô\1                nmap <leader>sc <Plug>SnipClose\n                nmap <leader>sr <Plug>SnipRun\n                vmap sr <Plug>SnipRun\n                \bcmd\bvim\0", "setup", "sniprun")
time([[Setup for sniprun]], false)
-- Setup for: vim-easy-align
time([[Setup for vim-easy-align]], true)
try_loadstring("\27LJ\2\2o\0\0\5\0\6\0\r6\0\0\0'\1\1\0'\2\2\0'\3\3\0'\4\4\0B\0\5\0016\0\5\0'\1\1\0'\2\2\0'\3\3\0'\4\4\0B\0\5\1K\0\1\0\rxnoremap\nAlign\vsilent\22<Plug>(EasyAlign)\aga\rnnoremap\0", "setup", "vim-easy-align")
time([[Setup for vim-easy-align]], false)
-- Setup for: curstr.nvim
time([[Setup for curstr.nvim]], true)
try_loadstring("\27LJ\2\2í\2\0\0\6\0\b\0\0145\0\0\0006\1\1\0'\2\2\0'\3\3\0\18\4\0\0'\5\4\0B\1\5\0016\1\1\0'\2\5\0'\3\6\0\18\4\0\0'\5\a\0B\1\5\1K\0\1\0\29Toggle Word Under Cursor8<CMD>lua require('curstr').execute('togglable')<CR>\21<Leader><Leader>\28Go To File Under CursorJ<CMD>lua require('curstr').execute('openable', {action = 'open'})<CR>\agf\rnnoremap\1\0\1\vsilent\2\0", "setup", "curstr.nvim")
time([[Setup for curstr.nvim]], false)
time([[packadd for curstr.nvim]], true)
vim.cmd [[packadd curstr.nvim]]
time([[packadd for curstr.nvim]], false)
-- Setup for: vim-matchup
time([[Setup for vim-matchup]], true)
try_loadstring("\27LJ\2\2j\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\3\14highlight\vNormal\14fullwidth\2\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0", "setup", "vim-matchup")
time([[Setup for vim-matchup]], false)
time([[packadd for vim-matchup]], true)
vim.cmd [[packadd vim-matchup]]
time([[packadd for vim-matchup]], false)
-- Setup for: vim-hexokinase
time([[Setup for vim-hexokinase]], true)
try_loadstring("\27LJ\2\2õ\2\0\0\2\0\b\0\r6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0K\0\1\0\1\0\2\thtml,full_hex,rgb,rgba,hsl,hsla,colour_names\bcss,full_hex,rgb,rgba,hsl,hsla,colour_names\31Hexokinase_ftOptInPatterns\1\6\0\0\rfull_hex\brgb\trgba\bhsl\thsla\29Hexokinase_optInPatterns\1\2\0\0\19backgroundfull\28Hexokinase_highlighters\6g\bvim\0", "setup", "vim-hexokinase")
time([[Setup for vim-hexokinase]], false)
time([[packadd for vim-hexokinase]], true)
vim.cmd [[packadd vim-hexokinase]]
time([[packadd for vim-hexokinase]], false)
-- Setup for: nvim-align
time([[Setup for nvim-align]], true)
try_loadstring("\27LJ\2\2g\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0Hcommand! -range=% -nargs=1 Align lua require'align'.align(<f-args>)\bcmd\bvim\0", "setup", "nvim-align")
time([[Setup for nvim-align]], false)
time([[packadd for nvim-align]], true)
vim.cmd [[packadd nvim-align]]
time([[packadd for nvim-align]], false)
-- Setup for: emmet-vim
time([[Setup for emmet-vim]], true)
require("plugins.emmet")
time([[Setup for emmet-vim]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\2á\1\0\0\4\0\a\0\v6\0\0\0'\1\1\0'\2\2\0'\3\3\0B\0\4\0016\0\4\0'\1\5\0B\0\2\0029\0\6\0B\0\1\1K\0\1\0\nsetup\22plugins.nvim-tree\frequire\21Toggle Nvim Tree\28<CMD>NvimTreeToggle<CR>\6`\rnnoremap\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
time([[packadd for nvim-tree.lua]], true)
vim.cmd [[packadd nvim-tree.lua]]
time([[packadd for nvim-tree.lua]], false)
-- Setup for: vim-sayonara
time([[Setup for vim-sayonara]], true)
try_loadstring("\27LJ\2\2p\0\0\6\0\5\0\b5\0\0\0006\1\1\0'\2\2\0'\3\3\0\18\4\0\0'\5\4\0B\1\5\1K\0\1\0\28Close Window/Buffer/Vim\22<CMD>Sayonara<CR>\15<C-w><C-w>\rnnoremap\1\0\1\vsilent\2\0", "setup", "vim-sayonara")
time([[Setup for vim-sayonara]], false)
time([[packadd for vim-sayonara]], true)
vim.cmd [[packadd vim-sayonara]]
time([[packadd for vim-sayonara]], false)
-- Setup for: suda.vim
time([[Setup for suda.vim]], true)
try_loadstring("\27LJ\2\2`\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0K\0\1\0\23[Suda] Password : \16suda#prompt\20suda_smart_edit\6g\bvim\0", "setup", "suda.vim")
time([[Setup for suda.vim]], false)
time([[packadd for suda.vim]], true)
vim.cmd [[packadd suda.vim]]
time([[packadd for suda.vim]], false)
-- Setup for: vim-fugitive
time([[Setup for vim-fugitive]], true)
try_loadstring("\27LJ\2\2°\3\0\0\4\0\23\0$6\0\0\0009\0\1\0'\1\2\0'\2\3\0B\0\3\0016\0\4\0'\1\5\0'\2\6\0'\3\a\0B\0\4\0016\0\4\0'\1\b\0'\2\t\0'\3\n\0B\0\4\0016\0\4\0'\1\v\0'\2\f\0'\3\r\0B\0\4\0016\0\4\0'\1\14\0'\2\15\0'\3\16\0B\0\4\0016\0\4\0'\1\17\0'\2\18\0'\3\19\0B\0\4\0016\0\4\0'\1\20\0'\2\21\0'\3\22\0B\0\4\1K\0\1\0\vBranch\22<CMD>G branch<CR>\15<Leader>gb\nMerge\21<CMD>G merge<CR>\15<Leader>gm\vCommit\22<CMD>G commit<CR>\15<Leader>gc\24Merge Right (3-Way)\25<CMD>diffget //3<CR>\15<Leader>gf\23Merge Left (2-Way)\25<CMD>diffget //2<CR>\15<Leader>gh\tMain\15<CMD>G<CR>\15<Leader>gg\tnmap\bGit\14<leader>g\nnname\tmapx\0", "setup", "vim-fugitive")
time([[Setup for vim-fugitive]], false)
time([[packadd for vim-fugitive]], true)
vim.cmd [[packadd vim-fugitive]]
time([[packadd for vim-fugitive]], false)
-- Setup for: glow.nvim
time([[Setup for glow.nvim]], true)
try_loadstring("\27LJ\2\2c\0\0\5\0\5\0\a6\0\0\0'\1\1\0'\2\2\0'\3\3\0'\4\4\0B\0\5\1K\0\1\0\27Preview File With Glow\vsilent\18<CMD>Glow<CR>\15<leader>pm\rnnoremap\0", "setup", "glow.nvim")
time([[Setup for glow.nvim]], false)
-- Setup for: lazygit.nvim
time([[Setup for lazygit.nvim]], true)
try_loadstring("\27LJ\2\2¸\2\0\0\5\0\r\1\0276\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0*\1\0\0=\1\3\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\6\0006\0\0\0009\0\1\0)\1\0\0=\1\a\0006\0\b\0'\1\t\0'\2\n\0'\3\v\0'\4\f\0B\0\5\1K\0\1\0\18Open Lazy Git\vsilent\21<CMD>LazyGit<CR>\15<leader>gt\rnnoremap\30lazygit_use_neovim_remote(lazygit_floating_window_use_plenary\1\5\0\0\b‚ï≠\b‚ïÆ\b‚ï∞\b‚ïØ)lazygit_floating_window_corner_chars+lazygit_floating_window_scaling_factor%lazygit_floating_window_winblend\6g\bvimÕô≥Ê\fÊÃ©ˇ\3\0", "setup", "lazygit.nvim")
time([[Setup for lazygit.nvim]], false)
-- Setup for: sqlite.lua
time([[Setup for sqlite.lua]], true)
try_loadstring("\27LJ\2\2M\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\31/lib64/libsqlite3.so.0.8.6\21sqlite_clib_path\6g\bvim\0", "setup", "sqlite.lua")
time([[Setup for sqlite.lua]], false)
time([[packadd for sqlite.lua]], true)
vim.cmd [[packadd sqlite.lua]]
time([[packadd for sqlite.lua]], false)
-- Setup for: wally.nvim
time([[Setup for wally.nvim]], true)
try_loadstring("\27LJ\2\2é\1\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\a\0\0\aqf\15vista_kind\rterminal\rNvimtree\fTrouble\vpacker\19wally_sidebars\17~/.cache/wal\18wally_wal_dir\6g\bvim\0", "setup", "wally.nvim")
time([[Setup for wally.nvim]], false)
time([[packadd for wally.nvim]], true)
vim.cmd [[packadd wally.nvim]]
time([[packadd for wally.nvim]], false)
-- Setup for: lightspeed.nvim
time([[Setup for lightspeed.nvim]], true)
try_loadstring("\27LJ\2\2Ö\3\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0Â\2    nmap <expr> f reg_recording() . reg_executing() == \"\" ? \"<Plug>Lightspeed_f\" : \"f\"\n    nmap <expr> F reg_recording() . reg_executing() == \"\" ? \"<Plug>Lightspeed_F\" : \"F\"\n    nmap <expr> t reg_recording() . reg_executing() == \"\" ? \"<Plug>Lightspeed_t\" : \"t\"\n    nmap <expr> T reg_recording() . reg_executing() == \"\" ? \"<Plug>Lightspeed_T\" : \"T\"\n    \bcmd\bvim\0", "setup", "lightspeed.nvim")
time([[Setup for lightspeed.nvim]], false)
time([[packadd for lightspeed.nvim]], true)
vim.cmd [[packadd lightspeed.nvim]]
time([[packadd for lightspeed.nvim]], false)
-- Setup for: vim-markdown
time([[Setup for vim-markdown]], true)
try_loadstring('\27LJ\2\2ä\1\0\0\2\0\5\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0\22vim_markdown_math\29vim_markdown_frontmatter"vim_markdown_folding_disabled\6g\bvim\0', "setup", "vim-markdown")
time([[Setup for vim-markdown]], false)
-- Config for: mkdnflow.nvim
time([[Config for mkdnflow.nvim]], true)
try_loadstring("\27LJ\2\2“\1\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\1B\0\2\1K\0\1\0\14filetypes\1\0\3\amd\2\brmd\2\rmarkdown\2\1\0\5\20new_file_prefix\25os.date('%Y-%m-%d-')\16create_dirs\2\20evaluate_prefix\2\21default_mappings\1\22links_relative_to\nfirst\nsetup\rmkdnflow\frequire\0", "config", "mkdnflow.nvim")
time([[Config for mkdnflow.nvim]], false)
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
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
require("plugins.alpha")
time([[Config for alpha-nvim]], false)
-- Config for: curstr.nvim
time([[Config for curstr.nvim]], true)
try_loadstring("\27LJ\2\2¬\a\0\0\14\0001\0c5\0\16\0004\1\17\0005\2\0\0>\2\1\0015\2\1\0>\2\2\0015\2\2\0>\2\3\0015\2\3\0>\2\4\0015\2\4\0>\2\5\0015\2\5\0>\2\6\0015\2\6\0>\2\a\0015\2\a\0>\2\b\0015\2\b\0>\2\t\0015\2\t\0>\2\n\0015\2\n\0>\2\v\0015\2\v\0>\2\f\0015\2\f\0>\2\r\0015\2\r\0>\2\14\0015\2\14\0>\2\15\0015\2\15\0>\2\16\1=\1\17\0005\1\21\0005\2\19\0005\3\18\0=\3\20\2=\2\22\0015\2\23\0004\3\0\0=\3\20\2=\2\17\0014\2\0\0006\3\24\0009\4\17\0B\3\2\4X\6\25Ä5\b\26\0005\t\25\0=\t\20\b5\t\27\0004\n\3\0:\v\1\a>\v\1\n:\v\2\a>\v\2\n=\n\28\t=\t\29\b'\t\30\0\18\n\6\0&\t\n\t<\b\t\0026\t\31\0009\t \t9\n\17\0019\n\20\n6\v!\0'\f\30\0\18\r\6\0&\f\r\fB\v\2\0A\t\1\1E\6\3\3R\6Â6\3\"\0009\3#\3'\4$\0\18\5\1\0\18\6\2\0B\3\4\2\18\1\3\0006\3%\0'\4&\0B\3\2\0029\3'\0035\4(\0=\1)\0045\5.\0005\6+\0005\a*\0=\a\29\0065\a,\0=\a-\6=\6/\5=\0050\4B\3\2\1K\0\1\0\fsources\26vim/autoload_function\1\0\0\14filetypes\1\4\0\0\bvim\vpython\blua\1\0\0\1\0\1\21include_packpath\2\19source_aliases\1\0\0\nsetup\vcurstr\frequire\nforce\15tbl_extend\bvim\rtostring\vinsert\ntable\tword\topts\nwords\1\0\1\15normalized\2\1\0\0\1\2\0\0\19togglable/word\vipairs\1\0\0\ropenable\1\0\0\nnames\1\0\0\1\6\0\0\17vim/function\16vim/runtime\14directory\tfile\blua\14togglable\1\0\0\1\3\0\0\rvertical\15horizontal\1\3\0\0\tnext\rprevious\1\3\0\0\nlight\tdark\1\3\0\0\nwhite\nblack\1\3\0\0\afg\abg\1\3\0\0\15foreground\15background\1\3\0\0\valways\nnever\1\3\0\0\nright\tleft\1\3\0\0\btop\vbottom\1\3\0\0\topen\nclose\1\3\0\0\aor\band\1\3\0\0\aon\boff\1\3\0\0\byes\ano\1\3\0\0\venable\fdisable\1\3\0\0\ttrue\nfalse\1\3\0\0\0061\0060\0", "config", "curstr.nvim")
time([[Config for curstr.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require("plugins.autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-align
time([[Config for nvim-align]], true)
try_loadstring("\27LJ\2\2\0\0\4\0\b\0\0186\0\0\0'\1\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0006\1\2\0009\1\3\0019\1\5\1B\1\1\0A\0\0\0026\1\2\0009\1\6\1'\2\a\0\18\3\0\0&\2\3\2B\1\2\1K\0\1\0\vAlign \bcmd\fgetchar\fnr2char\afn\bvim\fAlign: \nprint#\1\0\2\0\3\0\0046\0\0\0003\1\2\0=\1\1\0K\0\1\0\0\nalign\tUtil\0", "config", "nvim-align")
time([[Config for nvim-align]], false)
-- Config for: wally.nvim
time([[Config for wally.nvim]], true)
require("wally").colorscheme()
time([[Config for wally.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\2ã\r\0\0\t\0K\0¡\0016\0\0\0'\1\1\0B\0\2\0029\0\2\0006\1\0\0'\2\3\0B\1\2\0029\1\4\0015\2\5\0005\3\6\0=\3\a\0025\3\b\0004\4\0\0=\4\t\3=\3\n\0025\3\v\0=\3\f\0025\3\r\0005\4\14\0004\5\29\0005\6\15\0\18\a\0\0'\b\16\0B\a\2\2=\a\17\6>\6\1\0055\6\18\0\18\a\0\0'\b\19\0B\a\2\2=\a\17\6>\6\2\0055\6\20\0\18\a\0\0'\b\21\0B\a\2\2=\a\17\6>\6\3\0055\6\22\0\18\a\0\0'\b\23\0B\a\2\2=\a\17\6>\6\4\0055\6\24\0\18\a\0\0'\b\25\0B\a\2\2=\a\17\6>\6\5\0055\6\26\0\18\a\0\0'\b\27\0B\a\2\2=\a\17\6>\6\6\0055\6\28\0\18\a\0\0'\b\29\0B\a\2\2=\a\17\6>\6\a\0055\6\30\0\18\a\0\0'\b\31\0B\a\2\2=\a\17\6>\6\b\0055\6 \0\18\a\0\0'\b!\0B\a\2\2=\a\17\6>\6\t\0055\6\"\0\18\a\0\0'\b#\0B\a\2\2=\a\17\6>\6\n\0055\6$\0\18\a\0\0'\b%\0B\a\2\2=\a\17\6>\6\v\0055\6&\0\18\a\0\0'\b'\0B\a\2\2=\a\17\6>\6\f\0055\6(\0\18\a\0\0'\b)\0B\a\2\2=\a\17\6>\6\r\0055\6*\0\18\a\0\0'\b+\0B\a\2\2=\a\17\6>\6\14\0055\6,\0\18\a\0\0'\b-\0B\a\2\2=\a\17\6>\6\15\0055\6.\0\18\a\0\0'\b/\0B\a\2\2=\a\17\6>\6\16\0055\0060\0\18\a\0\0'\b1\0B\a\2\2=\a\17\6>\6\17\0055\0062\0\18\a\0\0'\b3\0B\a\2\2=\a\17\6>\6\18\0055\0064\0\18\a\0\0'\b5\0B\a\2\2=\a\17\6>\6\19\0055\0066\0\18\a\0\0'\b7\0B\a\2\2=\a\17\6>\6\20\0055\0068\0\18\a\0\0'\b9\0B\a\2\2=\a\17\6>\6\21\0055\6:\0\18\a\0\0'\b;\0B\a\2\2=\a\17\6>\6\22\0055\6<\0\18\a\0\0'\b=\0B\a\2\2=\a\17\6>\6\23\0055\6>\0\18\a\0\0'\b?\0B\a\2\2=\a\17\6>\6\24\0055\6@\0\18\a\0\0'\bA\0B\a\2\2=\a\17\6>\6\25\0055\6B\0\18\a\0\0'\bC\0B\a\2\2=\a\17\6>\6\26\0055\6D\0\18\a\0\0'\bE\0B\a\2\2=\a\17\6>\6\27\0055\6F\0\18\a\0\0'\bG\0B\a\2\2=\a\17\6>\6\28\5=\5H\4=\4I\3=\3J\2B\1\2\1K\0\1\0\tview\rmappings\tlist\16toggle_help\1\0\1\bkey\6?\nclose\1\0\1\bkey\6q\16system_open\1\0\1\bkey\6O\vdir_up\1\0\1\bkey\6-\18next_git_item\1\0\1\bkey\a]c\18prev_git_item\1\0\1\bkey\a[c\23copy_absolute_path\1\0\1\bkey\agy\14copy_path\1\0\1\bkey\6Y\14copy_name\1\0\1\bkey\6y\npaste\1\0\1\bkey\6p\tcopy\1\0\1\bkey\6c\bcut\1\0\1\bkey\6x\16full_rename\1\0\1\bkey\6R\vrename\1\0\1\bkey\6r\vremove\1\0\1\bkey\6d\vcreate\1\0\1\bkey\6a\frefresh\1\0\1\bkey\n<C-r>\20toggle_dotfiles\1\0\1\bkey\6.\19toggle_ignored\1\0\1\bkey\6,\15close_node\1\0\1\bkey\t<BS>\16parent_node\1\0\1\bkey\6P\17next_sibling\1\0\1\bkey\6>\17prev_sibling\1\0\1\bkey\6<\vtabnew\1\0\1\bkey\n<C-t>\nsplit\1\0\1\bkey\n<C-x>\vvsplit\1\0\1\bkey\n<C-v>\acd\1\0\1\bkey\n<C-]>\acb\tedit\1\0\1\bkey\t<CR>\1\0\1\16custom_only\2\1\0\3\nwidth\3\30\tside\tleft\16auto_resize\2\vignore\1\a\0\0\t.git\17node_modules\15__sapper__\r.routify\tdist\v.cache\24update_focused_file\16ignore_list\1\0\2\15update_cwd\2\venable\2\16diagnostics\1\0\1\venable\2\1\0\5\15update_cwd\2\18disable_netrw\1\18hide_dotfiles\3\0\18hijack_cursor\2\17hijack_netrw\2\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: better-escape.nvim
time([[Config for better-escape.nvim]], true)
try_loadstring("\27LJ\2\2í\1\0\0\3\0\n\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0016\2\6\0009\2\a\0029\2\b\2=\2\t\1B\0\2\1K\0\1\0\ftimeout\15timeoutlen\6o\bvim\fmapping\1\0\1\tkeys\15<Esc><Esc>\1\2\0\0\ajk\nsetup\18better_escape\frequire\0", "config", "better-escape.nvim")
time([[Config for better-escape.nvim]], false)
-- Config for: windline.nvim
time([[Config for windline.nvim]], true)
try_loadstring("\27LJ\2\0027\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0\24WindLineFloatToggle\bcmd\bvimR\1\0\3\0\5\0\t6\0\0\0'\1\1\0B\0\2\0016\0\2\0009\0\3\0003\1\4\0)\2,\1B\0\3\1K\0\1\0\0\rdefer_fn\bvim\21plugins.windline\frequire\0", "config", "windline.nvim")
time([[Config for windline.nvim]], false)
-- Config for: clipboard-image.nvim
time([[Config for clipboard-image.nvim]], true)
try_loadstring("\27LJ\2\2-\0\0\2\0\3\0\0046\0\0\0009\0\1\0'\1\2\0D\0\2\0\18%Y%m%d-%H%M%S\tdate\aosJ\0\0\3\0\5\0\b6\0\0\0009\0\1\0009\0\2\0'\1\3\0B\0\2\0026\1\4\0\18\2\0\0D\1\2\0\rtostring\17Image Name: \ninput\afn\bvim⁄\1\1\0\4\0\v\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\6\0005\2\3\0003\3\4\0=\3\5\2=\2\a\0015\2\b\0003\3\t\0=\3\5\2=\2\n\1B\0\2\1K\0\1\0\rmarkdown\0\1\0\3\16img_dir_txt\bimg\naffix\17![Image](%s)\fimg_dir\bimg\fdefault\1\0\0\rimg_name\0\1\0\3\16img_dir_txt\bimg\naffix\a%s\fimg_dir\bimg\nsetup\20clipboard-image\frequire\0", "config", "clipboard-image.nvim")
time([[Config for clipboard-image.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require("plugins.cmp")
time([[Config for nvim-cmp]], false)
-- Config for: due.nvim
time([[Config for due.nvim]], true)
try_loadstring("\27LJ\2\2ê\2\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\r\foverdue\fOVERDUE\rtoday_hi\14Character\16pattern_end\6>\ntoday\nTODAY\18pattern_start\6<\17prescript_hi\fComment\vdue_hi\vString\14prescript\ndue: \19use_clock_time\2\21default_due_time\rmidnight\15overdue_hi\nError\fdate_hi\fConceal\aft\t*.md\nsetup\rdue_nvim\frequire\0", "config", "due.nvim")
time([[Config for due.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\2–\1\0\0\3\0\6\0\v6\0\0\0'\1\1\0B\0\2\0027\0\1\0006\0\1\0009\0\2\0005\1\3\0005\2\4\0=\2\5\1B\0\2\1K\0\1\0\nicons\1\0\6\tHINT\tÔ†µ \nTRACE\b‚úé\nDEBUG\tÔÜà \tWARN\tÔî© \tINFO\tÔëâ \nERROR\tÔôô \1\0\3\22background_colour\f#161822\ftimeout\3–\15\vstages\22fade_in_slide_out\nsetup\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
require("plugins.neoscroll")
time([[Config for neoscroll.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\2¢\4\0\0\4\0\v\0\0176\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\a\0006\2\3\0009\2\4\0029\2\5\2'\3\6\0B\2\2\2=\2\b\1B\0\2\0016\0\3\0009\0\t\0'\1\n\0B\0\2\1K\0\1\0â\3                    imap <silent><expr> <C-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-j>'\n                    snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(1)<CR>\n                    snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>\n                    inoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>\n                \bcmd\npaths\1\0\0\vconfig\fstdpath\afn\bvim\14lazy_load luasnip.loaders.from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require("lsp")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
require("plugins.bufferline")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\2^\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequireŒ\1\1\0\3\0\f\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\0013\2\n\0=\2\v\1B\0\2\1K\0\1\0\rpre_hook\0\ropleader\1\0\2\nblock\agb\tline\agc\ftoggler\1\0\2\nblock\bgbc\tline\bgcc\rmappings\1\0\2\nextra\1\nbasic\2\1\0\2\vignore\a^$\fpadding\2\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: lightspeed.nvim
time([[Config for lightspeed.nvim]], true)
try_loadstring("\27LJ\2\2Ö\2\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\a\25grey_out_search_area\2\24jump_to_first_match\2)jump_on_partial_input_safety_timeout\3ê\3+match_only_the_start_of_same_char_seqs\2\30full_inclusive_prefix_key\n<C-x>\27highlight_unique_chars\1\21limit_ft_matches\3\b\nsetup\15lightspeed\frequire\0", "config", "lightspeed.nvim")
time([[Config for lightspeed.nvim]], false)
-- Config for: dial.nvim
time([[Config for dial.nvim]], true)
try_loadstring("\27LJ\2\2„\1\0\0\3\0\6\0\b6\0\0\0'\1\1\0B\0\2\0029\1\2\0009\1\3\0015\2\5\0=\2\4\1K\0\1\0\1\n\0\0\19number#decimal\15number#hex\18number#binary\14color#hex\17date#[%H:%M]\20date#[%Y-%m-%d]\25char#alph#small#word\27char#alph#capital#word\27markup#markdown#header\vnormal\15searchlist\vconfig\tdial\frequire\0", "config", "dial.nvim")
time([[Config for dial.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TableModeToggle lua require("packer.load")({'vim-table-mode'}, { cmd = "TableModeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file EmmetInstall lua require("packer.load")({'emmet-vim'}, { cmd = "EmmetInstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipRun lua require("packer.load")({'sniprun'}, { cmd = "SnipRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'lsp-trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TableModeRealign lua require("packer.load")({'vim-table-mode'}, { cmd = "TableModeRealign", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LazyGit lua require("packer.load")({'lazygit.nvim'}, { cmd = "LazyGit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Glow lua require("packer.load")({'glow.nvim'}, { cmd = "Glow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSHighlightCapturesUnderCursor lua require("packer.load")({'playground'}, { cmd = "TSHighlightCapturesUnderCursor", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'lsp-trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <Plug>SnipRun <cmd>lua require("packer.load")({'sniprun'}, { keys = "<lt>Plug>SnipRun", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>SnupClose <cmd>lua require("packer.load")({'sniprun'}, { keys = "<lt>Plug>SnupClose", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>(EasyAlign) <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "<lt>Plug>(EasyAlign)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>f <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>Leader>f", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType bib ++once lua require("packer.load")({'texmagic.nvim'}, { ft = "bib" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-table-mode', 'vim-markdown', 'markdown-preview.nvim', 'glow.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
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
