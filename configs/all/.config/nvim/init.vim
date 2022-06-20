if has('nvim') > 0
  lua require("bootstrap")
  lua require("impatient")

  " map leader key to space
  let g:mapleader = " "
  let g:maplocalleader = ","

  " disable filetype.vim
  let g:did_load_filetypes = 1

  " disable default built-in features
  let g:loaded_gzip = 1
  let g:loaded_tar = 1
  let g:loaded_tarPlugin = 1
  let g:loaded_zip = 1
  let g:loaded_zipPlugin = 1
  let g:loaded_matchit = 1
  let g:loaded_matchparen = 1

  lua mapx = require("mapx").setup({ global = "force", whichkey = true })
  lua require("util")
  lua require("mappings")

  command! PackerInstall packadd packer.nvim | lua require('plugins').install()
  command! PackerUpdate  packadd packer.nvim | lua require('plugins').update()
  command! PackerSync    packadd packer.nvim | lua require('plugins').sync()
  command! PackerClean   packadd packer.nvim | lua require('plugins').clean()
  command! PackerStatus  packadd packer.nvim | lua require('plugins').status()
  command! PackerCompile packadd packer.nvim | lua require('plugins').compile('~/.config/nvim/plugin/packer_load.vim')
  command! -nargs=+ -complete=customlist,v:lua.require'packer'.loader_complete PackerLoad | lua require('packer').loader(<q-args>)
endif

runtime! events.vim
runtime! mappings.vim
runtime! settings.vim
