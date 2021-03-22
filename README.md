# Dotfiles ~/
>   Place to backup my configuration files

# Table of Content
<!-- TOC depthFrom:2 -->
- [Configuration List](#configuration-list)
    - [WM Related](#wm-related)
    - [Terminal Related](#terminal-related)
    - [CLI Tools](#cli-tools)
    - [Others](#others)
- [Screenshot](#screenshot)
- [Prerequisite](#prerequisite)
- [Installation](#installation)
- [Reference](#reference)
- [Todo](#todo)

<!-- /TOC -->

# Configuration List
##### WM Related
- [awesomeWM](https://awesomewm.org), Awesome Windows Manager
- [picom](https://github.com/yshui/picom), Compositor for X11 (I'm Using git version)
- [fusuma](https://github.com/iberianpig/fusuma), libinput multitouch gesture

##### Terminal Related:
- [alacritty](https://github.com/alacritty/alacritty), A fast, cross-platform, OpenGL terminal emulator
- [kitty](https://github.com/kovidgoyal/kitty), Cross-platform, fast, feature-rich, GPU based terminal 
- [zsh](https://www.zsh.org) with [zinit](https://github.com/zdharma/zinit) plugins manager

##### CLI Tools
- [tmux](https://github.com/tmux/tmux), Terminal multiplexer
- [neovim](https://neovim.io)(Nightly version/0.5), Text Editor
- [mpd](https://www.musicpd.org/) and [ncmpcpp](https://rybczak.net/ncmpcpp/), Run music in terminal
- [bat](https://github.com/sharkdp/bat), cat command but better
- [exa](https://github.com/sharkdp/exa), ls command but better with icons support
- [htop](https://htop.dev/), system monitoring
- [nnn](https://github.com/jarun/nnn), Terminal file manager
- [fzf](https;//github.com/junegunn/fzf), Fuzzy Finder
- [dotbare](https://github.com//kazhala/dotbare), Dotfiles manager interactively with fzf

##### Others
- X11
- Xresources

# Screenshot
WIP

# Prerequisite
- [GNU stow](https://www.gnu.org/software/stow/)
- [Git](https://git-scm.com/)

**Install Prerequisite:**
```bash
# Arch Linux:
sudo pacman -S git stow
```

# Installation

**Install Package:**
```bash
# Arch Linux (With AUR Helpers Like paru, yay, or trizen)
paru -S xorg xorg-xrdb \
    xdg-user-dirs \
    alacritty kitty zsh tmux \
    mpd mpc ncmpcpp mpdris2 playerctl pamixer \
    bat exa htop fzf \
    maim xdotool feh \
    neovim-nightly-bin nnn-nerd \
    awesome-git picom-git \
    ruby-fusuma ruby-fusuma-plugin-keypress ruby-fusuma-plugin-wmctrl
```

**Clone This Repo:**
```bash
cd ~
git clone https://github.com/atalazer/dotfiles.git .dotfiles
cd .dotfiles
```

**Add Symlinks with stow:**
```bash
# example
stow zsh            # It will make Symlink for zsh dir to /home/$USER dirs.
stow -D zsh         # It will unlink zsh symlink in /home/$USER dirs.
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
- [ ] Add another config files

