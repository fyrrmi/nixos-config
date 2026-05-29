# module: desktop/sddm
# serveur d'affichage + sddm + plasma6 fallback + disposition clavier us
{ ... }:

{
  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "hyprland";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
