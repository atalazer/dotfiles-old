{
  description = "home-manager flake for non-nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      username = "atalariq";
    in
      {
        homeConfigurations = {
          linux = home-manager.lib.homeManagerConfiguration {
            system = "x86_64-linux";
            homeDirectory = "/home/${username}";
            username = username;
            configuration = { pkgs, config, ... }: {
              nixpkgs = {
                config = { allowUnfree = true; };
                overlays = [ (import ./modules/overlays.nix) ];
              };
              imports = [
                ./modules/pkgs.nix
                ./modules/fonts.nix
                ./modules/cli.nix
                ./modules/git.nix
                ./modules/nvim.nix
              ];
            };
          };
        };
        linux = self.homeConfigurations.linux.activationPackage;
      };
}
