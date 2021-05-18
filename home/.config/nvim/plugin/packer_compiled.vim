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
  local should_profile = true
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

time("Luarocks path setup", true)
local package_path_str = "/home/atalariq/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/atalariq/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/atalariq/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/atalariq/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/atalariq/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["FTerm.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.fterm\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/FTerm.nvim"
  },
  ["NoCLC.nvim"] = {
    config = { "\27LJ\2\nf\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\20load_at_startup\2\17cursorcolumn\1\15cursorline\2\nsetup\vno-clc\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/NoCLC.nvim"
  },
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["auto-session"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/auto-session"
  },
  ["curstr.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.curstr\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/curstr.nvim"
  },
  ["dial.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17plugins.dial\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/dial.nvim"
  },
  ["emmet-vim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.emmet\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/emmet-vim"
  },
  firenvim = {
    config = { "\27LJ\2\n¶\2\0\0\4\0\15\1\0286\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\t\0\0\0X\0\fÄ6\0\0\0009\0\4\0'\2\5\0B\0\2\0016\0\0\0009\0\4\0'\2\6\0B\0\2\0016\0\0\0009\0\4\0'\2\a\0B\0\2\0016\0\0\0009\0\b\0005\1\r\0005\2\v\0005\3\n\0=\3\f\2=\2\14\1=\1\t\0K\0\1\0\18localSettings\1\0\0\a.*\1\0\0\1\0\2\rtakeover\nnever\rpriority\3\1\20firenvim_config\6g!set guifont=JetBrainsMono:h9\22set showtabline=0\21set laststatus=0\bcmd\26g:started_by_firenvim\vexists\afn\bvim\2\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/firenvim"
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
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.galaxyline\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.gitsigns\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/glow.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\nj\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\18term_seq_bias\4\0ÄÄÄˇ\3\tkeys\28qwertyuipasdfghklzxcvbm\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.indent-blankline\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lsp-colors.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/lsp-colors.nvim"
  },
  ["lsp-trouble.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/lsp-trouble.nvim"
  },
  ["lspkind-nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/material.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.autopairs\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-biscuits"] = {
    config = { "\27LJ\2\nŒ\2\0\0\5\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\0016\0\b\0009\0\t\0'\2\n\0B\0\2\1K\0\1\0Ä\1                highlight link BiscuitColor Comment\n                highlight BiscuitColorRust ctermfg=red\n                \bcmd\bvim\19default_config\1\0\0\14on_events\1\3\0\0\16InsertLeave\16CursorHoldI\1\0\3\17min_destance\3\5\15max_length\3\30\18prefix_string\t // \nsetup\18nvim-biscuits\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-biscuits"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.bufferline\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nh\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\6*\1\0\0\1\0\3\bcss\2\tmode\15background\vcss_fn\2\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.compe\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    after = { "lsp-colors.nvim", "lspkind-nvim", "symbols-outline.nvim", "lsp-trouble.nvim", "lspsaga.nvim" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
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
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.devicons\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["session-lens"] = {
    config = { "\27LJ\2\nŒ\3\0\0\6\0\18\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0006\3\3\0009\3\4\3'\5\5\0B\3\2\2'\4\6\0&\3\4\3=\3\b\0024\3\0\0=\3\t\0024\3\0\0=\3\n\0024\3\0\0=\3\v\0024\3\0\0=\3\f\2B\0\2\0016\0\0\0'\2\r\0B\0\2\0029\0\14\0'\2\15\0B\0\2\0016\0\0\0'\2\16\0B\0\2\0029\0\2\0005\2\17\0B\0\2\1K\0\1\0\1\0\2\17shorten_path\1\17prompt_title\18Sessions List'telescope._extensions.session-lens\17session-lens\19load_extension\14telescope\22post_restore_cmds\21pre_restore_cmds\19post_save_cmds\18pre_save_cmds\26auto_session_root_dir\1\0\2\rlogLevel\tinfo%auto_session_enable_last_session\1\27/.cache/nvim/sessions/\tHOME\vgetenv\aos\nsetup\17auto-session\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/session-lens"
  },
  ["shade.nvim"] = {
    config = { "\27LJ\2\nü\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\tkeys\1\0\3\18brightness_up\abb\vtoggle\14<Leader>s\20brightness_down\6B\1\0\2\17opacity_step\3\2\20overlay_opacity\3<\nsetup\nshade\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/shade.nvim"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/sql.nvim"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/startuptime.vim"
  },
  ["suda.vim"] = {
    config = { "\27LJ\2\nY\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0K\0\1\0\16Password : \16suda#prompt\20suda_smart_edit\6g\bvim\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/suda.vim"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\2\ní\4\0\0\4\0\27\00096\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\0\0009\0\1\0+\1\2\0=\1\a\0006\0\0\0009\0\1\0)\1d\0=\1\b\0006\0\0\0009\0\1\0005\1\n\0=\1\t\0006\0\0\0009\0\1\0005\1\f\0=\1\v\0006\0\0\0009\0\1\0005\1\18\0004\2\5\0005\3\14\0>\3\1\0025\3\15\0>\3\2\0025\3\16\0>\3\3\0025\3\17\0>\3\4\2=\2\19\0014\2\4\0005\3\20\0>\3\1\0025\3\21\0>\3\2\0025\3\22\0>\3\3\2=\2\23\1=\1\r\0006\0\24\0'\2\25\0B\0\2\0029\0\26\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rsurround\frequire\vlinear\1\3\0\0\6`\6`\1\3\0\0\6\"\6\"\1\3\0\0\6'\6'\rnestable\1\0\0\1\3\0\0\6<\6>\1\3\0\0\6{\6}\1\3\0\0\6[\6]\1\3\0\0\6(\6)\19surround_pairs\1\4\0\0\6(\6{\6[\22surround_brackets\1\4\0\0\6'\6\"\6`\20surround_quotes\28surround_context_offset\26surround_load_keymaps\29surround_load_autogroups\rsandwich\28surround_mappings_style\6s\20surround_prefix\6g\bvim\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/surround.nvim"
  },
  ["symbols-outline.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/symbols-outline.nvim"
  },
  ["telescope-cheat.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/telescope-cheat.nvim"
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
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\ná\3\0\0\6\0\24\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\t\0005\5\n\0=\5\6\4=\4\v\0035\4\f\0005\5\r\0=\5\6\4=\4\14\0035\4\15\0005\5\16\0=\5\6\4=\4\17\0035\4\18\0005\5\19\0=\5\6\4=\4\20\0035\4\21\0=\4\22\3=\3\23\2B\0\2\1K\0\1\0\rkeywords\tHACK\1\0\1\ticon\tÔíê \tNOTE\1\2\0\0\tINFO\1\0\1\ticon\tÔ°ß \tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\1\ticon\tÔôë \tWARN\1\3\0\0\fWARNING\bXXX\1\0\1\ticon\tÔÅ± \tTODO\1\3\0\0\nTODOS\aTD\1\0\1\ticon\tÔÄå \bFIX\1\0\0\balt\1\6\0\0\nFIXME\bBUG\nFIXIT\bFIX\nISSUE\1\0\1\ticon\tÔÜà \1\0\1\nsigns\2\nsetup\18todo-comments\frequire\0" },
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
  ["vim-hugo-helper"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/vim-hugo-helper"
  },
  ["vim-markdown"] = {
    config = { "\27LJ\2\n:\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\29vim_markdown_frontmatter\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-markdown"
  },
  ["vim-sayonara"] = {
    commands = { "Sayonara" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-sayonara"
  },
  ["vim-smoothie"] = {
    config = { "\27LJ\2\n∑\1\0\0\2\0\6\0\0176\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\30\0=\1\3\0006\0\0\0009\0\1\0)\1\n\0=\1\4\0006\0\0\0009\0\1\0)\1\n\0=\1\5\0K\0\1\0!smoothie_speed_linear_factor#smoothie_speed_constant_factor\29smoothie_update_interval\21smoothie_enabled\6g\bvim\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-table-mode"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-table-mode"
  },
  ["vim-translator"] = {
    config = { "\27LJ\2\n•\3\0\0\2\0\15\1!6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0+\1\2\0=\1\b\0006\0\0\0009\0\1\0'\1\n\0=\1\t\0006\0\0\0009\0\1\0*\1\0\0=\1\v\0006\0\0\0009\0\1\0*\1\0\0=\1\f\0006\0\0\0009\0\1\0005\1\14\0=\1\r\0K\0\1\0\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚îå\b‚îê\b‚îò\b‚îî\"translator_window_borderchars!translator_window_max_height translator_window_max_width\npopup\27translator_window_type\30translator_history_enable\vgoogle\31translator_default_engines\tauto\27translator_source_lang\aid\27translator_target_lang\6g\bvimÁÃô≥\6≥Êåˇ\3\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/vim-translator"
  },
  ["vim-tridactyl"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-tridactyl"
  },
  ["vim-visual-multi"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25plugins.visual-multi\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.vsnip\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.which-key\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  },
  ["xresources-nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/xresources-nvim"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n¢\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\vwindow\1\0\0\foptions\1\0\2\15signcolumn\ano\15foldcolumn\0060\1\0\3\nwidth\4ö≥ÊÃ\tô≥¶ˇ\3\rbackdrop\3\1\vheight\3\1\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/zen-mode.nvim"
  }
}

time("Defining packer_plugins", false)
-- Config for: firenvim
time("Config for firenvim", true)
try_loadstring("\27LJ\2\n¶\2\0\0\4\0\15\1\0286\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\t\0\0\0X\0\fÄ6\0\0\0009\0\4\0'\2\5\0B\0\2\0016\0\0\0009\0\4\0'\2\6\0B\0\2\0016\0\0\0009\0\4\0'\2\a\0B\0\2\0016\0\0\0009\0\b\0005\1\r\0005\2\v\0005\3\n\0=\3\f\2=\2\14\1=\1\t\0K\0\1\0\18localSettings\1\0\0\a.*\1\0\0\1\0\2\rtakeover\nnever\rpriority\3\1\20firenvim_config\6g!set guifont=JetBrainsMono:h9\22set showtabline=0\21set laststatus=0\bcmd\26g:started_by_firenvim\vexists\afn\bvim\2\0", "config", "firenvim")
time("Config for firenvim", false)
-- Config for: nvim-treesitter
time("Config for nvim-treesitter", true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0", "config", "nvim-treesitter")
time("Config for nvim-treesitter", false)
-- Config for: hop.nvim
time("Config for hop.nvim", true)
try_loadstring("\27LJ\2\nj\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\18term_seq_bias\4\0ÄÄÄˇ\3\tkeys\28qwertyuipasdfghklzxcvbm\nsetup\bhop\frequire\0", "config", "hop.nvim")
time("Config for hop.nvim", false)
-- Config for: nvim-biscuits
time("Config for nvim-biscuits", true)
try_loadstring("\27LJ\2\nŒ\2\0\0\5\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\0016\0\b\0009\0\t\0'\2\n\0B\0\2\1K\0\1\0Ä\1                highlight link BiscuitColor Comment\n                highlight BiscuitColorRust ctermfg=red\n                \bcmd\bvim\19default_config\1\0\0\14on_events\1\3\0\0\16InsertLeave\16CursorHoldI\1\0\3\17min_destance\3\5\15max_length\3\30\18prefix_string\t // \nsetup\18nvim-biscuits\frequire\0", "config", "nvim-biscuits")
time("Config for nvim-biscuits", false)
-- Config for: nvim-tree.lua
time("Config for nvim-tree.lua", true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.nvim-tree\frequire\0", "config", "nvim-tree.lua")
time("Config for nvim-tree.lua", false)
-- Config for: nvim-bufferline.lua
time("Config for nvim-bufferline.lua", true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.bufferline\frequire\0", "config", "nvim-bufferline.lua")
time("Config for nvim-bufferline.lua", false)
-- Config for: vim-smoothie
time("Config for vim-smoothie", true)
try_loadstring("\27LJ\2\n∑\1\0\0\2\0\6\0\0176\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\30\0=\1\3\0006\0\0\0009\0\1\0)\1\n\0=\1\4\0006\0\0\0009\0\1\0)\1\n\0=\1\5\0K\0\1\0!smoothie_speed_linear_factor#smoothie_speed_constant_factor\29smoothie_update_interval\21smoothie_enabled\6g\bvim\0", "config", "vim-smoothie")
time("Config for vim-smoothie", false)
-- Config for: NoCLC.nvim
time("Config for NoCLC.nvim", true)
try_loadstring("\27LJ\2\nf\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\20load_at_startup\2\17cursorcolumn\1\15cursorline\2\nsetup\vno-clc\frequire\0", "config", "NoCLC.nvim")
time("Config for NoCLC.nvim", false)
-- Config for: format.nvim
time("Config for format.nvim", true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.format\frequire\0", "config", "format.nvim")
time("Config for format.nvim", false)
-- Config for: gitsigns.nvim
time("Config for gitsigns.nvim", true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.gitsigns\frequire\0", "config", "gitsigns.nvim")
time("Config for gitsigns.nvim", false)
-- Config for: vim-vsnip
time("Config for vim-vsnip", true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.vsnip\frequire\0", "config", "vim-vsnip")
time("Config for vim-vsnip", false)
-- Config for: FTerm.nvim
time("Config for FTerm.nvim", true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.fterm\frequire\0", "config", "FTerm.nvim")
time("Config for FTerm.nvim", false)
-- Config for: suda.vim
time("Config for suda.vim", true)
try_loadstring("\27LJ\2\nY\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0K\0\1\0\16Password : \16suda#prompt\20suda_smart_edit\6g\bvim\0", "config", "suda.vim")
time("Config for suda.vim", false)
-- Config for: vim-visual-multi
time("Config for vim-visual-multi", true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25plugins.visual-multi\frequire\0", "config", "vim-visual-multi")
time("Config for vim-visual-multi", false)
-- Config for: indent-blankline.nvim
time("Config for indent-blankline.nvim", true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.indent-blankline\frequire\0", "config", "indent-blankline.nvim")
time("Config for indent-blankline.nvim", false)
-- Config for: which-key.nvim
time("Config for which-key.nvim", true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.which-key\frequire\0", "config", "which-key.nvim")
time("Config for which-key.nvim", false)
-- Config for: dial.nvim
time("Config for dial.nvim", true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17plugins.dial\frequire\0", "config", "dial.nvim")
time("Config for dial.nvim", false)
-- Config for: shade.nvim
time("Config for shade.nvim", true)
try_loadstring("\27LJ\2\nü\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\tkeys\1\0\3\18brightness_up\abb\vtoggle\14<Leader>s\20brightness_down\6B\1\0\2\17opacity_step\3\2\20overlay_opacity\3<\nsetup\nshade\frequire\0", "config", "shade.nvim")
time("Config for shade.nvim", false)
-- Config for: session-lens
time("Config for session-lens", true)
try_loadstring("\27LJ\2\nŒ\3\0\0\6\0\18\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0006\3\3\0009\3\4\3'\5\5\0B\3\2\2'\4\6\0&\3\4\3=\3\b\0024\3\0\0=\3\t\0024\3\0\0=\3\n\0024\3\0\0=\3\v\0024\3\0\0=\3\f\2B\0\2\0016\0\0\0'\2\r\0B\0\2\0029\0\14\0'\2\15\0B\0\2\0016\0\0\0'\2\16\0B\0\2\0029\0\2\0005\2\17\0B\0\2\1K\0\1\0\1\0\2\17shorten_path\1\17prompt_title\18Sessions List'telescope._extensions.session-lens\17session-lens\19load_extension\14telescope\22post_restore_cmds\21pre_restore_cmds\19post_save_cmds\18pre_save_cmds\26auto_session_root_dir\1\0\2\rlogLevel\tinfo%auto_session_enable_last_session\1\27/.cache/nvim/sessions/\tHOME\vgetenv\aos\nsetup\17auto-session\frequire\0", "config", "session-lens")
time("Config for session-lens", false)
-- Config for: telescope.nvim
time("Config for telescope.nvim", true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0", "config", "telescope.nvim")
time("Config for telescope.nvim", false)
-- Config for: todo-comments.nvim
time("Config for todo-comments.nvim", true)
try_loadstring("\27LJ\2\ná\3\0\0\6\0\24\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\t\0005\5\n\0=\5\6\4=\4\v\0035\4\f\0005\5\r\0=\5\6\4=\4\14\0035\4\15\0005\5\16\0=\5\6\4=\4\17\0035\4\18\0005\5\19\0=\5\6\4=\4\20\0035\4\21\0=\4\22\3=\3\23\2B\0\2\1K\0\1\0\rkeywords\tHACK\1\0\1\ticon\tÔíê \tNOTE\1\2\0\0\tINFO\1\0\1\ticon\tÔ°ß \tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\1\ticon\tÔôë \tWARN\1\3\0\0\fWARNING\bXXX\1\0\1\ticon\tÔÅ± \tTODO\1\3\0\0\nTODOS\aTD\1\0\1\ticon\tÔÄå \bFIX\1\0\0\balt\1\6\0\0\nFIXME\bBUG\nFIXIT\bFIX\nISSUE\1\0\1\ticon\tÔÜà \1\0\1\nsigns\2\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time("Config for todo-comments.nvim", false)
-- Config for: curstr.nvim
time("Config for curstr.nvim", true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.curstr\frequire\0", "config", "curstr.nvim")
time("Config for curstr.nvim", false)
-- Config for: nvim-compe
time("Config for nvim-compe", true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.compe\frequire\0", "config", "nvim-compe")
time("Config for nvim-compe", false)
-- Config for: vim-translator
time("Config for vim-translator", true)
try_loadstring("\27LJ\2\n•\3\0\0\2\0\15\1!6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0+\1\2\0=\1\b\0006\0\0\0009\0\1\0'\1\n\0=\1\t\0006\0\0\0009\0\1\0*\1\0\0=\1\v\0006\0\0\0009\0\1\0*\1\0\0=\1\f\0006\0\0\0009\0\1\0005\1\14\0=\1\r\0K\0\1\0\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚îå\b‚îê\b‚îò\b‚îî\"translator_window_borderchars!translator_window_max_height translator_window_max_width\npopup\27translator_window_type\30translator_history_enable\vgoogle\31translator_default_engines\tauto\27translator_source_lang\aid\27translator_target_lang\6g\bvimÁÃô≥\6≥Êåˇ\3\0", "config", "vim-translator")
time("Config for vim-translator", false)
-- Config for: galaxyline.nvim
time("Config for galaxyline.nvim", true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.galaxyline\frequire\0", "config", "galaxyline.nvim")
time("Config for galaxyline.nvim", false)
-- Config for: zen-mode.nvim
time("Config for zen-mode.nvim", true)
try_loadstring("\27LJ\2\n¢\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\vwindow\1\0\0\foptions\1\0\2\15signcolumn\ano\15foldcolumn\0060\1\0\3\nwidth\4ö≥ÊÃ\tô≥¶ˇ\3\rbackdrop\3\1\vheight\3\1\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time("Config for zen-mode.nvim", false)
-- Config for: surround.nvim
time("Config for surround.nvim", true)
try_loadstring("\27LJ\2\ní\4\0\0\4\0\27\00096\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\0\0009\0\1\0+\1\2\0=\1\a\0006\0\0\0009\0\1\0)\1d\0=\1\b\0006\0\0\0009\0\1\0005\1\n\0=\1\t\0006\0\0\0009\0\1\0005\1\f\0=\1\v\0006\0\0\0009\0\1\0005\1\18\0004\2\5\0005\3\14\0>\3\1\0025\3\15\0>\3\2\0025\3\16\0>\3\3\0025\3\17\0>\3\4\2=\2\19\0014\2\4\0005\3\20\0>\3\1\0025\3\21\0>\3\2\0025\3\22\0>\3\3\2=\2\23\1=\1\r\0006\0\24\0'\2\25\0B\0\2\0029\0\26\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rsurround\frequire\vlinear\1\3\0\0\6`\6`\1\3\0\0\6\"\6\"\1\3\0\0\6'\6'\rnestable\1\0\0\1\3\0\0\6<\6>\1\3\0\0\6{\6}\1\3\0\0\6[\6]\1\3\0\0\6(\6)\19surround_pairs\1\4\0\0\6(\6{\6[\22surround_brackets\1\4\0\0\6'\6\"\6`\20surround_quotes\28surround_context_offset\26surround_load_keymaps\29surround_load_autogroups\rsandwich\28surround_mappings_style\6s\20surround_prefix\6g\bvim\0", "config", "surround.nvim")
time("Config for surround.nvim", false)
-- Config for: nvim-autopairs
time("Config for nvim-autopairs", true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.autopairs\frequire\0", "config", "nvim-autopairs")
time("Config for nvim-autopairs", false)

-- Command lazy-loads
time("Defining lazy-load commands", true)
vim.cmd [[command! -nargs=* -range -bang -complete=file Sayonara lua require("packer.load")({'vim-sayonara'}, { cmd = "Sayonara", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time("Defining lazy-load commands", false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time("Defining lazy-load filetype autocommands", true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-markdown', 'vim-table-mode'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType text ++once lua require("packer.load")({'vim-table-mode'}, { ft = "text" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType scss ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "scss" }, _G.packer_plugins)]]
vim.cmd [[au FileType tridactyl ++once lua require("packer.load")({'vim-tridactyl'}, { ft = "tridactyl" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'emmet-vim', 'nvim-colorizer.lua'}, { ft = "html" }, _G.packer_plugins)]]
time("Defining lazy-load filetype autocommands", false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time("Sourcing ftdetect script at: /home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim", true)
vim.cmd [[source /home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time("Sourcing ftdetect script at: /home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim", false)
time("Sourcing ftdetect script at: /home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-tridactyl/ftdetect/tridactyl.vim", true)
vim.cmd [[source /home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-tridactyl/ftdetect/tridactyl.vim]]
time("Sourcing ftdetect script at: /home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-tridactyl/ftdetect/tridactyl.vim", false)
vim.cmd("augroup END")
if should_profile then save_profiles(1) end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
