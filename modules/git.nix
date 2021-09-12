{ config, pkgs, home-manager, ... }: {
  home.packages = with pkgs; [
    gh
    git
    delta
    lazygit
  ];

  programs.git = {
    enable = true;
    userEmail = "baraboyolali@gmail.com";
    userName = "Atalazer";
    aliases = {
        co = "checkout";
        pu = "push";
      };
    delta = {
      enable = true;
      options = {};
    };
  };
  programs.lazygit = {
      enable = true;
      settings = {};
    };
}
