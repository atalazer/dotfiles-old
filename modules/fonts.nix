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

  fonts.fontconfig.enable = true;

  home.file = {
    ".fonts".source = link "configs/font/fonts";
    ".config/fontconfig/conf.d/20-font-preffered.font".source =
      link "configs/font/fontconfig/conf.d/20-font-preffered.font";
    ".config/fontconfig/conf.d/30-japanese-preffered.font".source =
      link "configs/font/fontconfig/conf.d/30-japanese-preffered.font";
  };
}
