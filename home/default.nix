# home-manager — entrée principale
# symlinks uniquement vers les dotfiles natifs de config/
{ ... }:

{
  imports = [
    ./hypr.nix
    ./kitty.nix
    ./fastfetch.nix
    ./starship.nix
  ];

  home.username = "paul";
  home.homeDirectory = "/home/paul";
  home.stateVersion = "25.11";
}
