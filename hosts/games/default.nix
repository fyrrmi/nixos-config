# placeholder — sera complété au moment de l'install de games (phase 2)
{ ... }:

{
 imports = [
  ./hardware.nix
  ../../modules/core
  ../../modules/desktop
  ../../modules/hardware/nvidia.nix
  ../../modules/hardware/bluetooth.nix
  ../../modules/programs/gaming.nix
];
  networking.hostName = "games";

  system.stateVersion = "25.11";
}
