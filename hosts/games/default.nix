# host: games
# desktop pc — gaming/multimedia
{ pkgs, inputs, ... }:

{
  imports = [
    ./hardware.nix
    ../../modules/core
    ../../modules/desktop
    ../../modules/desktop/hjem.nix
    ../../modules/hardware/nvidia.nix
    ../../modules/hardware/bluetooth.nix
    ../../modules/programs/cli.nix
    ../../modules/programs/gaming.nix
    ../../modules/programs/office.nix
    ../../modules/programs/apps.nix
    ../../modules/programs/spicetify.nix
    inputs.spicetify-nix.nixosModules.spicetify
  ];

  environment.systemPackages = with pkgs; [
    kdePackages.kdenlive
  ];

  networking.hostName = "games";

  fyrr.wayle.runtimeFile = ../../config/wayle/runtime-games.toml;

  boot.kernelModules = [ "nct6775" ];

  programs.coolercontrol.enable = true;

  system.stateVersion = "25.11";
}
