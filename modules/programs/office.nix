# modules/programs/office.nix
# onlyoffice suite
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    onlyoffice-desktopeditors
  ];
}
