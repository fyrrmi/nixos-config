# module: desktop
# regroupe les modules graphiques communs (hyprland, sddm, audio, fonts, curseur, impression)
{ ... }:

{
 imports = [
   ./hyprland.nix
   ./sddm.nix
   ./audio.nix
   ./fonts.nix
   ./cursor.nix
   ./printing.nix
 ];
}
