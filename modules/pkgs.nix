{ config, pkgs, home-manager, ... }:
{
  home.packages = with pkgs; [
    ## Desktop Environment(DE)/Window Manger(WM)
    my.awesome-git
    pywal
    picom
    fusuma
    rofi
    rofi-calc

    ## Utils
    maim
    scrot
    tesseract         # OCR

    ## Services
    mpd
    espanso
    xclip
    gcr # for pinentry-gnome3

    ## GUI Apps
    feh
    mpv
    viewnior
    zathura
    # gImageReader
    # onlyoffice-bin
    # firefox-bin
    # kotatogram-desktop

    ## Terminal
    # alactitty
    kitty

  ];
  services.clipmenu.enable = true;
  programs.man.enable = false;
  home.extraOutputsToInstall = [ "man" ];
}
