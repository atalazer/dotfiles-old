{ config, pkgs, home-manager, ... }: {
  home.packages = with pkgs; [
    ### Lang
    # gcc
    # clang-tools

    ### Editor
    # neovim

    ### LSP and Linter
    # codespell
    rnix-lsp
    shellcheck
    # vale
    # vim-vint
    nodePackages.eslint_d

    ### Formatter
    black
    nixfmt
    shfmt
    stylua
    nodePackages.prettier

  ];
}
