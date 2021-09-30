{ config, pkgs, home-manager, ... }: {
  home.packages = with pkgs; [
    delta
    gh
    hub
    # git
    # gitui
    lazygit
  ];
}
