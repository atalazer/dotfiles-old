{ config, pkgs, home-manager, ... }: {
  home.packages = with pkgs; [
    ### Desktop Environment(DE)/Window Manger(WM)
    # my.awesome-git
    # my.picom-git
    pywal
    rofi
    rofi-calc

    ### Utils
    handlr
    # maim
    # scrot
    # tesseract

    ### Services
    # espanso
    # fusuma
    gcr # for pinentry-gnome3
    mpd
    xclip

    ### GUI Apps
    # feh
    # mpv
    # viewnior
    # zathura
    # gImageReader
    # onlyoffice-bin
    # firefox-bin
    # kotatogram-desktop

    ### Terminal
    # alactitty
    # kitty

  ];
  services.clipmenu.enable = true;
  programs.man.enable = true;
  home.extraOutputsToInstall = [ "man" ];
}
