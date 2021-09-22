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
  LuaSnip = {
    config = { "\27LJ\1\2¢\4\0\0\4\0\v\0\0174\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\a\0004\2\3\0007\2\4\0027\2\5\2%\3\6\0>\2\2\2:\2\b\1>\0\2\0014\0\3\0007\0\t\0%\1\n\0>\0\2\1G\0\1\0â\3                    snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(1)<CR>\n                    imap <silent><expr> <C-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-j>'\n                    snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>\n                    inoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>\n                \bcmd\npaths\1\0\0\vconfig\fstdpath\afn\bvim\14lazy_load luasnip.loaders.from_vscode\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { 'require("plugins.alpha")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/alpha-nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-spell"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["curstr.nvim"] = {
    config = { "\27LJ\1\2•\6\0\0\14\0)\0Y3\0\15\0002\1\16\0003\2\0\0;\2\1\0013\2\1\0;\2\2\0013\2\2\0;\2\3\0013\2\3\0;\2\4\0013\2\4\0;\2\5\0013\2\5\0;\2\6\0013\2\6\0;\2\a\0013\2\a\0;\2\b\0013\2\b\0;\2\t\0013\2\t\0;\2\n\0013\2\n\0;\2\v\0013\2\v\0;\2\f\0013\2\f\0;\2\r\0013\2\r\0;\2\14\0013\2\14\0;\2\15\1:\1\16\0003\1\20\0003\2\18\0003\3\17\0:\3\19\2:\2\21\0013\2\22\0002\3\0\0:\3\19\2:\2\16\0012\2\0\0004\3\23\0007\4\16\0>\3\2\4T\6\25Ä3\b\25\0003\t\24\0:\t\19\b3\t\26\0002\n\3\0008\v\1\a;\v\1\n8\v\2\a;\v\2\n:\n\27\t:\t\28\b%\t\29\0\16\n\6\0$\t\n\t9\b\t\0024\t\30\0007\t\31\t7\n\16\0017\n\19\n4\v \0%\f\29\0\16\r\6\0$\f\r\f>\v\2\0=\t\1\1A\6\3\3N\6Â4\3!\0007\3\"\3%\4#\0\16\5\1\0\16\6\2\0>\3\4\2\16\1\3\0004\3$\0%\4%\0>\3\2\0027\3&\0033\4'\0:\1(\4>\3\2\1G\0\1\0\19source_aliases\1\0\0\nsetup\vcurstr\frequire\nforce\15tbl_extend\bvim\rtostring\vinsert\ntable\tword\topts\nwords\1\0\1\15normalized\2\1\0\0\1\2\0\0\19togglable/word\vipairs\1\0\0\ropenable\1\0\0\nnames\1\0\0\1\6\0\0\17vim/function\16vim/runtime\14directory\tfile\blua\14togglable\1\0\0\1\3\0\0\nlight\tdark\1\3\0\0\nwhite\nblack\1\3\0\0\afg\abg\1\3\0\0\15foreground\15background\1\3\0\0\valways\nnever\1\3\0\0\ahe\bshe\1\3\0\0\nright\tleft\1\3\0\0\btop\vbottom\1\3\0\0\topen\nclose\1\3\0\0\aor\band\1\3\0\0\aon\boff\1\3\0\0\byes\ano\1\3\0\0\venable\fdisable\1\3\0\0\ttrue\nfalse\1\3\0\0\0061\0060\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/curstr.nvim"
  },
  ["dial.nvim"] = {
    config = { "\27LJ\1\2„\1\0\0\3\0\6\0\b4\0\0\0%\1\1\0>\0\2\0027\1\2\0007\1\3\0013\2\5\0:\2\4\1G\0\1\0\1\n\0\0\19number#decimal\15number#hex\18number#binary\14color#hex\17date#[%H:%M]\20date#[%Y-%m-%d]\25char#alph#small#word\27char#alph#capital#word\27markup#markdown#header\vnormal\15searchlist\vconfig\tdial\frequire\0" },
    keys = { { "", "<Plug>(dial-increment)" }, { "", "<Plug>(dial-increment-additional)" }, { "", "<Plug>(dial-decrement)" }, { "", "<Plug>(dial-decrement-additiona)" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/dial.nvim"
  },
  ["editorconfig.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/editorconfig.nvim"
  },
  ["emmet-vim"] = {
    commands = { "EmmetInstall" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/emmet-vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { 'require("plugins.gitsigns")' },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    wants = { "plenary.nvim" }
  },
  ["glow.nvim"] = {
    commands = { "Glow" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/glow.nvim"
  },
  ["hop.nvim"] = {
    commands = { "HopWord", "HopPattern" },
    config = { 'require("hop").setup()' },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/hop.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  ["lazygit.nvim"] = {
    commands = { "LazyGit" },
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/lazygit.nvim"
  },
  ["lightspeed.nvim"] = {
    config = { "\27LJ\1\2Ö\2\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\a\25grey_out_search_area\2)jump_on_partial_input_safety_timeout\3ê\3\24jump_to_first_match\2+match_only_the_start_of_same_char_seqs\2\21limit_ft_matches\3\b\30full_inclusive_prefix_key\n<c-x>\27highlight_unique_chars\1\nsetup\15lightspeed\frequire\0" },
    keys = { { "", "<Plug>Lightspeed_f" }, { "", "<Plug>Lightspeed_F" }, { "", "<Plug>Lightspeed_t" }, { "", "<Plug>Lightspeed_T" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/lightspeed.nvim"
  },
  ["lsp-trouble.nvim"] = {
    commands = { "Trouble", "TroubleToggle" },
    config = { 'require("plugins.trouble")' },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/lsp-trouble.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { 'require("plugins.autopairs")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    config = { 'require("plugins.bufferline")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    config = { 'require("plugins.cmp")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    commands = { "ColorizerToggle" },
    config = { "\27LJ\1\2o\0\0\3\0\b\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0:\2\a\1>\0\2\1G\0\1\0\thtml\1\0\1\nnames\1\bcss\1\0\1\vrgb_fn\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\1\2^\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequire§\1\1\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0001\2\4\0:\2\5\1>\0\2\1G\0\1\0\thook\0\1\0\5\17line_mapping\bgcc\20create_mappings\2\19marker_padding\2\21operator_mapping\agc\18comment_empty\1\nsetup\17nvim_comment\frequire\0" },
    keys = { { "", "gc" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-comment"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { 'require("lsp")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\1\2‘\1\0\0\4\0\a\0\v4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\3\0003\3\4\0:\3\5\2>\1\2\0014\1\6\0:\0\1\1G\0\1\0\bvim\nicons\1\0\6\tHINT\tÔ†µ \nTRACE\b‚úé\nDEBUG\tÔÜà \tWARN\tÔî© \tINFO\tÔëâ \nERROR\tÔôô \1\0\3\22background_colour\f#161822\ftimeout\3–\15\vstages\22fade_in_slide_out\nsetup\vnotify\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { 'require("plugins.nvim-tree")' },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["persistence.nvim"] = {
    config = { "\27LJ\1\2œ\1\0\0\5\0\r\0\0214\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\t\0004\2\3\0007\2\4\0027\2\5\0024\3\3\0007\3\4\0037\3\6\3%\4\a\0>\3\2\2%\4\b\0$\3\4\3>\2\2\2:\2\n\0013\2\v\0:\2\f\1>\0\2\1G\0\1\0\foptions\1\5\0\0\fbuffers\vcurdir\rtabpages\fwinsize\bdir\1\0\0\15/sessions/\ncache\fstdpath\vexpand\afn\bvim\nsetup\16persistence\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/persistence.nvim"
  },
  playground = {
    commands = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" },
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  sniprun = {
    commands = { "SnipRun" },
    config = { "\27LJ\1\2Ä\1\0\0\3\0\b\0\f4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\5\0004\2\3\0007\2\4\2:\2\4\0013\2\6\0:\2\a\1>\0\2\1G\0\1\0\fdisplay\1\3\0\0\rTerminal\18VirtualTextOk\1\0\0\fborders\tUtil\nsetup\fsniprun\frequire\0" },
    keys = { { "", "<Plug>SnipRun" }, { "", "<Plug>SnupClose" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/sniprun"
  },
  ["sqlite.lua"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/sqlite.lua"
  },
  ["startuptime.vim"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/startuptime.vim"
  },
  ["suda.vim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/suda.vim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { 'require("plugins.telescope")' },
    keys = { { "n", "<Leader>f" } },
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    wants = { "sqlite.lua", "plenary.nvim", "telescope-fzf-native.nvim", "telescope-media-files.nvim", "telescope-frecency.nvim" }
  },
  ["texmagic.nvim"] = {
    config = { "\27LJ\1\2Ú\1\0\0\5\0\14\0\0174\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\4\0%\1\5\0>\0\2\0027\0\6\0003\1\f\0003\2\n\0003\3\a\0003\4\b\0:\4\t\3:\3\v\2:\2\r\1>\0\2\1G\0\1\0\fengines\1\0\0\rpdflatex\1\0\0\targs\1\6\0\0\14-pdflatex\29-interaction=nonstopmode\15-synctex=1\b-pv\a%f\1\0\2\17isContinuous\1\15executable\flatexmk\nsetup\rtexmagic\frequire\nlatex\15tex_flavor\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/texmagic.nvim"
  },
  ["twilight.nvim"] = {
    commands = { "Twilight", "TwilightEnable", "TwilightDisable" },
    config = { "\27LJ\1\2Ë\1\0\0\4\0\v\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\6\0003\2\3\0003\3\4\0:\3\5\2:\2\a\0013\2\b\0:\2\t\0012\2\0\0:\2\n\1>\0\2\1G\0\1\0\fexclude\vexpand\1\5\0\0\rfunction\vmethod\17if_statement\ntable\fdimming\1\0\2\15treesitter\2\fcontext\3\5\ncolor\1\3\0\0\vNormal\f#ffffff\1\0\2\nalpha\4≥ÊÃô\3≥ÊÃ˛\3\rinactive\1\nsetup\rtwilight\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/twilight.nvim"
  },
  ["vim-easy-align"] = {
    keys = { { "", "<Plug>(EasyAlign)" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-easy-align"
  },
  ["vim-markdown"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-markdown"
  },
  ["vim-matchup"] = {
    after_files = { "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = true,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-matchup"
  },
  ["vim-sayonara"] = {
    commands = { "Sayonara" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-sayonara"
  },
  ["vim-silicon"] = {
    commands = { "Silicon" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-silicon"
  },
  ["vim-smoothie"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-smoothie"
  },
  ["vim-table-mode"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-table-mode"
  },
  ["which-key.nvim"] = {
    config = { 'require("plugins.which-key")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  },
  ["windline.nvim"] = {
    config = { 'require("plugins.windline")' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/windline.nvim"
  },
  ["xresources-nvim"] = {
    config = { 'require("xresources").colorscheme()' },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/xresources-nvim"
  },
  ["zen-mode.nvim"] = {
    commands = { "ZenMode" },
    config = { 'require("plugins.zen-mode")' },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim"
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
try_loadstring("\27LJ\1\2∂\1\0\0\5\0\n\0\0174\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0003\4\6\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\a\0%\3\b\0003\4\t\0>\0\5\1G\0\1\0\1\0\1\fnoremap\2\24<CMD>HopPattern<CR>\14<leader>x\1\0\1\fnoremap\2\21<CMD>HopWord<CR>\14<leader>z\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "hop.nvim")
time([[Setup for hop.nvim]], false)
-- Setup for: vim-smoothie
time([[Setup for vim-smoothie]], true)
try_loadstring("\27LJ\1\2ñ\1\0\0\2\0\5\0\r4\0\0\0007\0\1\0'\1\30\0:\1\2\0004\0\0\0007\0\1\0'\1\n\0:\1\3\0004\0\0\0007\0\1\0'\1\n\0:\1\4\0G\0\1\0!smoothie_speed_linear_factor#smoothie_speed_constant_factor\29smoothie_update_interval\6g\bvim\0", "setup", "vim-smoothie")
time([[Setup for vim-smoothie]], false)
time([[packadd for vim-smoothie]], true)
vim.cmd [[packadd vim-smoothie]]
time([[packadd for vim-smoothie]], false)
-- Setup for: dial.nvim
time([[Setup for dial.nvim]], true)
try_loadstring("\27LJ\1\2•\2\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0Ö\2    nmap <C-a> <Plug>(dial-increment)\n    nmap <C-x> <Plug>(dial-decrement)\n    vmap <C-a> <Plug>(dial-increment)\n    vmap <C-x> <Plug>(dial-decrement)\n    vmap g<C-a> <Plug>(dial-increment-additional)\n    vmap g<C-x> <Plug>(dial-decrement-additional)\n    \bcmd\bvim\0", "setup", "dial.nvim")
time([[Setup for dial.nvim]], false)
-- Setup for: sniprun
time([[Setup for sniprun]], true)
try_loadstring("\27LJ\1\2π\1\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0ô\1                nmap <leader>sc <Plug>SnipClose\n                nmap <leader>sr <Plug>SnipRun\n                vmap sr <Plug>SnipRun\n                \bcmd\bvim\0", "setup", "sniprun")
time([[Setup for sniprun]], false)
-- Setup for: indent-blankline.nvim
time([[Setup for indent-blankline.nvim]], true)
require("plugins.indent-blankline")
time([[Setup for indent-blankline.nvim]], false)
time([[packadd for indent-blankline.nvim]], true)
vim.cmd [[packadd indent-blankline.nvim]]
time([[packadd for indent-blankline.nvim]], false)
-- Setup for: vim-easy-align
time([[Setup for vim-easy-align]], true)
try_loadstring("\27LJ\1\2§\1\0\0\5\0\t\0\0174\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0003\4\6\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\a\0%\2\4\0%\3\5\0003\4\b\0>\0\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\1\6x\1\0\2\vsilent\2\fnoremap\1\22<Plug>(EasyAlign)\aga\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "vim-easy-align")
time([[Setup for vim-easy-align]], false)
-- Setup for: vim-silicon
time([[Setup for vim-silicon]], true)
try_loadstring("\27LJ\1\2¥\3\0\0\3\0\15\0\0304\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\0\0007\0\1\0007\0\2\0%\1\5\0:\1\4\0004\0\0\0007\0\1\0007\0\2\0%\1\a\0:\1\6\0004\0\0\0007\0\1\0007\0\2\0%\1\t\0:\1\b\0004\0\0\0007\0\1\0007\0\2\0004\1\v\0007\1\f\1%\2\r\0>\1\2\2%\2\14\0$\1\2\1:\1\n\0G\0\1\0=/Pictures/Screenshots/silicon-{time:%Y-%m-%d-%H%M%S}.png\tHOME\vgetenv\aos\voutput\f#f8f8f2\15background\23FiraCode Nerd Font\tfont\fDracula\ntheme\1\0\n\rline-pad\3\3\14pad-horiz\3\30\rpad-vert\3\30\20window-controls\2\20shadow-offset-x\3\b\23shadow-blur-radius\3\5\16line-number\2\20shadow-offset-y\3\b\17round-corner\2\17shadow-color\f#434434\fsilicon\6g\bvim\0", "setup", "vim-silicon")
time([[Setup for vim-silicon]], false)
-- Setup for: curstr.nvim
time([[Setup for curstr.nvim]], true)
try_loadstring("\27LJ\1\2Ú\2\0\0\15\0\19\0%3\0\1\0003\1\0\0:\1\2\0003\1\3\0:\1\4\0003\1\5\0:\1\6\0004\1\a\0\16\2\0\0>\1\2\4D\4\23Ä8\6\1\5\14\0\6\0T\a\1Ä%\6\b\0008\a\2\5\14\0\a\0T\b\1Ä%\a\t\0004\b\n\0007\b\v\b7\b\f\b%\t\r\0004\n\14\0\16\v\4\0>\n\2\0024\v\15\0007\v\16\v%\f\17\0\16\r\6\0\16\14\a\0>\v\4\0023\f\18\0>\b\5\1B\4\3\3N\4ÁG\0\1\0\1\0\2\fnoremap\2\vsilent\0025<CMD>lua require('curstr').execute('%s', %s)<CR>\vformat\vstring\rtostring\6n\20nvim_set_keymap\bapi\bvim\a{}\5\npairs\21<leader><leader>\1\2\0\0\14togglable\a.,\1\2\0\0\14togglable\agf\1\0\0\1\3\0\0\ropenable\24{ action = 'open' }\0", "setup", "curstr.nvim")
time([[Setup for curstr.nvim]], false)
time([[packadd for curstr.nvim]], true)
vim.cmd [[packadd curstr.nvim]]
time([[packadd for curstr.nvim]], false)
-- Setup for: vim-matchup
time([[Setup for vim-matchup]], true)
try_loadstring("\27LJ\1\2j\0\0\2\0\4\0\0054\0\0\0007\0\1\0003\1\3\0:\1\2\0G\0\1\0\1\0\3\14highlight\vNormal\14fullwidth\2\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0", "setup", "vim-matchup")
time([[Setup for vim-matchup]], false)
time([[packadd for vim-matchup]], true)
vim.cmd [[packadd vim-matchup]]
time([[packadd for vim-matchup]], false)
-- Setup for: emmet-vim
time([[Setup for emmet-vim]], true)
try_loadstring("\27LJ\1\2Ö\1\0\0\2\0\a\0\r4\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0%\1\4\0:\1\3\0004\0\0\0007\0\1\0%\1\6\0:\1\5\0G\0\1\0\6,\26user_emmet_leader_key\6a\20user_emmet_mode\30user_emmet_install_global\6g\bvim\0", "setup", "emmet-vim")
time([[Setup for emmet-vim]], false)
-- Setup for: nvim-colorizer.lua
time([[Setup for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\1\2Y\0\2\a\0\5\0\t4\2\0\0007\2\1\0027\2\2\2%\3\3\0\16\4\0\0\16\5\1\0003\6\4\0>\2\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\6n\20nvim_set_keymap\bapi\bvimD\1\0\4\0\3\0\0061\0\0\0\16\1\0\0%\2\1\0%\3\2\0>\1\3\1G\0\1\0\29<CMD>ColorizerToggle<CR>\15<leader>cc\0\0", "setup", "nvim-colorizer.lua")
time([[Setup for nvim-colorizer.lua]], false)
-- Setup for: lightspeed.nvim
time([[Setup for lightspeed.nvim]], true)
try_loadstring('\27LJ\1\2Ö\3\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0Â\2    nmap <expr> f reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"\n    nmap <expr> F reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"\n    nmap <expr> t reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"\n    nmap <expr> T reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"\n    \bcmd\bvim\0', "setup", "lightspeed.nvim")
time([[Setup for lightspeed.nvim]], false)
-- Setup for: glow.nvim
time([[Setup for glow.nvim]], true)
try_loadstring("\27LJ\1\2Y\0\2\a\0\5\0\t4\2\0\0007\2\1\0027\2\2\2%\3\3\0\16\4\0\0\16\5\1\0003\6\4\0>\2\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\6n\20nvim_set_keymap\bapi\bvim9\1\0\4\0\3\0\0061\0\0\0\16\1\0\0%\2\1\0%\3\2\0>\1\3\1G\0\1\0\18<CMD>Glow<CR>\15<leader>gg\0\0", "setup", "glow.nvim")
time([[Setup for glow.nvim]], false)
-- Setup for: suda.vim
time([[Setup for suda.vim]], true)
try_loadstring("\27LJ\1\2`\0\0\2\0\5\0\t4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0%\1\4\0:\1\3\0G\0\1\0\23[Suda] Password : \16suda#prompt\20suda_smart_edit\6g\bvim\0", "setup", "suda.vim")
time([[Setup for suda.vim]], false)
time([[packadd for suda.vim]], true)
vim.cmd [[packadd suda.vim]]
time([[packadd for suda.vim]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\1\2ò\1\0\0\2\0\a\0\0174\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0'\1\0\0:\1\3\0004\0\0\0007\0\1\0'\1\0\0:\1\4\0004\0\0\0007\0\1\0%\1\6\0:\1\5\0G\0\1\0\ffirefox\17mkdp_browser\22mkdp_refresh_slow\20mkdp_auto_close\20mkdp_auto_start\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Setup for: vim-markdown
time([[Setup for vim-markdown]], true)
try_loadstring("\27LJ\1\2ä\1\0\0\2\0\5\0\r4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\3\0004\0\0\0007\0\1\0'\1\1\0:\1\4\0G\0\1\0\22vim_markdown_math\29vim_markdown_frontmatter\"vim_markdown_folding_disabled\6g\bvim\0", "setup", "vim-markdown")
time([[Setup for vim-markdown]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2¢\1\0\0\5\0\t\0\0174\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0003\4\6\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\a\0%\3\5\0003\4\b\0>\0\5\1G\0\1\0\1\0\1\fnoremap\2\15<leader>sa\1\0\1\fnoremap\2\28<CMD>NvimTreeToggle<CR>\6`\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Setup for: sqlite.lua
time([[Setup for sqlite.lua]], true)
try_loadstring("\27LJ\1\2G\0\0\2\0\4\0\0054\0\0\0007\0\1\0%\1\3\0:\1\2\0G\0\1\0\25/lib64/libsqlite3.so\21sqlite_clib_path\6g\bvim\0", "setup", "sqlite.lua")
time([[Setup for sqlite.lua]], false)
time([[packadd for sqlite.lua]], true)
vim.cmd [[packadd sqlite.lua]]
time([[packadd for sqlite.lua]], false)
-- Setup for: vim-sayonara
time([[Setup for vim-sayonara]], true)
try_loadstring("\27LJ\1\2X\0\2\a\0\5\0\t4\2\0\0007\2\1\0027\2\2\2%\3\3\0\16\4\0\0\16\5\1\0003\6\4\0>\2\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\5\20nvim_set_keymap\bapi\bvimÄ\1\1\0\4\0\6\0\0141\0\0\0\16\1\0\0%\2\1\0%\3\2\0>\1\3\1\16\1\0\0%\2\3\0%\3\4\0>\1\3\1\16\1\0\0%\2\5\0%\3\4\0>\1\3\1G\0\1\0\n<M-w>\22<CMD>Sayonara<CR>\15<leader>qq\23<CMD>Sayonara!<CR>\14<leader>q\0\0", "setup", "vim-sayonara")
time([[Setup for vim-sayonara]], false)
-- Setup for: zen-mode.nvim
time([[Setup for zen-mode.nvim]], true)
try_loadstring("\27LJ\1\2q\0\0\5\0\a\0\t4\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0003\4\6\0>\0\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\17:ZenMode<CR>\15<leader>gz\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "zen-mode.nvim")
time([[Setup for zen-mode.nvim]], false)
-- Setup for: lazygit.nvim
time([[Setup for lazygit.nvim]], true)
try_loadstring("\27LJ\1\2Y\0\2\a\0\5\0\t4\2\0\0007\2\1\0027\2\2\2%\3\3\0\16\4\0\0\16\5\1\0003\6\4\0>\2\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\6n\20nvim_set_keymap\bapi\bvim€\2\1\0\4\0\v\1\0264\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0(\1\0\0:\1\3\0004\0\0\0007\0\1\0003\1\5\0:\1\4\0004\0\0\0007\0\1\0'\1\0\0:\1\6\0004\0\0\0007\0\1\0'\1\0\0:\1\a\0001\0\b\0\16\1\0\0%\2\t\0%\3\n\0>\1\3\1G\0\1\0\21<CMD>LazyGit<CR>\15<leader>gt\0\30lazygit_use_neovim_remote(lazygit_floating_window_use_plenary\1\5\0\0\b‚ï≠\b‚ïÆ\b‚ï∞\b‚ïØ)lazygit_floating_window_corner_chars+lazygit_floating_window_scaling_factor%lazygit_floating_window_winblend\6g\bvimÕô≥Ê\fÊÃ©ˇ\3\0", "setup", "lazygit.nvim")
time([[Setup for lazygit.nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
require("plugins.bufferline")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require("lsp")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require("plugins.cmp")
time([[Config for nvim-cmp]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require("plugins.which-key")
time([[Config for which-key.nvim]], false)
-- Config for: windline.nvim
time([[Config for windline.nvim]], true)
require("plugins.windline")
time([[Config for windline.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
require("plugins.alpha")
time([[Config for alpha-nvim]], false)
-- Config for: curstr.nvim
time([[Config for curstr.nvim]], true)
try_loadstring("\27LJ\1\2•\6\0\0\14\0)\0Y3\0\15\0002\1\16\0003\2\0\0;\2\1\0013\2\1\0;\2\2\0013\2\2\0;\2\3\0013\2\3\0;\2\4\0013\2\4\0;\2\5\0013\2\5\0;\2\6\0013\2\6\0;\2\a\0013\2\a\0;\2\b\0013\2\b\0;\2\t\0013\2\t\0;\2\n\0013\2\n\0;\2\v\0013\2\v\0;\2\f\0013\2\f\0;\2\r\0013\2\r\0;\2\14\0013\2\14\0;\2\15\1:\1\16\0003\1\20\0003\2\18\0003\3\17\0:\3\19\2:\2\21\0013\2\22\0002\3\0\0:\3\19\2:\2\16\0012\2\0\0004\3\23\0007\4\16\0>\3\2\4T\6\25Ä3\b\25\0003\t\24\0:\t\19\b3\t\26\0002\n\3\0008\v\1\a;\v\1\n8\v\2\a;\v\2\n:\n\27\t:\t\28\b%\t\29\0\16\n\6\0$\t\n\t9\b\t\0024\t\30\0007\t\31\t7\n\16\0017\n\19\n4\v \0%\f\29\0\16\r\6\0$\f\r\f>\v\2\0=\t\1\1A\6\3\3N\6Â4\3!\0007\3\"\3%\4#\0\16\5\1\0\16\6\2\0>\3\4\2\16\1\3\0004\3$\0%\4%\0>\3\2\0027\3&\0033\4'\0:\1(\4>\3\2\1G\0\1\0\19source_aliases\1\0\0\nsetup\vcurstr\frequire\nforce\15tbl_extend\bvim\rtostring\vinsert\ntable\tword\topts\nwords\1\0\1\15normalized\2\1\0\0\1\2\0\0\19togglable/word\vipairs\1\0\0\ropenable\1\0\0\nnames\1\0\0\1\6\0\0\17vim/function\16vim/runtime\14directory\tfile\blua\14togglable\1\0\0\1\3\0\0\nlight\tdark\1\3\0\0\nwhite\nblack\1\3\0\0\afg\abg\1\3\0\0\15foreground\15background\1\3\0\0\valways\nnever\1\3\0\0\ahe\bshe\1\3\0\0\nright\tleft\1\3\0\0\btop\vbottom\1\3\0\0\topen\nclose\1\3\0\0\aor\band\1\3\0\0\aon\boff\1\3\0\0\byes\ano\1\3\0\0\venable\fdisable\1\3\0\0\ttrue\nfalse\1\3\0\0\0061\0060\0", "config", "curstr.nvim")
time([[Config for curstr.nvim]], false)
-- Config for: xresources-nvim
time([[Config for xresources-nvim]], true)
require("xresources").colorscheme()
time([[Config for xresources-nvim]], false)
-- Config for: persistence.nvim
time([[Config for persistence.nvim]], true)
try_loadstring("\27LJ\1\2œ\1\0\0\5\0\r\0\0214\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\t\0004\2\3\0007\2\4\0027\2\5\0024\3\3\0007\3\4\0037\3\6\3%\4\a\0>\3\2\2%\4\b\0$\3\4\3>\2\2\2:\2\n\0013\2\v\0:\2\f\1>\0\2\1G\0\1\0\foptions\1\5\0\0\fbuffers\vcurdir\rtabpages\fwinsize\bdir\1\0\0\15/sessions/\ncache\fstdpath\vexpand\afn\bvim\nsetup\16persistence\frequire\0", "config", "persistence.nvim")
time([[Config for persistence.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\1\2‘\1\0\0\4\0\a\0\v4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\3\0003\3\4\0:\3\5\2>\1\2\0014\1\6\0:\0\1\1G\0\1\0\bvim\nicons\1\0\6\tHINT\tÔ†µ \nTRACE\b‚úé\nDEBUG\tÔÜà \tWARN\tÔî© \tINFO\tÔëâ \nERROR\tÔôô \1\0\3\22background_colour\f#161822\ftimeout\3–\15\vstages\22fade_in_slide_out\nsetup\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require("plugins.autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\1\2¢\4\0\0\4\0\v\0\0174\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\a\0004\2\3\0007\2\4\0027\2\5\2%\3\6\0>\2\2\2:\2\b\1>\0\2\0014\0\3\0007\0\t\0%\1\n\0>\0\2\1G\0\1\0â\3                    snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(1)<CR>\n                    imap <silent><expr> <C-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-j>'\n                    snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>\n                    inoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>\n                \bcmd\npaths\1\0\0\vconfig\fstdpath\afn\bvim\14lazy_load luasnip.loaders.from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ZenMode lua require("packer.load")({'zen-mode.nvim'}, { cmd = "ZenMode", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSHighlightCapturesUnderCursor lua require("packer.load")({'playground'}, { cmd = "TSHighlightCapturesUnderCursor", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Twilight lua require("packer.load")({'twilight.nvim'}, { cmd = "Twilight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'lsp-trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Silicon lua require("packer.load")({'vim-silicon'}, { cmd = "Silicon", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipRun lua require("packer.load")({'sniprun'}, { cmd = "SnipRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Glow lua require("packer.load")({'glow.nvim'}, { cmd = "Glow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'lsp-trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TwilightDisable lua require("packer.load")({'twilight.nvim'}, { cmd = "TwilightDisable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TwilightEnable lua require("packer.load")({'twilight.nvim'}, { cmd = "TwilightEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopWord lua require("packer.load")({'hop.nvim'}, { cmd = "HopWord", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopPattern lua require("packer.load")({'hop.nvim'}, { cmd = "HopPattern", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LazyGit lua require("packer.load")({'lazygit.nvim'}, { cmd = "LazyGit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorizerToggle lua require("packer.load")({'nvim-colorizer.lua'}, { cmd = "ColorizerToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Sayonara lua require("packer.load")({'vim-sayonara'}, { cmd = "Sayonara", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file EmmetInstall lua require("packer.load")({'emmet-vim'}, { cmd = "EmmetInstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <Plug>SnupClose <cmd>lua require("packer.load")({'sniprun'}, { keys = "<lt>Plug>SnupClose", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>f <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>Leader>f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>(dial-increment) <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>Plug>(dial-increment)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gc <cmd>lua require("packer.load")({'nvim-comment'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>(EasyAlign) <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "<lt>Plug>(EasyAlign)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>SnipRun <cmd>lua require("packer.load")({'sniprun'}, { keys = "<lt>Plug>SnipRun", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Lightspeed_f <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "<lt>Plug>Lightspeed_f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>(dial-decrement) <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>Plug>(dial-decrement)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>(dial-decrement-additiona) <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>Plug>(dial-decrement-additiona)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Lightspeed_F <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "<lt>Plug>Lightspeed_F", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Lightspeed_T <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "<lt>Plug>Lightspeed_T", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>(dial-increment-additional) <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>Plug>(dial-increment-additional)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Lightspeed_t <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "<lt>Plug>Lightspeed_t", prefix = "" }, _G.packer_plugins)<cr>]]
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
