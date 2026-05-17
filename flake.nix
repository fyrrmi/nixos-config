{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {

    nixosConfigurations.HOSTNAME = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
      ];
    };

  };
}
