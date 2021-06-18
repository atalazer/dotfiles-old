" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
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
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["curstr.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.curstr\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/curstr.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["emmet-vim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.emmet\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["format.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.format\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/format.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.gitsigns\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/glow.nvim"
  },
  ["goyo.vim"] = {
    commands = { "Goyo" },
    config = { "\27LJ\2\nã\1\0\0\3\0\b\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\6\0'\2\a\0B\0\2\1K\0\1\0‚\1                    autocmd! User GoyoEnter Limelight\n                    autocmd! User GoyoLeave Limelight!\n                \bcmd\b90%\16goyo_height\b120\15goyo_width\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
  ["headwind.nvim"] = {
    config = { "\27LJ\2\n…\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\19use_treesitter\2\27prepend_custom_classes\1\16run_on_save\2\22remove_duplicates\2\nsetup\rheadwind\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/headwind.nvim"
  },
  ["hop.nvim"] = {
    commands = { "HopWord", "HopPattern" },
    config = { "\27LJ\2\n5\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\bhop\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.indent-blankline\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lazygit.nvim"] = {
    config = { "\27LJ\2\nª\2\0\0\2\0\b\1\0216\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0*\1\0\0=\1\3\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\6\0006\0\0\0009\0\1\0)\1\0\0=\1\a\0K\0\1\0\30lazygit_use_neovim_remote(lazygit_floating_window_use_plenary\1\5\0\0\bâ•­\bâ•®\bâ•°\bâ•¯)lazygit_floating_window_corner_chars+lazygit_floating_window_scaling_factor%lazygit_floating_window_winblend\6g\bvimµæÌ™\19™³¦ÿ\3\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/lazygit.nvim"
  },
  ["limelight.vim"] = {
    commands = { "Limelight" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/limelight.vim"
  },
  ["lsp-trouble.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["markdown-preview.nvim"] = {
    config = { "\27LJ\2\n˜\1\0\0\2\0\a\0\0176\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0K\0\1\0\ffirefox\17mkdp_browser\22mkdp_refresh_slow\20mkdp_auto_close\20mkdp_auto_start\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fnull-ls\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.autopairs\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.bufferline\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nÃ\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\thtml\1\0\1\nnames\2\bcss\1\0\1\nnames\2\6*\1\0\0\1\0\t\vrgb_fn\2\vRRGGBB\2\vhsl_fn\2\vcss_fn\2\rRRGGBBAA\2\nnames\1\tmode\15background\bcss\2\bRGB\2\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.compe\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-nonicons"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-nonicons"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
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
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/sql.nvim"
  },
  ["startuptime.vim"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/startuptime.vim"
  },
  ["suda.vim"] = {
    commands = { "SudaRead", "SudaWrite" },
    config = { "\27LJ\2\nY\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0K\0\1\0\16Password : \16suda#prompt\20suda_smart_edit\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/suda.vim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
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
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["texmagic.nvim"] = {
    config = { "\27LJ\2\nò\1\0\0\6\0\14\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\f\0005\3\n\0005\4\a\0005\5\b\0=\5\t\4=\4\v\3=\3\r\2B\0\2\1K\0\1\0\fengines\1\0\0\rpdflatex\1\0\0\targs\1\6\0\0\14-pdflatex\29-interaction=nonstopmode\15-synctex=1\b-pv\a%f\1\0\2\17isContinuous\1\15executable\flatexmk\nsetup\rtexmagic\frequire\nlatex\15tex_flavor\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/texmagic.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17plugins.todo\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-markdown"] = {
    config = { "\27LJ\2\nÞ\5\0\0\2\0\19\0=6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0)\1\6\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\1\0)\1\1\0=\1\t\0006\0\0\0009\0\1\0)\1\1\0=\1\n\0006\0\0\0009\0\1\0)\1\1\0=\1\v\0006\0\0\0009\0\1\0)\1\2\0=\1\f\0006\0\0\0009\0\1\0)\1\1\0=\1\r\0006\0\0\0009\0\1\0)\1\1\0=\1\14\0006\0\0\0009\0\1\0)\1\1\0=\1\15\0006\0\0\0009\0\1\0)\1\1\0=\1\16\0006\0\0\0009\0\1\0005\1\18\0=\1\17\0K\0\1\0\1\6\0\0\16csharp = cs\fc++=cpp\rviml=vim\fbash=sh\15ini=dosini\"vim_markdown_fenced_languages\"vim_markdown_toml_frontmatter\29vim_markdown_toc_autofit\31vim_markdown_strikethrough+vim_markdown_no_extensions_in_markdown&vim_markdown_new_list_item_indent\22vim_markdown_math\"vim_markdown_json_frontmatter\29vim_markdown_frontmatter\31vim_markdown_follow_anchor\31vim_markdown_folding_level\"vim_markdown_folding_disabled\btab\29vim_markdown_edit_url_in\25vim_markdown_conceal%vim_markdown_auto_insert_bullets\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-markdown"
  },
  ["vim-matchup"] = {
    config = { "\27LJ\2\nN\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-sayonara"] = {
    commands = { "Sayonara" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-sayonara"
  },
  ["vim-smoothie"] = {
    config = { "\27LJ\2\n·\1\0\0\2\0\6\0\0176\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\30\0=\1\3\0006\0\0\0009\0\1\0)\1\n\0=\1\4\0006\0\0\0009\0\1\0)\1\n\0=\1\5\0K\0\1\0!smoothie_speed_linear_factor#smoothie_speed_constant_factor\29smoothie_update_interval\21smoothie_enabled\6g\bvim\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-table-mode"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-table-mode"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.vsnip\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.which-key\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  },
  ["windline.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23wlsample.evil_line\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/windline.nvim"
  },
  ["xresources-nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/xresources-nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.indent-blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: curstr.nvim
time([[Config for curstr.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.curstr\frequire\0", "config", "curstr.nvim")
time([[Config for curstr.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: emmet-vim
time([[Config for emmet-vim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.emmet\frequire\0", "config", "emmet-vim")
time([[Config for emmet-vim]], false)
-- Config for: vim-vsnip
time([[Config for vim-vsnip]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.vsnip\frequire\0", "config", "vim-vsnip")
time([[Config for vim-vsnip]], false)
-- Config for: format.nvim
time([[Config for format.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.format\frequire\0", "config", "format.nvim")
time([[Config for format.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17plugins.todo\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\nÃ\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\thtml\1\0\1\nnames\2\bcss\1\0\1\nnames\2\6*\1\0\0\1\0\t\vrgb_fn\2\vRRGGBB\2\vhsl_fn\2\vcss_fn\2\rRRGGBBAA\2\nnames\1\tmode\15background\bcss\2\bRGB\2\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.compe\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: vim-matchup
time([[Config for vim-matchup]], true)
try_loadstring("\27LJ\2\nN\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0", "config", "vim-matchup")
time([[Config for vim-matchup]], false)
-- Config for: lazygit.nvim
time([[Config for lazygit.nvim]], true)
try_loadstring("\27LJ\2\nª\2\0\0\2\0\b\1\0216\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0*\1\0\0=\1\3\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\6\0006\0\0\0009\0\1\0)\1\0\0=\1\a\0K\0\1\0\30lazygit_use_neovim_remote(lazygit_floating_window_use_plenary\1\5\0\0\bâ•­\bâ•®\bâ•°\bâ•¯)lazygit_floating_window_corner_chars+lazygit_floating_window_scaling_factor%lazygit_floating_window_winblend\6g\bvimµæÌ™\19™³¦ÿ\3\0", "config", "lazygit.nvim")
time([[Config for lazygit.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: vim-smoothie
time([[Config for vim-smoothie]], true)
try_loadstring("\27LJ\2\n·\1\0\0\2\0\6\0\0176\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\30\0=\1\3\0006\0\0\0009\0\1\0)\1\n\0=\1\4\0006\0\0\0009\0\1\0)\1\n\0=\1\5\0K\0\1\0!smoothie_speed_linear_factor#smoothie_speed_constant_factor\29smoothie_update_interval\21smoothie_enabled\6g\bvim\0", "config", "vim-smoothie")
time([[Config for vim-smoothie]], false)
-- Config for: windline.nvim
time([[Config for windline.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23wlsample.evil_line\frequire\0", "config", "windline.nvim")
time([[Config for windline.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
vim.cmd [[command! -nargs=* -range -bang -complete=file SudaWrite lua require("packer.load")({'suda.vim'}, { cmd = "SudaWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Sayonara lua require("packer.load")({'vim-sayonara'}, { cmd = "Sayonara", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Goyo lua require("packer.load")({'goyo.vim'}, { cmd = "Goyo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file SudaRead lua require("packer.load")({'suda.vim'}, { cmd = "SudaRead", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file HopWord lua require("packer.load")({'hop.nvim'}, { cmd = "HopWord", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file HopPattern lua require("packer.load")({'hop.nvim'}, { cmd = "HopPattern", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Limelight lua require("packer.load")({'limelight.vim'}, { cmd = "Limelight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType tex ++once lua require("packer.load")({'texmagic.nvim'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'headwind.nvim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim', 'vim-table-mode', 'vim-markdown', 'glow.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType text ++once lua require("packer.load")({'vim-table-mode'}, { ft = "text" }, _G.packer_plugins)]]
vim.cmd [[au FileType bib ++once lua require("packer.load")({'texmagic.nvim'}, { ft = "bib" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
