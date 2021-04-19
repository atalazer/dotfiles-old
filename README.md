# Dotfiles ~/
>   Place to backup my configuration files

# Table of Content
<!-- TOC depthFrom:2 -->
- [Screenshot](#screenshot)
- [Configuration List](#configuration-list)
  - [WM Related](#wm-related)
  - [Terminal Related](#terminal-related)
  - [CLI Tools](#cli-tools)
  - [Others](#others)
- [Installation](#installation)
  - [Updating](#updating)
- [Reference](#reference)
- [Todo](#todo)

<!-- /TOC -->

# Screenshot
<!-- ![AwesomeWM]() -->
<!-- ![Terminal]() -->
![Neovim](https://user-images.githubusercontent.com/63155578/114947981-55f02e00-9e78-11eb-88c0-fad98264652f.png)

# Configuration List
##### WM Related
- **WM**         : [AwesomeWM](https://awesomewm.org)
- **COMPOSITOR** : [Picom](https://github.com/yshui/picom) and [Alacritty](https://github.com/alacritty/alacritty)
- **TERMINAL**   : [Kitty](https://github.com/kovidgoyal/kitty)
- **SHELL**      : [zsh](https://www.zsh.org) with [zinit](https://github.com/zdharma/zinit)
- **MUSIC**      : [mpd](https://www.musicpd.org/) and [ncmpcpp](https://rybczak.net/ncmpcpp/)
- **EDIROR**     : [Neovim](https://neovim.io)(Nightly)
- **FILE**       : Nemo and [nnn](https://github.com/jarun/nnn)
- **DOTS**       : [Stow](https://www.gnu.org/software/stow/manual/stow.html) and [Dotbare](https://github.com//kazhala/dotbare)

# Installation

```bash
export DOTS="$HOME/.dotfiles"
git clone https://github.com/atalazer/dotfiles.git $DOTS
cd $DOTS
./setup install         # Install required dependencies and packages
./setup home apply      # Apply home dir

# Show help for details ./setup script
./setup help
```

## Updating
```bash
cd ${DOTS:-$HOME/.dotfiles}
git pull
./setup install         # Install required dependencies and packages
./setup home apply      # Apply home dir
```

# Reference
- [Dotfiles Archwiki](https://wiki.archlinux.org/index.php/Dotfiles)
- [dotfiles github.io](https://dotfiles.github.io/)

**Post/manual about GNU stow:**
- [GNU Stow Manual](https://www.gnu.org/software/stow/manual/stow.html)
- [Managing Dotfiles with GNU Stow](http://blog.xero.nu/managing_dotfiles_with_gnu_stow)
- [Dotfile Management with GNU Stow](https://jonleopard.com/blog/dotfile-management-with-gnu-stow)

### Todo
- [ ] Add Screenshot
- [x] Add another config files
- [ ] Add Wiki for details

