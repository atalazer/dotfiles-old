# Dotfiles ~/
> Place to backup my configuration files.
>
> Currently available for Linux.

# Table of Content
<!-- TOC depthFrom:2 -->
- [Screenshot](#screenshot)
- [Configuration List](#configuration-list)
- [Installation](#installation)
- [Reference](#reference)

<!-- /TOC -->

# Screenshot
![AwesomeWM](https://user-images.githubusercontent.com/63155578/119593529-54fdd500-be04-11eb-9bdd-28b96c0603c5.png)
![Terminal](https://user-images.githubusercontent.com/63155578/119593804-d2294a00-be04-11eb-970e-cd368b83dfa9.png)
![Neovim](https://user-images.githubusercontent.com/63155578/114947981-55f02e00-9e78-11eb-88c0-fad98264652f.png)

<!-- Link -->
[arch-link]: https://archlinux.org/
[pacman-link]: https://wiki.archlinux.org/index.php/pacman
[paru-link]: https://github.com/Morganamilo/paru
[nix-link]: https://nixos.org/

[awesome-link]: https://github.com/awesomewm/awesome
[picom-link]: https://github.com/yshui/picom
[rofi-link]: https://github.com/davatorium/rofi

[kitty-link]: https://github.com/kovidgoyal/kitty
[tmux-link]: https://github.com/tmux/tmux
[fish-link]: https://fishshell.com/
[fisher-link]: https://github.com/jorgebucaran/fisher
[zsh-link]: http://www.zsh.org/
[zinit-link]: https://github.com/zdharma/zinit
[starship-link]: https://starship.rs/

[neovim-link]: https://github.com/neovim/neovim
[mpd-link]: https://www.musicpd.org/
[ncmpcpp-link]: https://rybczak.net/ncmpcpp/
[nnn-link]: https://github.com/jarun/nnn
[lf-link]: https://github.com/gokcehan/lf

[mpv-link]: https://mpv.io/
[nemo-link]: https://github.com/linuxmint/nemo
[thunar-link]: https://docs.xfce.org/xfce/thunar/start

[nerd-font-link]: https://www.nerdfonts.com/
[system-font]: https://github.com/rsms/inter/
[stow-link]: https://www.gnu.org/software/stow/manual/stow.html
[dotbare-link]: https://github.com//kazhala/dotbare
[home-manager-link]: https://github.com/nix-community/home-manager

# Configuration List
| Name                 | Details                                                                            |
| :---:                | :-----:                                                                            |
| **Operating System** | [Archlinux][arch-link]                                                             |
| **Package Manager**  | [Pacman][pacman-link], [Paru][paru-link], and [Nix][nix-link]                      |
| **WM**               | [AwesomeWM][awesome-link]                                                          |
| **Compositor**       | [Picom ][picom-link]                                                               |
| **Fonts**            | [Inter Fonts][system-font] and [FiraCode Nerd Fonts][nerd-font-link]               |
| **Terminal**         | [Kitty][kitty-link]                                                                |
| **Shell**            | [ZSH][zsh-link] with [Zinit][zinit-link] and [Starship Prompt][starship-link]      |
| **Music**            | [MPD][mpd-link] and [ncmpcpp][ncmpcpp-link]                                        |
| **Editor**           | [Neovim][neovim-link]                                                              |
| **File Manager**     | [Thunar][thunar-link], [nnn][nnn-link], [lf][lf-link]                              |
| **Dotfiles Manager** | ~~[Stow][stow-link] and [Dotbare][dotbare-link]~~ [Home Manager][home-manager-link]|

# Installation

## Automatically with Nix home-manager
> NOTE: You need to install nix to use home-manager

To Install Nix:
```bash
curl -L https://nixos.org/nix/install | sh
```

Install and Use This Dotfiles:
```bash
export DOTS="$HOME/.dotfiles"
git clone https://github.com/atalazer/dotfiles.git $DOTS
cd $DOTS

./setup linux
# or
nix-shell -p nixUnstable --command \
   "nix build --experimental-features 'nix-command flakes' '.#linux'" --show-trace
```

## Manually
Just copy and paste the files from this dotfiles.

# Reference
**Dotfiles:**
- [Dotfiles Archwiki](https://wiki.archlinux.org/index.php/Dotfiles)
- [dotfiles github.io](https://dotfiles.github.io/)

**GNU Stow:**
- [GNU Stow Manual](https://www.gnu.org/software/stow/manual/stow.html)
- [Managing Dotfiles with GNU Stow](http://blog.xero.nu/managing_dotfiles_with_gnu_stow)
- [Dotfile Management with GNU Stow](https://jonleopard.com/blog/dotfile-management-with-gnu-stow)

**Home Manager:**
- [Nixos - Home Manager](https://nixos.wiki/wiki/Home_Manager)
- [Home Manager Repository](https://github.com/nix-community/home-manager)
- [Example: mjlbach/nix-dotfiles](https://github.com/mjlbach/nix-dotfiles/tree/flakes_home_manager_template)
- [Example: elianiva/dotfiles](https://github.com/elianiva/dotfiles)

