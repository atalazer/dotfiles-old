{ config, pkgs, home-manager, ... }: {
  home.packages = with pkgs; [
    gh
    # git
    delta
    lazygit
  ];
}
