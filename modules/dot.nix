{ pkgs, config, home-manager, ... }:
let
  link = path:
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/.dotfiles/${path}";
in
{
  home.file = {
    ### GUI Stuff
    ".config/awesome".source = link "home/.config/awesome";
    # ".config/sway".source               = link "home/.config/sway";
    # ".config/mako".source               = link "home/.config/mako";
    # ".config/dunst".source              = link "home/.config/dunst";
    # ".config/waybar".source             = link "home/.config/waybar";
    # ".config/fusuma".source = link "home/.config/fusuma";
    ".config/picom".source = link "home/.config/picom";

    ### GUI-Apps Stuff
    ".config/espanso".source = link "home/.config/espanso";
    # ".config/fcitx".source              = link "home/.config/fcitx";
    # ".config/fcitx5".source             = link "home/.config/fcitx5";
    ".config/mpv".source = link "home/.config/mpv";
    ".config/rofi".source = link "home/.config/rofi";
    ".config/qutebrowser".source = link "home/.config/qutebrowser";
    ".config/viewnior".source = link "home/.config/viewnior";

    ### CLI Stuff
    # ".config/alacritty".source          = link "home/.config/alacritty";
    ".config/kitty".source = link "home/.config/kitty";
    ".config/nvim".source = link "home/.config/nvim";
    ".config/lf".source = link "home/.config/lf";
    ".config/nnn".source = link "home/.config/nnn";

    ### CLI-Apps Stuff
    # ".config/bat".source                = link "home/.config/bat";
    # ".config/htop".source               = link "home/.config/htop";
    ".config/glow".source = link "home/.config/glow";
    ".config/neofetch".source = link "home/.config/neofetch";
    # ".config/neomutt".source            = link "home/.config/neomutt";
    # ".config/newsboat".source           = link "home/.config/newsboat";
    # ".config/wtf".source                = link "home/.config/wtf";
    # ".config/ytmdl".source              = link "home/.config/ytmdl";
    # ".config/zellij".source             = link "home/.config/zellij";
    ".tmux.conf".source = link "home/.tmux.conf";

    ### Shell Stuff
    ".config/shell/aliases".source = link "home/.config/aliases";
    ".config/shell/functions".source = link "home/.config/shell/functions";
    ".config/starship.toml".source = link "home/.config/starship.toml";
    # ".config/fish".source               = link "home/.config/fish";
    ".zsh".source = link "home/.zsh";
    ".zshrc".source = link "home/.zshrc";
    ".zshenv".source = link "home/.zshenv";
    ".zprofile".source = link "home/.zprofile";
    # ".bashrc".source = link "home/.bashrc";
    ".inputrc".source = link "home/.inputrc";
    ".profile".source = link "home/.profile";
    ".pam_environment".source = link "home/.pam_environment";
    ".user".source = link "home/.user";
    ".user.keys".source = link "home/.user.keys";

    ### Git Stuff
    ".gitconfig".source = link "home/.gitconfig";
    ".config/lazygit".source = link "home/.config/lazygit";

    ### Music
    # ".config/cava".source               = link "home/.config/cava";
    ".config/mpd".source = link "home/.config/mpd";
    ".config/ncmpcpp".source = link "home/.config/ncmpcpp";

    ### User Script
    ".local/script".source = link "home/.local/script";
    # ".local/bin".source                 = link "home/.local/bin";
    ".config/hosts".source = link "home/.config/hosts";
    ".config/script".source = link "home/.config/script";

    ### Themes
    # ".fonts".source                     = link "home/.fonts";
    ".config/wal".source = link "home/.config/wal";
    ".config/fontconfig".source = link "home/.config/fontconfig";
    ".config/gtk-2.0".source = link "home/.config/gtk-2.0";
    ".config/gtk-3.0".source = link "home/.config/gtk-3.0";
    ".gtkrc-2.0".source = link "home/.gtkrc-2.0";
    ".xsettingsd".source = link "home/.xsettingsd";

    # X Stuff
    ".xprofile".source = link "home/.xprofile";
    ".xinitrc".source = link "home/.xinitrc";
    ".xserverrc".source = link "home/.xserverrc";
    ".Xmodmap".source = link "home/.Xmodmap";
    ".Xdefaults".source = link "home/.Xdefaults";
    ".Xresources".source = link "home/.Xresources";
    ".Xresources.d".source = link "home/.Xresources.d";

    ### Others
    # ".wallpaper".soure                  = link "home/.wallpaper";
    ".startpage".source = link "home/.startpage";

    ".config/user-dirs.dirs".source = link "home/.config/user-dirs.dirs";
    ".config/user-dirs.locale".source = link "home/.config/user-dirs.locale";
    ".config/mimeapps.list".source = link "home/.config/mimeapps.list";

    ".config/screenkey.json".source     = link "home/.config/screenkey.json";
    ".config/pavucontrol.ini".source    = link "home/.config/pavucontrol.ini";

  };
}
