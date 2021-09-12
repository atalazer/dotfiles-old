{ config, pkgs, home-manager, ... }: {
  home.packages = with pkgs; [
    # inter
    # liberation_ttf
    # mplus-outline-fonts
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}
