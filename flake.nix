{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, hjem, nix-darwin, treefmt-nix, ... }:
  let
    theme = import ./theme.nix;
    systems = [ "x86_64-linux" "aarch64-darwin" ];
    forAllSystems = f: nixpkgs.lib.genAttrs systems f;
    treefmtEval = forAllSystems (system:
      treefmt-nix.lib.evalModule nixpkgs.legacyPackages.${system} ./treefmt.nix);
  in
  {
    formatter = forAllSystems (system: treefmtEval.${system}.config.build.wrapper);
    checks = forAllSystems (system: {
      formatting = treefmtEval.${system}.config.build.check self;
    });

    nixosConfigurations.navi = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs theme; };
      modules = [
        ./hosts/navi/default.nix
        hjem.nixosModules.default
      ];
    };

    nixosConfigurations.games = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs theme; };
      modules = [
        ./hosts/games/default.nix
        hjem.nixosModules.default
      ];
    };

    darwinConfigurations.sommei = nix-darwin.lib.darwinSystem {
      specialArgs = { inherit inputs theme; };
      modules = [
        ./hosts/sommei/default.nix
        hjem.darwinModules.default
      ];
    };

  };
}
