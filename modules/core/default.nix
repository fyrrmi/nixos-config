# module: core
# groups shared system modules for every hosts
{ ... }:

{
  imports = [
    ./system.nix
    ./networking.nix
    ./users.nix
  ];
}
