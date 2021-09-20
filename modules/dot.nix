{ pkgs, config, home-manager, ... }:
let
  link = path:
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/.dotfiles/${path}";
in
{
  home.file = {
    ### GUI Stuff
    ".config/awesome".source = link "configs/wm/awesome";
    ".config/sway".source = link "configs/wm/sway";
    ".config/mako".source = link "configs/wm/mako";
    ".config/dunst".source = link "configs/wm/dunst";
    ".config/waybar".source = link "configs/wm/waybar";
    ".config/fusuma".source = link "configs/wm/fusuma";
    ".config/picom".source = link "configs/wm/picom";
    ".config/rofi".source = link "configs/wm/rofi";
    ".config/espanso".source = link "configs/wm/espanso";

    ### GUI-Apps Stuff
    ".config/alacritty".source = link "configs/gui/alacritty";
    ".config/kitty".source = link "configs/gui/kitty";
    ".config/fcitx".source = link "configs/gui/fcitx";
    ".config/fcitx5".source = link "configs/gui/fcitx5";
    ".config/mpv".source = link "configs/gui/mpv";
    ".config/qutebrowser".source = link "configs/gui/qutebrowser";
    ".config/viewnior".source = link "configs/gui/viewnior";
    ".config/tridactyl".source = link "configs/gui/tridactyl";

    ### CLI Stuff
    ".config/bat".source = link "configs/cli/bat";
    ".config/cava".source = link "configs/cli/cava";
    ".config/glow".source = link "configs/cli/glow";
    ".config/htop".source = link "configs/cli/htop";
    ".config/lazygit".source = link "configs/cli/lazygit";
    ".config/lf".source = link "configs/cli/lf";
    ".config/mpd".source = link "configs/cli/mpd";
    ".config/ncmpcpp".source = link "configs/cli/ncmpcpp";
    ".config/neofetch".source = link "configs/cli/neofetch";
    ".config/neomutt".source = link "configs/cli/neomutt";
    ".config/newsboat".source = link "configs/cli/newsboat";
    ".config/nnn".source = link "configs/cli/nnn";
    ".config/nvim".source = link "configs/cli/nvim";
    ".config/wtf".source = link "configs/cli/wtf";
    ".config/ytmdl".source = link "configs/cli/ytmdl";
    ".config/zellij".source = link "configs/cli/zellij";
    ".tmux.conf".source = link "configs/cli/tmux.conf";
    ".gitconfig".source = link "configs/cli/gitconfig";

    ### Shell Stuff
    ".config/shell/aliases".source = link "configs/shell/aliases";
    ".config/shell/functions".source = link "configs/shell/functions";
    ".config/starship.toml".source =
      link "configs/shell/starship/starship.toml";
    ".config/fish".source = link "configs/shell/fish";
    ".zsh".source = link "configs/shell/zsh";
    ".zshrc".source = link "configs/shell/zshrc";
    ".zshenv".source = link "configs/shell/zshenv";
    ".zprofile".source = link "configs/shell/zprofile";
    ".bashrc".source = link "configs/shell/bashrc";
    ".inputrc".source = link "configs/shell/inputrc";
    ".profile".source = link "configs/shell/profile";
    ".pam_environment".source = link "configs/shell/pam_environment";
    ".user".source = link "configs/shell/user";
    ".user.keys".source = link "configs/shell/user.keys";

    ### User Script
    # ".local/bin".source = link "configs/bin";
    ".local/script".source = link "configs/script/script";
    ".config/script".source = link "configs/script/script-conf";
    ".config/hosts".source = link "configs/misc/hosts";

    ### Fonts
    # ".fonts".source = link "configs/font/fonts";
    ".config/fontconfig".source = link "configs/font/fontconfig";

    ### Themes
    ".config/wal".source = link "configs/theme/wal";
    ".config/gtk-2.0".source = link "configs/theme/gtk-2.0";
    ".config/gtk-3.0".source = link "configs/theme/gtk-3.0";
    ".gtkrc-2.0".source = link "configs/theme/gtkrc-2.0";

    # X Stuff
    ".xprofile".source = link "configs/x11/xprofile";
    ".xinitrc".source = link "configs/x11/xinitrc";
    ".xserverrc".source = link "configs/x11/xserverrc";
    ".Xmodmap".source = link "configs/x11/Xmodmap";
    ".Xdefaults".source = link "configs/x11/Xdefaults";
    ".Xresources".source = link "configs/x11/Xresources";
    ".Xresources.d".source = link "configs/x11/Xresources.d";
    ".xsettingsd".source = link "configs/x11/xsettingsd";

    ### Archlinux Stuff
    ".config/pacman".source = link "configs/archlinux/pacman";
    ".config/paru".source = link "configs/archlinux/paru";

    ### Others
    # ".wallpaper".soure = link "configs/wallpaper";
    ".startpage".source = link "configs/startpage";

    ".config/user-dirs.dirs".source = link "configs/misc/user-dirs.dirs";
    ".config/user-dirs.locale".source =
      link "configs/misc/user-dirs.locale";
    ".config/mimeapps.list".source = link "configs/misc/mimeapps.list";

    ".config/screenkey.json".source = link "configs/misc/screenkey.json";
    ".config/pavucontrol.ini".source =
      link "configs/misc/pavucontrol.ini";

  };
}
