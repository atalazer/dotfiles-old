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
    ".config/eww".source = link "configs/wm/eww";
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
    ".config/bottom".source = link "configs/cli/bottom";
    ".config/broot".source = link "configs/cli/broot";
    ".config/cava".source = link "configs/cli/cava";
    ".config/gitui".source = link "configs/cli/gitui";
    ".config/glow".source = link "configs/cli/glow";
    ".config/handlr".source = link "configs/cli/handlr";
    ".config/himalaya".source = link "configs/cli/himalaya";
    ".config/htop".source = link "configs/cli/htop";
    ".config/lazygit".source = link "configs/cli/lazygit";
    ".config/lcfetch".source = link "configs/cli/lcfetch";
    ".config/lf".source = link "configs/cli/lf";
    ".config/mpd".source = link "configs/cli/mpd";
    ".config/ncmpcpp".source = link "configs/cli/ncmpcpp";
    ".config/neofetch".source = link "configs/cli/neofetch";
    ".config/neomutt".source = link "configs/cli/neomutt";
    ".config/newsboat".source = link "configs/cli/newsboat";
    ".config/nnn".source = link "configs/cli/nnn";
    ".config/nvim".source = link "configs/cli/nvim";
    ".config/pet".source = link "configs/cli/pet";
    ".config/wtf".source = link "configs/cli/wtf";
    ".config/youtube-dl".source = link "configs/cli/youtube-dl";
    ".config/ytmdl".source = link "configs/cli/ytmdl";
    ".config/zellij".source = link "configs/cli/zellij";
    ".config/zk".source = link "configs/cli/zk";
    ".config/topgrade.toml".source = link "configs/cli/topgrade.toml";
    ".gitconfig".source = link "configs/cli/gitconfig";

    ### Shell Stuff
    ".config/shell/aliases".source = link "configs/shell/shell/aliases";
    ".config/shell/configs".source = link "configs/shell/shell/configs";
    ".config/shell/functions".source = link "configs/shell/shell/functions";
    ".config/starship.toml".source = link "configs/shell/starship/starship.toml";
    ".config/shell/inputrc".source = link "configs/shell/misc/inputrc";
    ".config/shell/profile".source = link "configs/shell/misc/profile";
    ".config/shell/pam_environment".source = link "configs/shell/misc/pam_environment";
    ".pam_environment".source = link "configs/shell/misc/pam_environment";
    ".config/shell/user".source = link "configs/shell/misc/user";
    ".config/shell/user.private".source = link "configs/shell/misc/user.private";
    ".config/fish".source = link "configs/shell/fish";
    ".config/fsh".source = link "configs/shell/fsh";
    ".config/shell/bashrc".source = link "configs/shell/misc/bashrc";
    ".config/zsh".source = link "configs/shell/zsh";
    ".zprofile".source = link "configs/shell/zsh/.zprofile";

    ### User Script
    # ".local/bin".source = link "configs/bin";
    ".local/script".source = link "configs/script/script";
    ".config/script".source = link "configs/script/script-conf";
    ".config/hosts".source = link "configs/script/hosts";

    ### Themes
    ".config/wal".source = link "configs/theme/wal";
    ".config/qt5ct".source = link "configs/theme/qt5ct";
    ".config/gtk-2.0".source = link "configs/theme/gtk-2.0";
    ".config/gtk-3.0".source = link "configs/theme/gtk-3.0";

    # X Stuff
    ".xprofile".source = link "configs/x11/xprofile";
    ".xserverrc".source = link "configs/x11/xserverrc";
    ".xinitrc".source = link "configs/x11/xinitrc";
    ".config/x11/xprofile".source = link "configs/x11/xprofile";
    ".config/x11/xserverrc".source = link "configs/x11/xserverrc";
    ".config/x11/xinitrc".source = link "configs/x11/xinitrc";
    ".config/x11/xsettingsd".source = link "configs/x11/xsettingsd";
    ".config/x11/Xmodmap".source = link "configs/x11/Xmodmap";
    ".config/x11/Xresources".source = link "configs/x11/Xresources";
    ".config/x11/Xdefaults".source = link "configs/x11/Xresources";

    ### Archlinux Stuff
    ".config/pacman".source = link "configs/archlinux/pacman";
    ".config/paru".source = link "configs/archlinux/paru";

    ### Nix Stuff
    ".config/nix".source = link "configs/nix/nix";
    ".config/nixpkgs".source = link "configs/nix/nixpkgs";

    ### Others
    # ".local/wallpaper".soure = link "configs/wallpaper";
    ".local/startpage".source = link "configs/startpage";

    ".config/user-dirs.dirs".source = link "configs/misc/user-dirs.dirs";
    ".config/user-dirs.locale".source = link "configs/misc/user-dirs.locale";
    ".config/mimeapps.list".source = link "configs/misc/mimeapps.list";

    ".config/screenkey.json".source = link "configs/misc/screenkey.json";
    ".config/pavucontrol.ini".source = link "configs/misc/pavucontrol.ini";

  };
}
