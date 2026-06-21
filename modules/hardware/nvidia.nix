# module: hardware/nvidia
# proprietary nvidia drivers for the rtx 4070 on games
{ config, ... }:

{
  # enables graphics acceleration (replaces the old hardware.opengl.enable)
  hardware.graphics.enable = true;

  # declares nvidia as video driver, required even under wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # required for wayland (hyprland)
    modesetting.enable = true;

    # laptop options, disabled on a desktop running on AC power
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    # closed proprietary driver (more mature than the open module)
    open = false;

    # nvidia-settings gui to tune fans, clocks, etc.
    nvidiaSettings = true;

    # pin to the stable driver branch
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
