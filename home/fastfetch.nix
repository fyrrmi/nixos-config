# symlink vers le dotfile fastfetch natif
{ ... }:

{
  home.file.".config/fastfetch/config.jsonc".source = ../config/fastfetch/config.jsonc;
}
