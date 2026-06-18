# modules/desktop/cursor.nix
# thème de curseur : bibata modern ice (blanc, coins arrondis)
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bibata-cursors
  ];
}
