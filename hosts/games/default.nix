# placeholder — sera complété au moment de l'install de games (phase 2)
{ ... }:

{
  imports = [
    # ./hardware.nix          # à générer avec nixos-generate-config
    ../../modules/core
  ];

  networking.hostName = "games";

  system.stateVersion = "25.11";
}
