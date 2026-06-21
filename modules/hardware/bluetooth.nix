# module: hardware/bluetooth
# bluetooth enabled, powered off at boot by default
{ ... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
}
