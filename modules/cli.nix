{ config, pkgs, libs, ... }: {
  home.packages = with pkgs; [
    ### Base
    nixUnstable

    ### Shell
    # zsh
    tmux
    starship

    ### CLI Apps
    bat
    exa
    fd
    fzf
    glow
    htop
    lf
    neofetch
    nnn
    translate-shell
    trash-cli
    ripgrep
    zoxide

    ### Download
    wget
    aria

    ### Multimedia
    mpvc
    mpc_cli
    playerctl
  ];

  programs.bat = {
    enable = true;
    config = {
      theme = "base16";
      style = "plain";
    };
  };

  programs.htop = {
    enable = true;
    settings = {
      enableMouse = true;
      highlightBaseName = true;
      highlightThreads = true;
      showCpuFrequency = true;
    };
  };
}
