
runtime! events.vim
runtime! mappings.vim
" runtime! settings.vim

if has('nvim-0.5.1') > 0
lua<< EOF
  require("impatient")
  mapx = require("mapx").setup({ global = true, whichkey = true })
EOF

  let s:user = "wbthomason"
  let s:repo = "packer.nvim"
  let s:install_path = stdpath("data") . "/site/pack/packer/opt/" . s:repo
  if empty(glob(s:install_path)) > 0
    execute printf("!git clone https://github.com/%s/%s %s", s:user, s:repo, s:install_path)
    packadd repo
  endif

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

lua << EOF
  require("settings")
  require("keymap")
  require("util")
EOF

  command! PackerInstall packadd packer.nvim | lua require('plugins').install()
  command! PackerUpdate  packadd packer.nvim | lua require('plugins').update()
  command! PackerSync    packadd packer.nvim | lua require('plugins').sync()
  command! PackerClean   packadd packer.nvim | lua require('plugins').clean()
  command! PackerStatus  packadd packer.nvim | lua require('plugins').status()
  command! PackerCompile packadd packer.nvim | lua require('plugins').compile('~/.config/nvim/plugin/packer_load.vim')
  command! -nargs=+ -complete=customlist,v:lua.require'packer'.loader_complete PackerLoad | lua require('packer').loader(<q-args>)
endif
