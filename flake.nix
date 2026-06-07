{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, hjem, ... }: {

    nixosConfigurations.navi = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/navi/default.nix
        hjem.nixosModules.default
      ];
    };

    nixosConfigurations.games = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/games/default.nix
        hjem.nixosModules.default
      ];
    };

  };
}
