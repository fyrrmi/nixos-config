# module: desktop/fonts
# system fonts — jetbrains mono nerd font
{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
  ];
}
