{ config, pkgs, home-manager, ... }:
{
  home.packages = with pkgs; [
    # stylua
    # rnix-lsp
  ];
}
