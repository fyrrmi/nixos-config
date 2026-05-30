# module: hardware/nvidia
# drivers nvidia propriétaires pour la rtx 4070 sur games
{ config, ... }:
{
  # active l'accélération graphique (remplace l'ancien hardware.opengl.enable)
  hardware.graphics.enable = true;

  # déclare nvidia comme pilote vidéo, nécessaire même sous wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # indispensable pour wayland (hyprland)
    modesetting.enable = true;

    # options laptop, désactivées sur desktop branché secteur
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    # driver propriétaire fermé (plus mature que le module open)
    open = false;

    # gui nvidia-settings pour régler ventilos, fréquences, etc.
    nvidiaSettings = true;

    # épinglage sur la branche stable du driver
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
