# module: desktop/sddm
# display server + sddm + us keyboard layout
{ ... }:

{
  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "hyprland";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
