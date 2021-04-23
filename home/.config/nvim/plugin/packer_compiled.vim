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
  ["TrueZen.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/TrueZen.nvim"
  },
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["colorbuddy.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/colorbuddy.nvim"
  },
  ["curstr.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/curstr.nvim"
  },
  ["dial.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/dial.nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  firenvim = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/firenvim"
  },
  ["format.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/format.nvim"
  },
  ["friendly-snippets"] = {
    load_after = {
      ["vim-vsnip"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/glow.nvim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp-trouble.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/lsp-trouble.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim"
  },
  ["material.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/material.nvim"
  },
  neogit = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["nvim-autopairs"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-biscuits"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-biscuits"
  },
  ["nvim-bufferline.lua"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    after_files = { "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_buffer.vim", "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_calc.vim", "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_emoji.vim", "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_luasnip.vim", "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_nvim_lsp.vim", "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_nvim_lua.vim", "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_omni.vim", "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_path.vim", "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_snippets_nvim.vim", "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_spell.vim", "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_tags.vim", "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_treesitter.vim", "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_ultisnips.vim", "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vim_lsc.vim", "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vim_lsp.vim", "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vsnip.vim" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-ts-autotag", "nvim-ts-context-commentstring", "nvim-treesitter-pairs", "nvim-biscuits" },
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-treesitter-pairs"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-pairs"
  },
  ["nvim-ts-autotag"] = {
    load_after = {
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
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons"
  },
  ["nvim-whichkey-setup.lua"] = {
    after = { "vim-which-key" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-whichkey-setup.lua"
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
  ["shade.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/shade.nvim"
  },
  ["specs.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/specs.nvim"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/sql.nvim"
  },
  ["suda.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/suda.vim"
  },
  ["surround.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/surround.nvim"
  },
  tabular = {
    after_files = { "/home/atalariq/.local/share/nvim/site/pack/packer/opt/tabular/after/plugin/TabularMaps.vim" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/tabular"
  },
  ["telescope-arecibo.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/telescope-arecibo.nvim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-markdown"] = {
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
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/vim-startuptime"
  },
  ["vim-table-mode"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-table-mode"
  },
  ["vim-tridactyl"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-tridactyl"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    after = { "friendly-snippets", "vim-vsnip-integ" },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    after_files = { "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ/after/plugin/vsnip_integ.vim" },
    load_after = {
      ["vim-vsnip"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ"
  },
  ["vim-which-key"] = {
    load_after = {
      ["nvim-whichkey-setup.lua"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-which-key"
  },
  ["xresources-nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/xresources-nvim"
  }
}

time("Defining packer_plugins", false)

-- Command lazy-loads
time("Defining lazy-load commands", true)
vim.cmd [[command! -nargs=* -range -bang -complete=file Sayonara lua require("packer.load")({'vim-sayonara'}, { cmd = "Sayonara", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time("Defining lazy-load commands", false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time("Defining lazy-load filetype autocommands", true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'tabular', 'glow.nvim', 'vim-markdown', 'TrueZen.nvim', 'vim-table-mode'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType text ++once lua require("packer.load")({'tabular', 'TrueZen.nvim', 'vim-table-mode'}, { ft = "text" }, _G.packer_plugins)]]
vim.cmd [[au FileType tridactyl ++once lua require("packer.load")({'vim-tridactyl'}, { ft = "tridactyl" }, _G.packer_plugins)]]
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
