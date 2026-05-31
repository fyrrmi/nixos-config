# modules/programs/apps.nix
# applis graphiques généralistes (navigateur, etc.)
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brave
  ];
}
