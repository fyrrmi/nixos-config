# symlinks vers les dotfiles kitty natifs
{ ... }:

{
  home.file.".config/kitty/kitty.conf".source = ../config/kitty/kitty.conf;
  home.file.".config/kitty/themes/eva24.conf".source = ../config/kitty/themes/eva24.conf;
}
