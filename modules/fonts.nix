{ config, pkgs, home-manager, ... }:
let
  link = path:
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/.dotfiles/${path}";
in
{
  home.packages = with pkgs; [
    inter
    liberation_ttf
    mplus-outline-fonts
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}
