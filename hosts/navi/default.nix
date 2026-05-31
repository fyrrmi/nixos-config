# host navi — thinkpad personnel
# importe les modules communs + matériel intel spécifique au laptop
{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../../modules/core
    ../../modules/desktop
    ../../modules/hardware/intel.nix
    ../../modules/hardware/bluetooth.nix
    ../../modules/programs/cli.nix
    ../../modules/programs/office.nix
  ];

  networking.hostName = "navi";

  # gestion énergie laptop
  powerManagement.enable = true;

  environment.systemPackages = with pkgs; [
    powertop
  ];

  system.stateVersion = "25.11";
}
