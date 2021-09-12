final: prev:
let
  pkgs = import <nixpkgs> {};
in
{
  my = {
    awesome-git = prev.awesome.overrideAttrs (
      old: {
        version = "master";
        src = prev.fetchFromGitHub {
          owner = "awesomewm";
          repo = "awesome";
          rev = "7ae6d26363442b246ca26e195bdaf3d8b91b58a8";
          sha256 = "sha256-sLLwVgx2ifTqJdWZ3FwDOABtai2DN5M1E5A1EBCuSJc=";
        };
      }
    );
    picom-git = prev.picom.overrideAttrs (
      old: {
        version = "next";
        src = prev.fetchFromGitHub {
          owner = "yshui";
          repo = "picom";
          rev = "1dbffec3aef33c6c6d6c4f248009cccaf01226cb";
          sha256 = "sha256-Oipgvo7GgmzZSq3tJXJ5hvq+pVgZHBXn6qJpICaoyo0=";
        };
      }
    );
  };
}
