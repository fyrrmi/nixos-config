# module: desktop/hyprland
# hyprland + hyprlock + paquets de l'écosystème wayland
{ pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;

  environment.systemPackages = with pkgs; [
    rofi
    awww
    brightnessctl
    wayle
    hyprshot
  ];
}
