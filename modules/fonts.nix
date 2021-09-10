{ config, pkgs, home-manager, ... }: {
  home.packages = with pkgs; [
    inter
    mplus-outline-fonts
    liberation_ttf
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}
