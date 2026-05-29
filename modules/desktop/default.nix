# module: desktop
# regroupe les modules graphiques communs (hyprland, sddm, audio, fonts, impression)
{ ... }:

{
  imports = [
    ./hyprland.nix
    ./sddm.nix
    ./audio.nix
    ./fonts.nix
    ./printing.nix
  ];
}
