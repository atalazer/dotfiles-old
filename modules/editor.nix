{ config, pkgs, home-manager, ... }:
{
  home.packages = with pkgs; [
    neovim
    stylua
    rnix-lsp
  ];
}
