# module: programs/office
# onlyoffice suite
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    onlyoffice-desktopeditors
  ];
}
