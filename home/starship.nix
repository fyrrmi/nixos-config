# symlink vers le dotfile starship natif
{ ... }:

{
  home.file.".config/starship/starship.toml".source = ../config/starship/starship.toml;
}
