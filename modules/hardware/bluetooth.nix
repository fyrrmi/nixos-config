# module: hardware/bluetooth
# bluetooth activé, éteint au démarrage par défaut
{ ... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
}
