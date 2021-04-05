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
local package_path_str = "/home/atalariq/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/atalariq/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/atalariq/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/atalariq/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/atalariq/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["aerial.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/aerial.nvim"
  },
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["ayu-vim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/ayu-vim"
  },
  ["curstr.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/curstr.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/editorconfig-vim"
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
  ["goyo.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  ["indent-guides.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/indent-guides.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/kommentary"
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
    after = { "vim-vsnip" },
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
    after = { "nvim-biscuits", "nvim-ts-autotag" },
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag"
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
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/tabular"
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
  ["vim-startify"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-startify"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/vim-startuptime"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    load_after = {
      ["nvim-compe"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  },
  ["vim-which-key"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-which-key"
  },
  vimade = {
    loaded = false,
    needs_bufread = false,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/opt/vimade"
  },
  ["xresources-nvim"] = {
    loaded = true,
    path = "/home/atalariq/.local/share/nvim/site/pack/packer/start/xresources-nvim"
  }
}


-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file Sayonara lua require("packer.load")({'vim-sayonara'}, { cmd = "Sayonara", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'glow.nvim', 'goyo.vim', 'vim-markdown'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType text ++once lua require("packer.load")({'goyo.vim'}, { ft = "text" }, _G.packer_plugins)]]
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
vim.cmd [[source /home/atalariq/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
