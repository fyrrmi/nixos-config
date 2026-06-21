# module: desktop/cursor
# cursor theme — bibata modern ice (white, rounded corners)
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bibata-cursors
  ];
}
