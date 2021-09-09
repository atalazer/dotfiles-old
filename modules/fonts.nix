{ config, pkgs, home-manager, ... }:
{
  home.packages = with pkgs; [
    inter
    # mplus-outline-fonts
    # open-sans
    # (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
  # fonts.fontconfig.enable = true;
}
