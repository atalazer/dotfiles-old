{ config, pkgs, libs, ... }: {
  home.packages = with pkgs; [
    ### Base
    nixUnstable
    cachix

    ### Shell
    # zsh
    # starship  # Manage by zinit
    tmux

    ### CLI Apps
    bat
    # bottom
    # broot
    # choose
    # dasel
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
    # grex
    htop
    # hyperfine
    jq
    lf
    mdp
    neofetch
    # neuron-notes
    pass
    pet
    # procs
    # tokei
    # topgrade
    translate-shell
    trash-cli
    ripgrep
    # sd
    # skim
    # xh
    zoxide

    ### Download
    # wget
    # aria

    ### Multimedia
    # mpvc
    # mpc_cli
    # playerctl
  ];

  programs = {
    home-manager.enable = true;
    password-store.enable = true;
  };
}
