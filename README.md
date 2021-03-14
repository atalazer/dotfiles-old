# Dotfiles ~/
Place to backup my configuration files

# Table of Content
<!-- TOC depthFrom:2 -->
- [Prerequisite](#prerequisite)
- [Configuration List](#configuration-list)
- [Installation](#installation)

<!-- /TOC -->

# Prerequisite
- [GNU stow](https://www.gnu.org/software/stow/manual/stow.html)
- Git
-
Install Prerequisite: 
```bash
# Arch Linux Based:
sudo pacman -S git stow
```
# Configuration List
- [ZSH](https://www.zsh.org), with [zinit](https://github.com/zdharma/zinit) plugins manager.
- [Tmux](https://github.com/tmux/tmux), Terminal multiplexer
- MPD and ncmpcpp, Terminal music player.
- [nnn](https://github.com/jarun/nnn), terminal file manager.
- [Neovim](https://neovim.io)(Nightly version/0.5), My main text manager.
- OTHERS, [bat](https://github.com/sharkdp/bat), htop, Xresources.

# Installation
Clone This Repo:
```bash
cd ~
git clone https://github.com/atalazer/dotfiles.git
cd dotfiles
```
Add Symlinks with stow:
```bash
# example
stow zsh            # It will make Symlink for zsh dir to /home/$USER dirs.
stow -D zsh         # It will unlink zsh symlink in /home/$USER dirs.
```
