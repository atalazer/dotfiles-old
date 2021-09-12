{ config, pkgs, home-manager, ... }: {
  home.packages = with pkgs; [
    ### Lang
    # gcc
    # clang-tools

    ### Editor
    # neovim

    ### LSP and Linter
    rnix-lsp
    shellcheck
    nodePackages.eslint_d

    ### Formatter
    black
    stylua
    shfmt
    nixfmt

  ];
}
