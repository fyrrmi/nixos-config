# symlinks vers les dotfiles hyprland/hyprlock natifs
{ ... }:
{
  home.file.".config/hypr/hyprland.lua".source = ../config/hypr/hyprland.lua;
  home.file.".config/hypr/hyprlock.conf".source = ../config/hypr/hyprlock.conf;
}
