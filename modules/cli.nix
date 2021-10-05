{ config, pkgs, libs, ... }: {
  home.packages = with pkgs; [
    ### Base
    nixUnstable
    cachix

    ### Shell
    # zsh
    # starship  # Manage by zinit

    ### CLI Apps
    bat
    # bottom
    # broot
    # choose
    dasel
    # dogdns
    # duf
    # duff
    # du-dust
    exa
    fd
    fzf
    glow
    # gopass
    # gping
    grex
    # himalaya
    htop
    hyperfine
    jq
    lf
    mdp
    neofetch
    # neomutt
    newsboat
    # neuron-notes
    pass
    pet
    # pistol
    # procs
    # tokei
    # topgrade
    translate-shell
    trash-cli
    ripgrep
    sd
    # skim
    # speedtest-cli
    # xplr
    # xh
    zoxide

    ### Download
    # wget
    # aria

    ### Multimedia
    # mpvc
    # mpc_cli
    # playerctl

    ### Game
    bastet
    moon-buggy
    ninvaders
    nudoku
    terminal-typeracer
    ttyper
    typespeed
    uchess
  ];

  programs = {
    home-manager.enable = true;
    password-store.enable = true;
  };
}
