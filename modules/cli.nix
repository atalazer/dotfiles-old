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
    bottom
    broot
    choose
    dasel
    dogdns
    duff
    du-dust
    exa
    fd
    fzf
    glow
    gopass
    gping
    grex
    htop
    hyperfine
    jq
    lf
    mdp
    neofetch
    pass
    pet
    procs
    tokei
    translate-shell
    trash-cli
    ripgrep
    sd
    skim
    xh
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
    topgrade.enable = true;
    bat = {
      enable = true;
      config = {
        theme = "base16";
        style = "plain";
      };
    };
    htop = {
      enable = true;
      settings = {
        enableMouse = true;
        highlightBaseName = true;
        highlightThreads = true;
        showCpuFrequency = true;
      };
    };
    tmux = {
      enable = true;
      prefix = "C-a";
      plugins = with pkgs; [
        tmuxPlugins.yank
        tmuxPlugins.tmux-fzf
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = ''
            set -g @resurrect-strategy-nvim 'session'
            set -g @resurrect-capture-pane-contents 'on'
          '';
        }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = ''
            set -g @continuum-boot 'off'
            set -g @continuum-restore 'off'
            set -g @continuum-save-interval '0'
          '';
        }
      ];
    };
    fzf = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };
}
