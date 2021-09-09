{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    nixUnstable

    # acpi
    # light
    # lm_sensors

    wget
    # curl
    aria
    # ffmpeg
    # imagemagick
    
    bat
    exa
    fd
    ripgrep
    
    htop
    jq
    neofetch
    
    # mpd
    # playerctl
    # pulsemixer

    slop
    # maim

    # zsh
    # tmux
    # starship

    # xorg.xset
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
