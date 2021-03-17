# Dotfiles ~/
Place to backup my configuration files

# Table of Content
<!-- TOC depthFrom:2 -->
- [Configuration List](#configuration-list)
- [Prerequisite](#prerequisite)
- [Installation](#installation)
- [Reference](#reference)

<!-- /TOC -->

# Configuration List
- [ZSH](https://www.zsh.org), with [zinit](https://github.com/zdharma/zinit) plugins manager
- [Tmux](https://github.com/tmux/tmux), Terminal multiplexer
- [MPD](https://www.musicpd.org/) and [ncmpcpp](https://rybczak.net/ncmpcpp/), Terminal music player
- [nnn](https://github.com/jarun/nnn), terminal file manager
- [Neovim](https://neovim.io)(Nightly version/0.5), My main text manager
- CLI Tools:
    - [bat](https://github.com/sharkdp/bat)
    - [htop](https://htop.dev/)
- Xresources

# Prerequisite
- [GNU stow](https://www.gnu.org/software/stow/)
- [Git](https://git-scm.com/)

Install Prerequisite: 
```bash
# Arch Linux:
sudo pacman -S git stow
```
# Installation
Install Package:
```bash
# Arch Linux (With AUR Helpers Like paru, yay, or trizen)
paru -S xdg-user-dirs xorg-xrdb zsh tmux mpd mpc ncmpcpp bat htop neovim-nightly-bin nnn-nerd
```
Clone This Repo:
```bash
cd ~
git clone https://github.com/atalazer/dotfiles.git .dotfiles
cd .dotfiles
```
Add Symlinks with stow:
```bash
# example
stow zsh            # It will make Symlink for zsh dir to /home/$USER dirs.
stow -D zsh         # It will unlink zsh symlink in /home/$USER dirs.
```
# Reference
- [Dotfiles Github](https://dotfiles.github.io/)

**Post about GNU stow:**
- [GNU Stow Manual](https://www.gnu.org/software/stow/manual/stow.html)
- [Managing Dotfiles with GNU Stow](http://blog.xero.nu/managing_dotfiles_with_gnu_stow)
- [Dotfile Management with GNU Stow](https://jonleopard.com/blog/dotfile-management-with-gnu-stow)

### Todo
- [ ] Add Screenshot
- [ ] Add another config files


