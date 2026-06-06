# modules/programs/apps.nix
# applis graphiques généralistes (navigateur, etc.)
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brave
    imv  # viewer d'image natif wayland, minimaliste, clavier
     ];

     # associations type de fichier (mime) → application par défaut
     xdg.mime.defaultApplications = {
       "image/png"     = "imv.desktop";
       "image/jpeg"    = "imv.desktop";
       "image/gif"     = "imv.desktop";
       "image/webp"    = "imv.desktop";
       "image/bmp"     = "imv.desktop";
       "image/tiff"    = "imv.desktop";
       "image/svg+xml" = "imv.desktop";
       "image/x-icon"  = "imv.desktop";
     };
   }
