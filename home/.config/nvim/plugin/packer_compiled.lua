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
    after = { "cmp_luasnip", "friendly-snippets" },
    config = { "\27LJ\1\2/\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\20plugins.luasnip\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/LuaSnip"
  },
  ["cmp-buffer"] = {
    after = { "cmp-calc", "cmp-spell" },
    after_files = { "/home/atalariq/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["cmp-nvim-lsp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/cmp-buffer"
  },
  ["cmp-calc"] = {
    after = { "cmp-emoji" },
    after_files = { "/home/atalariq/.local/share/nvim/site/pack/packer/opt/cmp-calc/after/plugin/cmp_calc.lua" },
    load_after = {
      ["cmp-buffer"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/cmp-calc"
  },
  ["cmp-emoji"] = {
    after_files = { "/home/atalariq/.local/share/nvim/site/pack/packer/opt/cmp-emoji/after/plugin/cmp_emoji.lua" },
    load_after = {
      ["cmp-calc"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/cmp-emoji"
  },
  ["cmp-nvim-lsp"] = {
    after = { "cmp-buffer" },
    after_files = { "/home/atalariq/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["cmp-nvim-lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after = { "cmp-nvim-lsp", "cmp-path" },
    after_files = { "/home/atalariq/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/atalariq/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["cmp-nvim-lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/cmp-path"
  },
  ["cmp-spell"] = {
    after_files = { "/home/atalariq/.local/share/nvim/site/pack/packer/opt/cmp-spell/after/plugin/cmp-spell.lua" },
    load_after = {
      ["cmp-buffer"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/cmp-spell"
  },
  cmp_luasnip = {
    after_files = { "/home/atalariq/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      LuaSnip = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/cmp_luasnip"
  },
  ["curstr.nvim"] = {
    config = { "\27LJ\1\2.\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\19plugins.curstr\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/curstr.nvim"
  },
  ["dashboard-nvim"] = {
    commands = { "Dashboard", "SessionLoad", "SessionSave" },
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22plugins.dashboard\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/dashboard-nvim"
  },
  ["dial.nvim"] = {
    config = { "\27LJ\1\2„\1\0\0\3\0\6\0\b4\0\0\0%\1\1\0>\0\2\0027\1\2\0007\1\3\0013\2\5\0:\2\4\1G\0\1\0\1\n\0\0\19number#decimal\15number#hex\18number#binary\14color#hex\17date#[%H:%M]\20date#[%Y-%m-%d]\25char#alph#small#word\27char#alph#capital#word\27markup#markdown#header\vnormal\15searchlist\vconfig\tdial\frequire\0" },
    keys = { { "", "<Plug>(dial-increment)" }, { "", "<Plug>(dial-increment-additional)" }, { "", "<Plug>(dial-decrement)" }, { "", "<Plug>(dial-decrement-additiona)" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/dial.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/editorconfig-vim"
  },
  ["emmet-vim"] = {
    commands = { "EmmetInstall" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/emmet-vim"
  },
  ["friendly-snippets"] = {
    load_after = {
      LuaSnip = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21plugins.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    commands = { "Glow" },
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/glow.nvim"
  },
  ["hop.nvim"] = {
    commands = { "HopWord", "HopPattern" },
    config = { "\27LJ\1\0025\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\bhop\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/hop.nvim"
  },
  ["impatient.nvim"] = {
    after = { "nvim-notify", "xresources-nvim" },
    config = { "\27LJ\1\2@\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\19enable_profile\14impatient\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    commands = { "IndentBlanklineEnable", "IndentBlanklineDisable", "IndentBlanklineRefresh" },
    loaded = false,
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
    config = { "\27LJ\1\2/\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\20plugins.trouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/lsp-trouble.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["mkdnflow.nvim"] = {
    config = { "\27LJ\1\2‘\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\14filetypes\1\0\3\amd\2\brmd\2\rmarkdown\2\1\0\5\20new_file_prefix\25os.date('%Y-%m-%d_')\16create_dirs\2\20evaluate_prefix\2\21default_mappings\2\22links_relative_to\fcurrent\nsetup\rmkdnflow\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/mkdnflow.nvim"
  },
  ["nim.nvim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nim.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    after = { "nvim-ts-autotag" },
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22plugins.autopairs\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23plugins.bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    after = { "cmp-nvim-lua", "nvim-autopairs", "LuaSnip" },
    config = { "\27LJ\1\2+\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\16plugins.cmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    commands = { "ColorizerToggle" },
    config = { "\27LJ\1\2o\0\0\3\0\b\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0:\2\a\1>\0\2\1G\0\1\0\thtml\1\0\1\nnames\1\bcss\1\0\1\vrgb_fn\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\1\2^\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequire§\1\1\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0001\2\4\0:\2\5\1>\0\2\1G\0\1\0\thook\0\1\0\5\17line_mapping\bgcc\20create_mappings\2\19marker_padding\2\21operator_mapping\agc\18comment_empty\2\nsetup\17nvim_comment\frequire\0" },
    keys = { { "", "gc" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-comment"
  },
  ["nvim-lsp-installer"] = {
    commands = { "LspInstall", "LspUninstall", "LspUninstallAll", "LspPrintInstalled" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\1\2#\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\blsp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-nonicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-nonicons"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\1\2ä\1\0\3\a\0\a\0\18\14\0\1\0T\3\1Ä%\1\0\0004\3\1\0007\3\2\3%\4\3\0\16\5\2\0003\6\4\0>\3\4\2\16\2\3\0004\3\5\0%\4\6\0>\3\2\2\16\4\0\0\16\5\1\0\16\6\2\0>\3\4\1G\0\1\0\vnotify\frequire\1\0\1\ftimeout\3∏\23\tkeep\20tbl_deep_extend\bvim\tinfo#\1\0\2\0\3\0\0044\0\0\0001\1\2\0:\1\1\0G\0\1\0\0\vnotify\bvim\0" },
    load_after = {
      ["impatient.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22plugins.nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "vim-matchup", "nvim-ts-context-commentstring", "nvim-treesitter-refactor", "nvim-treesitter-textobjects", "nvim-ts-autotag" },
    config = { "\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23plugins.treesitter\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    load_after = {
      ["nvim-autopairs"] = true,
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\1\2O\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    wants = { "nvim-nonicons" }
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/popup.nvim"
  },
  sniprun = {
    commands = { "SnipRun" },
    config = { "\27LJ\1\2∑\1\0\0\3\0\b\0\f4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0004\2\4\0007\2\5\2:\2\5\0013\2\6\0:\2\a\1>\0\2\1G\0\1\0\fdisplay\1\5\0\0\fClassic\18VirtualTextOk\19VirtualTextErr\27LongTempFloatingWindow\fborders\tUtil\1\0\1\20inline_messages\3\2\nsetup\fsniprun\frequire\0" },
    keys = { { "", "<Plug>SnipRun" }, { "", "<Plug>SnupClose" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/sniprun"
  },
  ["sql.nvim"] = {
    load_after = {
      ["telescope-frecency.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/sql.nvim"
  },
  ["startuptime.vim"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/startuptime.vim"
  },
  ["suda.vim"] = {
    commands = { "SudaRead", "SudaWrite" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/suda.vim"
  },
  ["telescope-frecency.nvim"] = {
    after = { "sql.nvim" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22plugins.telescope\frequire\0" },
    keys = { { "n", "<Leader>f" } },
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    wants = { "popup.nvim", "plenary.nvim", "telescope-fzf-native.nvim", "telescope-media-files.nvim", "telescope-frecency.nvim" }
  },
  ["texmagic.nvim"] = {
    config = { "\27LJ\1\2Ú\1\0\0\5\0\14\0\0174\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\4\0%\1\5\0>\0\2\0027\0\6\0003\1\f\0003\2\n\0003\3\a\0003\4\b\0:\4\t\3:\3\v\2:\2\r\1>\0\2\1G\0\1\0\fengines\1\0\0\rpdflatex\1\0\0\targs\1\6\0\0\14-pdflatex\29-interaction=nonstopmode\15-synctex=1\b-pv\a%f\1\0\2\17isContinuous\1\15executable\flatexmk\nsetup\rtexmagic\frequire\nlatex\15tex_flavor\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/texmagic.nvim"
  },
  ["tokyonight.nvim"] = {
    load_after = {
      ["xresources-nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/tokyonight.nvim"
  },
  ["twilight.nvim"] = {
    commands = { "Twilight", "TwilightEnable", "TwilightDisable" },
    config = { "\27LJ\1\2¬\1\0\0\4\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\6\0003\2\3\0003\3\4\0:\3\5\2:\2\a\0013\2\b\0:\2\t\1>\0\2\1G\0\1\0\vexpand\1\2\0\0\17if_statement\fdimming\1\0\2\fcontext\3\5\15treesitter\2\ncolor\1\3\0\0\vNormal\f#ffffff\1\0\2\nalpha\4≥ÊÃô\3≥ÊÃ˛\3\rinactive\1\nsetup\rtwilight\frequire\0" },
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
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-matchup"
  },
  ["vim-sandwich"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-sandwich"
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
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-smoothie"
  },
  ["vim-table-mode"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-table-mode"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22plugins.which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/which-key.nvim"
  },
  ["windline.nvim"] = {
    config = { "\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21plugins.windline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/windline.nvim"
  },
  ["xresources-nvim"] = {
    after = { "tokyonight.nvim" },
    config = { "\27LJ\1\2Z\0\0\5\0\4\0\t3\0\0\0008\1\1\0004\2\1\0007\2\2\2%\3\3\0\16\4\1\0$\3\4\3>\2\2\1G\0\1\0\17colorscheme \bcmd\bvim\1\3\0\0\15xresources\15tokyonight\0" },
    load_after = {
      ["impatient.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/xresources-nvim"
  },
  ["zen-mode.nvim"] = {
    commands = { "ZenMode" },
    config = { "\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21plugins.zen-mode\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^lsp_signature"] = "lsp_signature.nvim",
  ["^null%-ls"] = "null-ls.nvim",
  ["^nvim%-lsp%-installer"] = "nvim-lsp-installer",
  ["^nvim%-web%-devicons"] = "nvim-web-devicons",
  ["^plenary"] = "plenary.nvim",
  ["^popup"] = "popup.nvim",
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
try_loadstring("\27LJ\1\2¥\1\0\0\5\0\n\0\0174\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0003\4\6\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\a\0%\3\b\0003\4\t\0>\0\5\1G\0\1\0\1\0\1\fnoremap\2\24<CMD>HopPattern<CR>\r<Space>x\1\0\1\fnoremap\2\21<CMD>HopWord<CR>\r<Space>z\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "hop.nvim")
time([[Setup for hop.nvim]], false)
-- Setup for: vim-smoothie
time([[Setup for vim-smoothie]], true)
try_loadstring("\27LJ\1\2ñ\1\0\0\2\0\5\0\r4\0\0\0007\0\1\0'\1\30\0:\1\2\0004\0\0\0007\0\1\0'\1\n\0:\1\3\0004\0\0\0007\0\1\0'\1\n\0:\1\4\0G\0\1\0!smoothie_speed_linear_factor#smoothie_speed_constant_factor\29smoothie_update_interval\6g\bvim\0", "setup", "vim-smoothie")
time([[Setup for vim-smoothie]], false)
-- Setup for: dial.nvim
time([[Setup for dial.nvim]], true)
try_loadstring("\27LJ\1\2›\2\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0Ω\2            nmap <C-a> <Plug>(dial-increment)\n            nmap <C-x> <Plug>(dial-decrement)\n            vmap <C-a> <Plug>(dial-increment)\n            vmap <C-x> <Plug>(dial-decrement)\n            vmap g<C-a> <Plug>(dial-increment-additional)\n            vmap g<C-x> <Plug>(dial-decrement-additional)\n            \bcmd\bvim\0", "setup", "dial.nvim")
time([[Setup for dial.nvim]], false)
-- Setup for: sniprun
time([[Setup for sniprun]], true)
try_loadstring("\27LJ\1\2©\1\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0â\1            nmap <leader>sr <Plug>SnipRun\n            vmap sr <Plug>SnipRun\n            nmap <leader>sc <Plug>SnipClose\n            \bcmd\bvim\0", "setup", "sniprun")
time([[Setup for sniprun]], false)
-- Setup for: indent-blankline.nvim
time([[Setup for indent-blankline.nvim]], true)
try_loadstring("\27LJ\1\0028\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\29plugins.indent-blankline\frequire\0", "setup", "indent-blankline.nvim")
time([[Setup for indent-blankline.nvim]], false)
-- Setup for: vim-easy-align
time([[Setup for vim-easy-align]], true)
try_loadstring("\27LJ\1\2§\1\0\0\5\0\t\0\0174\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0003\4\6\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\a\0%\2\4\0%\3\5\0003\4\b\0>\0\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\1\6x\1\0\2\vsilent\2\fnoremap\1\22<Plug>(EasyAlign)\aga\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "vim-easy-align")
time([[Setup for vim-easy-align]], false)
-- Setup for: vim-silicon
time([[Setup for vim-silicon]], true)
try_loadstring("\27LJ\1\2π\3\0\0\3\0\15\0\0304\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\0\0007\0\1\0007\0\2\0%\1\5\0:\1\4\0004\0\0\0007\0\1\0007\0\2\0%\1\a\0:\1\6\0004\0\0\0007\0\1\0007\0\2\0%\1\t\0:\1\b\0004\0\0\0007\0\1\0007\0\2\0004\1\v\0007\1\f\1%\2\r\0>\1\2\2%\2\14\0$\1\2\1:\1\n\0G\0\1\0=/Pictures/Screenshots/silicon-{time:%Y-%m-%d-%H%M%S}.png\tHOME\vgetenv\aos\voutput\f#f8f8f2\15background\28JetBrainsMono Nerd Font\tfont\fDracula\ntheme\1\0\n\rline-pad\3\3\14pad-horiz\3\30\rpad-vert\3\30\20window-controls\2\20shadow-offset-x\3\b\23shadow-blur-radius\3\5\16line-number\2\20shadow-offset-y\3\b\17round-corner\2\17shadow-color\f#434434\fsilicon\6g\bvim\0", "setup", "vim-silicon")
time([[Setup for vim-silicon]], false)
-- Setup for: curstr.nvim
time([[Setup for curstr.nvim]], true)
try_loadstring('\27LJ\1\2Û\1\0\0\4\0\a\0\0144\0\0\0007\0\1\0007\0\2\0\16\1\0\0003\2\3\0003\3\4\0;\3\3\2>\1\2\1\16\1\0\0003\2\5\0003\3\6\0;\3\3\2>\1\2\1G\0\1\0\1\0\1\vsilent\2\1\3\0\0\a.,8<Cmd>lua require("curstr").execute("togglable")<CR>\1\0\1\vsilent\2\1\3\0\0\agfL<Cmd>lua require("curstr").execute("openable", { action = "open" })<CR>\rnnoremap\vkeymap\bvim\0', "setup", "curstr.nvim")
time([[Setup for curstr.nvim]], false)
-- Setup for: packer.nvim
time([[Setup for packer.nvim]], true)
try_loadstring("\27LJ\1\2Y\0\2\a\0\5\0\t4\2\0\0007\2\1\0027\2\2\2%\3\3\0\16\4\0\0\16\5\1\0003\6\4\0>\2\5\1G\0\1\0\1\0\2\vsilent\1\fnoremap\2\6n\20nvim_set_keymap\bapi\bvimΩ\2\1\0\4\0\r\0\0261\0\0\0\16\1\0\0%\2\1\0%\3\2\0>\1\3\1\16\1\0\0%\2\3\0%\3\4\0>\1\3\1\16\1\0\0%\2\5\0%\3\6\0>\1\3\1\16\1\0\0%\2\a\0%\3\b\0>\1\3\1\16\1\0\0%\2\t\0%\3\n\0>\1\3\1\16\1\0\0%\2\v\0%\3\f\0>\1\3\1G\0\1\0006:PackerCompile profile=true<CR>:PackerProfile<CR>\15<Leader>pp\20:PackerSync<CR>\15<Leader>ps\23:PackerCompile<CR>\15<Leader>pc\22:PackerUpdate<CR>\15<Leader>pu\21:PackerClean<CR>\15<Leader>pd\23:PackerInstall<CR>\15<Leader>pi\0\0", "setup", "packer.nvim")
time([[Setup for packer.nvim]], false)
-- Setup for: vim-matchup
time([[Setup for vim-matchup]], true)
try_loadstring("\27LJ\1\2j\0\0\2\0\4\0\0054\0\0\0007\0\1\0003\1\3\0:\1\2\0G\0\1\0\1\0\3\14highlight\vNormal\14fullwidth\2\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0", "setup", "vim-matchup")
time([[Setup for vim-matchup]], false)
-- Setup for: tokyonight.nvim
time([[Setup for tokyonight.nvim]], true)
try_loadstring("\27LJ\1\2¥\2\0\0\2\0\n\0\0254\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0)\1\2\0:\1\4\0004\0\0\0007\0\1\0)\1\2\0:\1\5\0004\0\0\0007\0\1\0)\1\2\0:\1\6\0004\0\0\0007\0\1\0)\1\2\0:\1\a\0004\0\0\0007\0\1\0003\1\t\0:\1\b\0G\0\1\0\1\6\0\0\aqf\15vista_kind\rterminal\vpacker\rNvimTree\24tokyonight_sidebars tokyonight_italic_functions\31tokyonight_italic_keywords\31tokyonight_italic_comments\31tokyonight_terminal_colors\nstorm\21tokyonight_style\6g\bvim\0", "setup", "tokyonight.nvim")
time([[Setup for tokyonight.nvim]], false)
-- Setup for: emmet-vim
time([[Setup for emmet-vim]], true)
try_loadstring("\27LJ\1\2Ö\1\0\0\2\0\a\0\r4\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0%\1\4\0:\1\3\0004\0\0\0007\0\1\0%\1\6\0:\1\5\0G\0\1\0\6,\26user_emmet_leader_key\6a\20user_emmet_mode\30user_emmet_install_global\6g\bvim\0", "setup", "emmet-vim")
time([[Setup for emmet-vim]], false)
-- Setup for: nvim-colorizer.lua
time([[Setup for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\1\2Y\0\2\a\0\5\0\t4\2\0\0007\2\1\0027\2\2\2%\3\3\0\16\4\0\0\16\5\1\0003\6\4\0>\2\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\6n\20nvim_set_keymap\bapi\bvimD\1\0\4\0\3\0\0061\0\0\0\16\1\0\0%\2\1\0%\3\2\0>\1\3\1G\0\1\0\29<CMD>ColorizerToggle<CR>\15<leader>cc\0\0", "setup", "nvim-colorizer.lua")
time([[Setup for nvim-colorizer.lua]], false)
-- Setup for: xresources-nvim
time([[Setup for xresources-nvim]], true)
try_loadstring("\27LJ\1\2é\2\0\0\2\0\b\0\0214\0\0\0007\0\1\0)\1\1\0:\1\2\0004\0\0\0007\0\1\0)\1\2\0:\1\3\0004\0\0\0007\0\1\0)\1\1\0:\1\4\0004\0\0\0007\0\1\0)\1\1\0:\1\5\0004\0\0\0007\0\1\0003\1\a\0:\1\6\0G\0\1\0\1\6\0\0\aqf\15vista_kind\rterminal\vpacker\rNvimTree\24xresources_sidebars xresources_italic_variables xresources_italic_functions\31xresources_italic_keywords\31xresources_italic_comments\6g\bvim\0", "setup", "xresources-nvim")
time([[Setup for xresources-nvim]], false)
-- Setup for: glow.nvim
time([[Setup for glow.nvim]], true)
try_loadstring("\27LJ\1\2Y\0\2\a\0\5\0\t4\2\0\0007\2\1\0027\2\2\2%\3\3\0\16\4\0\0\16\5\1\0003\6\4\0>\2\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\6n\20nvim_set_keymap\bapi\bvim9\1\0\4\0\3\0\0061\0\0\0\16\1\0\0%\2\1\0%\3\2\0>\1\3\1G\0\1\0\18<CMD>Glow<CR>\15<leader>gg\0\0", "setup", "glow.nvim")
time([[Setup for glow.nvim]], false)
-- Setup for: zen-mode.nvim
time([[Setup for zen-mode.nvim]], true)
try_loadstring("\27LJ\1\2Y\0\2\a\0\5\0\t4\2\0\0007\2\1\0027\2\2\2%\3\3\0\16\4\0\0\16\5\1\0003\6\4\0>\2\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\6n\20nvim_set_keymap\bapi\bvim8\1\0\4\0\3\0\0061\0\0\0\16\1\0\0%\2\1\0%\3\2\0>\1\3\1G\0\1\0\17:ZenMode<CR>\15<leader>gz\0\0", "setup", "zen-mode.nvim")
time([[Setup for zen-mode.nvim]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\1\2ò\1\0\0\2\0\a\0\0174\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0'\1\0\0:\1\3\0004\0\0\0007\0\1\0'\1\0\0:\1\4\0004\0\0\0007\0\1\0%\1\6\0:\1\5\0G\0\1\0\ffirefox\17mkdp_browser\22mkdp_refresh_slow\20mkdp_auto_close\20mkdp_auto_start\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Setup for: suda.vim
time([[Setup for suda.vim]], true)
try_loadstring("\27LJ\1\2Y\0\0\2\0\5\0\t4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0%\1\4\0:\1\3\0G\0\1\0\16Password : \16suda#prompt\20suda_smart_edit\6g\bvim\0", "setup", "suda.vim")
time([[Setup for suda.vim]], false)
-- Setup for: vim-sayonara
time([[Setup for vim-sayonara]], true)
try_loadstring("\27LJ\1\2X\0\2\a\0\5\0\t4\2\0\0007\2\1\0027\2\2\2%\3\3\0\16\4\0\0\16\5\1\0003\6\4\0>\2\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\5\20nvim_set_keymap\bapi\bvimÄ\1\1\0\4\0\6\0\0141\0\0\0\16\1\0\0%\2\1\0%\3\2\0>\1\3\1\16\1\0\0%\2\3\0%\3\4\0>\1\3\1\16\1\0\0%\2\5\0%\3\4\0>\1\3\1G\0\1\0\n<M-w>\22<CMD>Sayonara<CR>\15<leader>qq\23<CMD>Sayonara!<CR>\14<leader>q\0\0", "setup", "vim-sayonara")
time([[Setup for vim-sayonara]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2k\0\0\5\0\a\0\t4\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0003\4\6\0>\0\5\1G\0\1\0\1\0\1\fnoremap\2\28<CMD>NvimTreeToggle<CR>\6`\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Setup for: editorconfig-vim
time([[Setup for editorconfig-vim]], true)
try_loadstring('\27LJ\1\2í\2\0\0\2\0\b\0\r4\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\0\0007\0\1\0003\1\5\0:\1\4\0004\0\0\0007\0\6\0%\1\a\0>\0\2\1G\0\1\0V                au FileType gitcommit let b:EditorConfig_disable = 1\n            \bcmd\1\2\0\0\29trim_trailing_whitespace\31EditorConfig_disable_rules\1\4\0\0\18fugitive://.*\rscp://.*\14term://.*"EditorConfig_exclude_patterns\6g\bvim\0', "setup", "editorconfig-vim")
time([[Setup for editorconfig-vim]], false)
-- Setup for: vim-markdown
time([[Setup for vim-markdown]], true)
try_loadstring("\27LJ\1\2ä\1\0\0\2\0\5\0\r4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\3\0004\0\0\0007\0\1\0'\1\1\0:\1\4\0G\0\1\0\22vim_markdown_math\29vim_markdown_frontmatter\"vim_markdown_folding_disabled\6g\bvim\0", "setup", "vim-markdown")
time([[Setup for vim-markdown]], false)
-- Setup for: dashboard-nvim
time([[Setup for dashboard-nvim]], true)
try_loadstring("\27LJ\1\2Y\0\2\a\0\5\0\t4\2\0\0007\2\1\0027\2\2\2%\3\3\0\16\4\0\0\16\5\1\0003\6\4\0>\2\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\6n\20nvim_set_keymap\bapi\bvimn\1\0\4\0\5\0\n1\0\0\0\16\1\0\0%\2\1\0%\3\2\0>\1\3\1\16\1\0\0%\2\3\0%\3\4\0>\1\3\1G\0\1\0\30<CMD>SessionSave last<CR>\t<F2>\30<CMD>SessionLoad last<CR>\t<F1>\0\0", "setup", "dashboard-nvim")
time([[Setup for dashboard-nvim]], false)
-- Setup for: lightspeed.nvim
time([[Setup for lightspeed.nvim]], true)
try_loadstring('\27LJ\1\2Ω\3\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0ù\3                nmap <expr> f reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"\n                nmap <expr> F reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"\n                nmap <expr> t reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"\n                nmap <expr> T reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"\n            \bcmd\bvim\0', "setup", "lightspeed.nvim")
time([[Setup for lightspeed.nvim]], false)
-- Setup for: lazygit.nvim
time([[Setup for lazygit.nvim]], true)
try_loadstring("\27LJ\1\2Y\0\2\a\0\5\0\t4\2\0\0007\2\1\0027\2\2\2%\3\3\0\16\4\0\0\16\5\1\0003\6\4\0>\2\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\6n\20nvim_set_keymap\bapi\bvim€\2\1\0\4\0\v\1\0264\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0(\1\0\0:\1\3\0004\0\0\0007\0\1\0003\1\5\0:\1\4\0004\0\0\0007\0\1\0'\1\0\0:\1\6\0004\0\0\0007\0\1\0'\1\0\0:\1\a\0001\0\b\0\16\1\0\0%\2\t\0%\3\n\0>\1\3\1G\0\1\0\21<CMD>LazyGit<CR>\15<leader>gt\0\30lazygit_use_neovim_remote(lazygit_floating_window_use_plenary\1\5\0\0\b‚ï≠\b‚ïÆ\b‚ï∞\b‚ïØ)lazygit_floating_window_corner_chars+lazygit_floating_window_scaling_factor%lazygit_floating_window_winblend\6g\bvimÁÃô≥\6≥Ê¨ˇ\3\0", "setup", "lazygit.nvim")
time([[Setup for lazygit.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file EmmetInstall lua require("packer.load")({'emmet-vim'}, { cmd = "EmmetInstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SudaWrite lua require("packer.load")({'suda.vim'}, { cmd = "SudaWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspInstall lua require("packer.load")({'nvim-lsp-installer'}, { cmd = "LspInstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopWord lua require("packer.load")({'hop.nvim'}, { cmd = "HopWord", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Glow lua require("packer.load")({'glow.nvim'}, { cmd = "Glow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SessionLoad lua require("packer.load")({'dashboard-nvim'}, { cmd = "SessionLoad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ZenMode lua require("packer.load")({'zen-mode.nvim'}, { cmd = "ZenMode", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspUninstallAll lua require("packer.load")({'nvim-lsp-installer'}, { cmd = "LspUninstallAll", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LazyGit lua require("packer.load")({'lazygit.nvim'}, { cmd = "LazyGit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file IndentBlanklineRefresh lua require("packer.load")({'indent-blankline.nvim'}, { cmd = "IndentBlanklineRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Twilight lua require("packer.load")({'twilight.nvim'}, { cmd = "Twilight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Sayonara lua require("packer.load")({'vim-sayonara'}, { cmd = "Sayonara", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'lsp-trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Silicon lua require("packer.load")({'vim-silicon'}, { cmd = "Silicon", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TwilightDisable lua require("packer.load")({'twilight.nvim'}, { cmd = "TwilightDisable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipRun lua require("packer.load")({'sniprun'}, { cmd = "SnipRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspUninstall lua require("packer.load")({'nvim-lsp-installer'}, { cmd = "LspUninstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'lsp-trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopPattern lua require("packer.load")({'hop.nvim'}, { cmd = "HopPattern", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SudaRead lua require("packer.load")({'suda.vim'}, { cmd = "SudaRead", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SessionSave lua require("packer.load")({'dashboard-nvim'}, { cmd = "SessionSave", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dashboard lua require("packer.load")({'dashboard-nvim'}, { cmd = "Dashboard", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file IndentBlanklineDisable lua require("packer.load")({'indent-blankline.nvim'}, { cmd = "IndentBlanklineDisable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file IndentBlanklineEnable lua require("packer.load")({'indent-blankline.nvim'}, { cmd = "IndentBlanklineEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorizerToggle lua require("packer.load")({'nvim-colorizer.lua'}, { cmd = "ColorizerToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TwilightEnable lua require("packer.load")({'twilight.nvim'}, { cmd = "TwilightEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspPrintInstalled lua require("packer.load")({'nvim-lsp-installer'}, { cmd = "LspPrintInstalled", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <Plug>Lightspeed_T <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "<lt>Plug>Lightspeed_T", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>SnupClose <cmd>lua require("packer.load")({'sniprun'}, { keys = "<lt>Plug>SnupClose", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>SnipRun <cmd>lua require("packer.load")({'sniprun'}, { keys = "<lt>Plug>SnipRun", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>(dial-increment) <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>Plug>(dial-increment)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gc <cmd>lua require("packer.load")({'nvim-comment'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>f <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>Leader>f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Lightspeed_t <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "<lt>Plug>Lightspeed_t", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>(dial-decrement-additiona) <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>Plug>(dial-decrement-additiona)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>(dial-decrement) <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>Plug>(dial-decrement)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>(dial-increment-additional) <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>Plug>(dial-increment-additional)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>(EasyAlign) <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "<lt>Plug>(EasyAlign)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Lightspeed_f <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "<lt>Plug>Lightspeed_f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Lightspeed_F <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "<lt>Plug>Lightspeed_F", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType bib ++once lua require("packer.load")({'texmagic.nvim'}, { ft = "bib" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-table-mode', 'vim-markdown', 'mkdnflow.nvim', 'markdown-preview.nvim', 'glow.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType nim ++once lua require("packer.load")({'nim.nvim'}, { ft = "nim" }, _G.packer_plugins)]]
vim.cmd [[au FileType text ++once lua require("packer.load")({'vim-table-mode'}, { ft = "text" }, _G.packer_plugins)]]
vim.cmd [[au FileType latex ++once lua require("packer.load")({'texmagic.nvim'}, { ft = "latex" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'texmagic.nvim'}, { ft = "tex" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'which-key.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'nvim-treesitter', 'nvim-bufferline.lua', 'indent-blankline.nvim', 'windline.nvim', 'gitsigns.nvim', 'editorconfig-vim', 'nvim-lspconfig'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au CursorHold * ++once lua require("packer.load")({'vim-sandwich'}, { event = "CursorHold *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'vim-matchup', 'curstr.nvim'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-bufferline.lua', 'indent-blankline.nvim', 'windline.nvim', 'editorconfig-vim', 'nvim-lspconfig'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-treesitter', 'gitsigns.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'impatient.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au WinScrolled * ++once lua require("packer.load")({'vim-smoothie'}, { event = "WinScrolled *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
time([[Sourcing ftdetect script at: /home/atalariq/.local/share/nvim/site/pack/packer/opt/nim.nvim/ftdetect/nim.vim]], true)
vim.cmd [[source /home/atalariq/.local/share/nvim/site/pack/packer/opt/nim.nvim/ftdetect/nim.vim]]
time([[Sourcing ftdetect script at: /home/atalariq/.local/share/nvim/site/pack/packer/opt/nim.nvim/ftdetect/nim.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
