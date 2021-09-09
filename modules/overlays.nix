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
          #sha256 = "0000000000000000000000000000000000000000000000000000";
	  sha256 = "sha256-sLLwVgx2ifTqJdWZ3FwDOABtai2DN5M1E5A1EBCuSJc=";
        };
      }
    );
  };
}
