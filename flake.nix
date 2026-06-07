{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, hjem, ... }: {

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
