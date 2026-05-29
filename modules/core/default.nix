# module: core
# regroupe les modules système communs à tous les hosts
{ ... }:

{
  imports = [
    ./system.nix
    ./networking.nix
    ./users.nix
  ];
}
