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
    (pkgs.sm64coopdx.overrideAttrs (old: {
              version = "1.5.1";
              src = pkgs.fetchFromGitHub {
                owner = "coop-deluxe";
                repo = "sm64coopdx";
                tag = "v1.5.1";
                hash = "sha256:18c3b3y78nyw384wbd1rrgkmd2ssmxr48bgz3jdp81nl71fn79q1";
              };
            }))
       ];

  # règles udev manettes nintendo (joy-con, pro controller)
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="0337", MODE="0666"
  '';

  boot.kernelModules = [ "hid-nintendo" ];
}
