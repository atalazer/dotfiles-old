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
  ["DAPInstall.nvim"] = {
    commands = { "DIInstall", "DIUninstall", "DIList" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/DAPInstall.nvim"
  },
  LuaSnip = {
    after = { "friendly-snippets" },
    config = { "\27LJ\1\2/\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\20plugins.luasnip\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    wants = { "friendly-snippets" }
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-calc"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-emoji"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["curstr.nvim"] = {
    config = { "\27LJ\1\2.\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\19plugins.curstr\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/curstr.nvim"
  },
  ["dashboard-nvim"] = {
    commands = { "Dashboard", "SessionLoad", "SessionSave" },
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
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    wants = { "plenary.nvim" }
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
  ["indent-blankline.nvim"] = {
    load_after = {
      ["xresources-nvim"] = true
    },
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
    config = { "\27LJ\1\2Ö\2\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\a+match_only_the_start_of_same_char_seqs\2\30full_inclusive_prefix_key\n<c-x>\24jump_to_first_match\2\27highlight_unique_chars\1)jump_on_partial_input_safety_timeout\3ê\3\21limit_ft_matches\3\5\25grey_out_search_area\2\nsetup\15lightspeed\frequire\0" },
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
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/lsp-trouble.nvim",
    wants = { "nvim-web-devicons" }
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
  ["nim.nvim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nim.nvim"
  },
  ["null-ls.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    after = { "nvim-ts-autotag" },
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22plugins.autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23plugins.bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-bufferline.lua",
    wants = { "nvim-web-devicons" }
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\1\2+\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\16plugins.cmp\frequire\0" },
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
  ["nvim-dap"] = {
    config = { "\27LJ\1\2-\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\18plugins.debug\frequire\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-dap-ui"
  },
  ["nvim-ghost.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-ghost.nvim"
  },
  ["nvim-lsp-installer"] = {
    commands = { "LspInstall", "LspUninstall", "LspUninstallAll", "LspPrintInstalled" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    after = { "null-ls.nvim" },
    config = { "\27LJ\1\2#\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\blsp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-nonicons"] = {
    load_after = {
      ["xresources-nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-nonicons"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\1\2y\0\3\a\0\6\0\0154\3\0\0007\3\1\3%\4\2\0\16\5\2\0003\6\3\0>\3\4\2\16\2\3\0004\3\4\0%\4\5\0>\3\2\2\16\4\0\0\16\5\1\0\16\6\2\0>\3\4\1G\0\1\0\vnotify\frequire\1\0\1\ftimeout\3∏\23\tkeep\20tbl_deep_extend\bvim#\1\0\2\0\3\0\0044\0\0\0001\1\2\0:\1\1\0G\0\1\0\0\vnotify\bvim\0" },
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22plugins.nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    wants = { "nvim-web-devicons" }
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
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons"
  },
  ["one-small-step-for-vimkind"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/one-small-step-for-vimkind"
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
    loaded = true,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/tokyonight.nvim"
  },
  ["twilight.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/twilight.nvim"
  },
  ["vim-commentary"] = {
    keys = { { "", "gc" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-commentary"
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
    keys = { { "", "s" } },
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
    config = { "\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23wlsample.evil_line\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/windline.nvim"
  },
  ["xresources-nvim"] = {
    after = { "indent-blankline.nvim", "nvim-nonicons" },
    config = { "\27LJ\1\2Z\0\0\5\0\4\0\t3\0\0\0008\1\1\0004\2\1\0007\2\2\2%\3\3\0\16\4\1\0$\3\4\3>\2\2\1G\0\1\0\17colorscheme \bcmd\bvim\1\3\0\0\15xresources\15tokyonight\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/xresources-nvim"
  },
  ["zen-mode.nvim"] = {
    commands = { "ZenMode" },
    config = { "\27LJ\1\2Ÿ\1\0\1\5\0\t\0\0304\1\0\0007\1\1\0017\1\2\1\16\2\0\0%\3\3\0)\4\2\0>\1\4\0014\1\0\0007\1\1\0017\1\2\1\16\2\0\0%\3\4\0)\4\2\0>\1\4\0014\1\0\0007\1\1\0017\1\2\1\16\2\0\0%\3\5\0)\4\1\0>\1\4\0014\1\0\0007\1\6\1%\2\a\0>\1\2\0014\1\0\0007\1\6\1%\2\b\0>\1\2\1G\0\1\0\27IndentBlanklineDisable\19TwilightEnable\bcmd\tlist\14linebreak\twrap\24nvim_win_set_option\bapi\bvimŸ\1\0\1\5\0\t\0\0304\1\0\0007\1\1\0017\1\2\1\16\2\0\0%\3\3\0)\4\1\0>\1\4\0014\1\0\0007\1\1\0017\1\2\1\16\2\0\0%\3\4\0)\4\1\0>\1\4\0014\1\0\0007\1\1\0017\1\2\1\16\2\0\0%\3\5\0)\4\2\0>\1\4\0014\1\0\0007\1\6\1%\2\a\0>\1\2\0014\1\0\0007\1\6\1%\2\b\0>\1\2\1G\0\1\0\26IndentBlanklineEnable\20TwilightDisable\bcmd\tlist\14linebreak\twrap\24nvim_win_set_option\bapi\bvimå\2\1\0\4\0\18\0\0214\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\a\0003\3\6\0:\3\b\0023\3\t\0:\3\n\0023\3\v\0:\3\f\2:\2\r\0011\2\14\0:\2\15\0011\2\16\0:\2\17\1>\0\2\1G\0\1\0\ron_close\0\fon_open\0\fplugins\ttmux\1\0\1\fenabled\1\rgitsigns\1\0\1\fenabled\2\foptions\1\0\0\1\0\3\fenabled\2\nruler\1\fshowcmd\1\vwindow\1\0\0\1\0\3\rbackdrop\4≥ÊÃô\3≥Êºˇ\3\vheight\3(\nwidth\3d\nsetup\rzen-mode\frequire\0" },
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
  luasnip = "LuaSnip",
  ["luasnip.*"] = "LuaSnip",
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
try_loadstring("\27LJ\1\2˝\2\0\0\3\0\t\0\0154\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\0\0007\0\1\0007\0\2\0004\1\5\0007\1\6\1%\2\a\0>\1\2\2%\2\b\0$\1\2\1:\1\4\0G\0\1\0=/Pictures/Screenshots/silicon-{time:%Y-%m-%d-%H%M%S}.png\tHOME\vgetenv\aos\voutput\1\0\r\rline-pad\3\2\14pad-horiz\3(\rpad-vert\0032\ntheme\fDracula\16line-number\2\20window-controls\2\20shadow-offset-x\3\0\23shadow-blur-radius\3\0\tfont\28JetBrainsMono Nerd Font\15background\f#a999ff\20shadow-offset-y\3\0\17round-corner\2\17shadow-color\f#434434\fsilicon\6g\bvim\0", "setup", "vim-silicon")
time([[Setup for vim-silicon]], false)
-- Setup for: nvim-ghost.nvim
time([[Setup for nvim-ghost.nvim]], true)
try_loadstring("\27LJ\1\2•\4\0\0\2\0\t\0\0214\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\4\0004\0\0\0007\0\1\0'\1\1\0:\1\5\0004\0\0\0007\0\6\0%\1\a\0>\0\2\0014\0\0\0007\0\6\0%\1\b\0>\0\2\1G\0\1\0«\2                augroup nvim_ghost_user_autocommands\n                    au User www.reddit.com,www.stackoverflow.com set filetype=markdown\n                    au User www.reddit.com,www.github.com set filetype=markdown\n                    au User *github.com set filetype=markdown\n                augroup END\n            &let $GHOSTTEXT_SERVER_PORT = 4001\bcmd\27nvim_ghost_super_quiet\26nvim_ghost_use_script\20/usr/bin/python!nvim_ghost_python_executable\6g\bvim\0", "setup", "nvim-ghost.nvim")
time([[Setup for nvim-ghost.nvim]], false)
time([[packadd for nvim-ghost.nvim]], true)
vim.cmd [[packadd nvim-ghost.nvim]]
time([[packadd for nvim-ghost.nvim]], false)
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
try_loadstring("\27LJ\1\2≤\2\0\0\2\0\n\0\0254\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0)\1\2\0:\1\4\0004\0\0\0007\0\1\0)\1\2\0:\1\5\0004\0\0\0007\0\1\0)\1\2\0:\1\6\0004\0\0\0007\0\1\0)\1\2\0:\1\a\0004\0\0\0007\0\1\0003\1\t\0:\1\b\0G\0\1\0\1\6\0\0\aqf\15vista_kind\rterminal\vpacker\rNvimTree\24tokyonight_sidebars tokyonight_italic_functions\31tokyonight_italic_keywords\31tokyonight_italic_comments\31tokyonight_terminal_colors\bday\21tokyonight_style\6g\bvim\0", "setup", "tokyonight.nvim")
time([[Setup for tokyonight.nvim]], false)
time([[packadd for tokyonight.nvim]], true)
vim.cmd [[packadd tokyonight.nvim]]
time([[packadd for tokyonight.nvim]], false)
-- Setup for: emmet-vim
time([[Setup for emmet-vim]], true)
try_loadstring("\27LJ\1\2Ö\1\0\0\2\0\a\0\r4\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0%\1\4\0:\1\3\0004\0\0\0007\0\1\0%\1\6\0:\1\5\0G\0\1\0\6,\26user_emmet_leader_key\6a\20user_emmet_mode\30user_emmet_install_global\6g\bvim\0", "setup", "emmet-vim")
time([[Setup for emmet-vim]], false)
-- Setup for: nvim-colorizer.lua
time([[Setup for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\1\2Y\0\2\a\0\5\0\t4\2\0\0007\2\1\0027\2\2\2%\3\3\0\16\4\0\0\16\5\1\0003\6\4\0>\2\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\6n\20nvim_set_keymap\bapi\bvimD\1\0\4\0\3\0\0061\0\0\0\16\1\0\0%\2\1\0%\3\2\0>\1\3\1G\0\1\0\29<CMD>ColorizerToggle<CR>\15<leader>cc\0\0", "setup", "nvim-colorizer.lua")
time([[Setup for nvim-colorizer.lua]], false)
-- Setup for: glow.nvim
time([[Setup for glow.nvim]], true)
try_loadstring("\27LJ\1\2Y\0\2\a\0\5\0\t4\2\0\0007\2\1\0027\2\2\2%\3\3\0\16\4\0\0\16\5\1\0003\6\4\0>\2\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\6n\20nvim_set_keymap\bapi\bvim9\1\0\4\0\3\0\0061\0\0\0\16\1\0\0%\2\1\0%\3\2\0>\1\3\1G\0\1\0\18<CMD>Glow<CR>\15<leader>gg\0\0", "setup", "glow.nvim")
time([[Setup for glow.nvim]], false)
-- Setup for: zen-mode.nvim
time([[Setup for zen-mode.nvim]], true)
try_loadstring("\27LJ\1\2Y\0\2\a\0\5\0\t4\2\0\0007\2\1\0027\2\2\2%\3\3\0\16\4\0\0\16\5\1\0003\6\4\0>\2\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\6n\20nvim_set_keymap\bapi\bvim<\1\0\4\0\3\0\0061\0\0\0\16\1\0\0%\2\1\0%\3\2\0>\1\3\1G\0\1\0\21<CMD>ZenMode<CR>\15<leader>gy\0\0", "setup", "zen-mode.nvim")
time([[Setup for zen-mode.nvim]], false)
-- Setup for: suda.vim
time([[Setup for suda.vim]], true)
try_loadstring("\27LJ\1\2Y\0\0\2\0\5\0\t4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0%\1\4\0:\1\3\0G\0\1\0\16Password : \16suda#prompt\20suda_smart_edit\6g\bvim\0", "setup", "suda.vim")
time([[Setup for suda.vim]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2k\0\0\5\0\a\0\t4\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0003\4\6\0>\0\5\1G\0\1\0\1\0\1\fnoremap\2\28<CMD>NvimTreeToggle<CR>\6`\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\1\2ò\1\0\0\2\0\a\0\0174\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0'\1\0\0:\1\3\0004\0\0\0007\0\1\0'\1\0\0:\1\4\0004\0\0\0007\0\1\0%\1\6\0:\1\5\0G\0\1\0\ffirefox\17mkdp_browser\22mkdp_refresh_slow\20mkdp_auto_close\20mkdp_auto_start\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Setup for: vim-markdown
time([[Setup for vim-markdown]], true)
try_loadstring("\27LJ\1\2ä\1\0\0\2\0\5\0\r4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\3\0004\0\0\0007\0\1\0'\1\1\0:\1\4\0G\0\1\0\22vim_markdown_math\29vim_markdown_frontmatter\"vim_markdown_folding_disabled\6g\bvim\0", "setup", "vim-markdown")
time([[Setup for vim-markdown]], false)
-- Setup for: dashboard-nvim
time([[Setup for dashboard-nvim]], true)
try_loadstring("\27LJ\1\2Y\0\2\a\0\5\0\t4\2\0\0007\2\1\0027\2\2\2%\3\3\0\16\4\0\0\16\5\1\0003\6\4\0>\2\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\6n\20nvim_set_keymap\bapi\bvimî\1\1\0\4\0\a\0\r4\0\0\0%\1\1\0>\0\2\0011\0\2\0\16\1\0\0%\2\3\0%\3\4\0>\1\3\1\16\1\0\0%\2\5\0%\3\6\0>\1\3\1G\0\1\0\30<CMD>SessionSave last<CR>\t<F2>\30<CMD>SessionLoad last<CR>\t<F1>\0\22plugins.dashboard\frequire\0", "setup", "dashboard-nvim")
time([[Setup for dashboard-nvim]], false)
-- Setup for: vim-sayonara
time([[Setup for vim-sayonara]], true)
try_loadstring("\27LJ\1\2X\0\2\a\0\5\0\t4\2\0\0007\2\1\0027\2\2\2%\3\3\0\16\4\0\0\16\5\1\0003\6\4\0>\2\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\5\20nvim_set_keymap\bapi\bvimÄ\1\1\0\4\0\6\0\0141\0\0\0\16\1\0\0%\2\1\0%\3\2\0>\1\3\1\16\1\0\0%\2\3\0%\3\4\0>\1\3\1\16\1\0\0%\2\5\0%\3\4\0>\1\3\1G\0\1\0\n<M-w>\22<CMD>Sayonara<CR>\15<leader>qq\23<CMD>Sayonara!<CR>\14<leader>q\0\0", "setup", "vim-sayonara")
time([[Setup for vim-sayonara]], false)
-- Setup for: lightspeed.nvim
time([[Setup for lightspeed.nvim]], true)
try_loadstring('\27LJ\1\2Ω\3\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0ù\3                nmap <expr> f reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"\n                nmap <expr> F reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"\n                nmap <expr> t reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"\n                nmap <expr> T reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"\n            \bcmd\bvim\0', "setup", "lightspeed.nvim")
time([[Setup for lightspeed.nvim]], false)
-- Setup for: lazygit.nvim
time([[Setup for lazygit.nvim]], true)
try_loadstring("\27LJ\1\2Y\0\2\a\0\5\0\t4\2\0\0007\2\1\0027\2\2\2%\3\3\0\16\4\0\0\16\5\1\0003\6\4\0>\2\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\6n\20nvim_set_keymap\bapi\bvim€\2\1\0\4\0\v\1\0264\0\0\0007\0\1\0'\1\n\0:\1\2\0004\0\0\0007\0\1\0(\1\0\0:\1\3\0004\0\0\0007\0\1\0003\1\5\0:\1\4\0004\0\0\0007\0\1\0'\1\0\0:\1\6\0004\0\0\0007\0\1\0'\1\0\0:\1\a\0001\0\b\0\16\1\0\0%\2\t\0%\3\n\0>\1\3\1G\0\1\0\21<CMD>LazyGit<CR>\15<leader>gt\0\30lazygit_use_neovim_remote(lazygit_floating_window_use_plenary\1\5\0\0\b‚ï≠\b‚ïÆ\b‚ï∞\b‚ïØ)lazygit_floating_window_corner_chars+lazygit_floating_window_scaling_factor%lazygit_floating_window_winblend\6g\bvimÁÃô≥\6≥Ê¨ˇ\3\0", "setup", "lazygit.nvim")
time([[Setup for lazygit.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\1\2-\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\18plugins.debug\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\1\2y\0\3\a\0\6\0\0154\3\0\0007\3\1\3%\4\2\0\16\5\2\0003\6\3\0>\3\4\2\16\2\3\0004\3\4\0%\4\5\0>\3\2\2\16\4\0\0\16\5\1\0\16\6\2\0>\3\4\1G\0\1\0\vnotify\frequire\1\0\1\ftimeout\3∏\23\tkeep\20tbl_deep_extend\bvim#\1\0\2\0\3\0\0044\0\0\0001\1\2\0:\1\1\0G\0\1\0\0\vnotify\bvim\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\1\2+\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\16plugins.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: curstr.nvim
time([[Config for curstr.nvim]], true)
try_loadstring("\27LJ\1\2.\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\19plugins.curstr\frequire\0", "config", "curstr.nvim")
time([[Config for curstr.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file EmmetInstall lua require("packer.load")({'emmet-vim'}, { cmd = "EmmetInstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file SudaWrite lua require("packer.load")({'suda.vim'}, { cmd = "SudaWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file LspInstall lua require("packer.load")({'nvim-lsp-installer'}, { cmd = "LspInstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file HopWord lua require("packer.load")({'hop.nvim'}, { cmd = "HopWord", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file DIInstall lua require("packer.load")({'DAPInstall.nvim'}, { cmd = "DIInstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file SessionLoad lua require("packer.load")({'dashboard-nvim'}, { cmd = "SessionLoad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file LspUninstallAll lua require("packer.load")({'nvim-lsp-installer'}, { cmd = "LspUninstallAll", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file LazyGit lua require("packer.load")({'lazygit.nvim'}, { cmd = "LazyGit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file LspUninstall lua require("packer.load")({'nvim-lsp-installer'}, { cmd = "LspUninstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Glow lua require("packer.load")({'glow.nvim'}, { cmd = "Glow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file DIList lua require("packer.load")({'DAPInstall.nvim'}, { cmd = "DIList", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Silicon lua require("packer.load")({'vim-silicon'}, { cmd = "Silicon", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file DIUninstall lua require("packer.load")({'DAPInstall.nvim'}, { cmd = "DIUninstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'lsp-trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file ZenMode lua require("packer.load")({'zen-mode.nvim'}, { cmd = "ZenMode", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file SudaRead lua require("packer.load")({'suda.vim'}, { cmd = "SudaRead", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file HopPattern lua require("packer.load")({'hop.nvim'}, { cmd = "HopPattern", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Dashboard lua require("packer.load")({'dashboard-nvim'}, { cmd = "Dashboard", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file LspPrintInstalled lua require("packer.load")({'nvim-lsp-installer'}, { cmd = "LspPrintInstalled", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file SessionSave lua require("packer.load")({'dashboard-nvim'}, { cmd = "SessionSave", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file ColorizerToggle lua require("packer.load")({'nvim-colorizer.lua'}, { cmd = "ColorizerToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Sayonara lua require("packer.load")({'vim-sayonara'}, { cmd = "Sayonara", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'lsp-trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <Plug>(dial-decrement-additiona) <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>Plug>(dial-decrement-additiona)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>(dial-increment) <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>Plug>(dial-increment)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Lightspeed_T <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "<lt>Plug>Lightspeed_T", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>f <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>Leader>f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>(dial-increment-additional) <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>Plug>(dial-increment-additional)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gc <cmd>lua require("packer.load")({'vim-commentary'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Lightspeed_F <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "<lt>Plug>Lightspeed_F", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Lightspeed_f <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "<lt>Plug>Lightspeed_f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> s <cmd>lua require("packer.load")({'vim-sandwich'}, { keys = "s", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>(dial-decrement) <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>Plug>(dial-decrement)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>(EasyAlign) <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "<lt>Plug>(EasyAlign)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Lightspeed_t <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "<lt>Plug>Lightspeed_t", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType bib ++once lua require("packer.load")({'texmagic.nvim'}, { ft = "bib" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-table-mode', 'vim-markdown', 'markdown-preview.nvim', 'glow.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType nim ++once lua require("packer.load")({'nim.nvim'}, { ft = "nim" }, _G.packer_plugins)]]
vim.cmd [[au FileType text ++once lua require("packer.load")({'vim-table-mode'}, { ft = "text" }, _G.packer_plugins)]]
vim.cmd [[au FileType latex ++once lua require("packer.load")({'texmagic.nvim'}, { ft = "latex" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'texmagic.nvim'}, { ft = "tex" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'which-key.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'nvim-treesitter', 'nvim-lspconfig', 'nvim-bufferline.lua', 'windline.nvim', 'gitsigns.nvim'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'lightspeed.nvim'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au WinScrolled * ++once lua require("packer.load")({'vim-smoothie'}, { event = "WinScrolled *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-lspconfig', 'nvim-bufferline.lua', 'windline.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-treesitter', 'gitsigns.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'dashboard-nvim', 'xresources-nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'vim-matchup'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
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
