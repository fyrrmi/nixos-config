# module: programs/gaming
# steam + proton-ge + compatibilité manettes nintendo
{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  environment.systemPackages = [
    pkgs.archipelago
    pkgs.poptracker # tracker de progression pour randomizers archipelago
  ];

  # règles udev manettes nintendo (joy-con, pro controller)
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="0337", MODE="0666"
  '';

  boot.kernelModules = [ "hid-nintendo" ];
}
