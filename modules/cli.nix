{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    # Base
    nixUnstable

    # Shell
    zsh
    tmux
    starship

    # CLI Apps
    bat
    exa
    fd
    fzf
    htop
    lf
    neofetch
    nnn
    translate-shell
    trash-cli
    ripgrep
    zoxide

    # Download
    wget
    curl
    aria

    # Multimedia
    ffmpeg
    imagemagick
    mpc_cli
    mpvc
    ncmpcpp
    playerctl
    pulsemixer

    # Misc
    acpi
    jq
    light
    lm_sensors
    slop
    handlr              # xdg-open alternative
    xorg.xset
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
