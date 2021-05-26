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
![AwesomeWM](https://user-images.githubusercontent.com/63155578/119593529-54fdd500-be04-11eb-9bdd-28b96c0603c5.png)
![Terminal](https://user-images.githubusercontent.com/63155578/119593804-d2294a00-be04-11eb-970e-cd368b83dfa9.png)
![Neovim](https://user-images.githubusercontent.com/63155578/114947981-55f02e00-9e78-11eb-88c0-fad98264652f.png)

<!-- Link -->
[arch-link]: https://archlinux.org/
[pacman-link]: https://wiki.archlinux.org/index.php/pacman
[paru-link]: https://github.com/Morganamilo/paru

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

[mpv-link]: https://mpv.io/
[nemo-link]: https://github.com/linuxmint/nemo

[nerd-font-link]: https://www.nerdfonts.com/
[system-font]: https://github.com/rsms/inter/
[stow-link]: https://www.gnu.org/software/stow/manual/stow.html
[dotbare-link]: https://github.com//kazhala/dotbare

# Configuration List
| Name                 | Details                                                                           |
| :---:                | :-----:                                                                           |
| **Operating System** | [Archlinux][arch-link]                                                            |
| **Package Manager**  | [pacman][pacman-link] and [paru][paru-link]                                       |
| **WM**               | [AwesomeWM][awesome-link]                                                         |
| **Compositor**       | [Picom Jonaburg Fork][picom-link]                                                 |
| **Fonts**            | [JetBrains Nerd Fonts][nerd-font-link] and [Inter Fonts][system-font]             |
| **Terminal**         | [Kitty][kitty-link]                                                               |
| **Shell**            | [fish][fish-link] with [fisher][fisher-link] and [starship Prompt][starship-link] |
| **Music**            | [mpd][mpd-link] and [ncmpcpp][ncmpcpp-link]                                       |
| **Editor**           | [Neovim 0.5][neovim-link]                                                         |
| **File Manager**     | [Nemo][nemo-link] and [nnn][nnn-link]                                             |
| **Dotfiles Manager** | [Stow][stow-link] and [Dotbare][dotbare-link]                                     |

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
- [ ] Improve `setup` Script

