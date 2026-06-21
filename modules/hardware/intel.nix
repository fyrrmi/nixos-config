# module: hardware/intel
# intel gpu settings + panel self refresh fix (i915)
{ pkgs, ... }:

{
  # disable i915 panel self refresh — avoids visual artifacts
  boot.kernelParams = [ "i915.enable_psr=0" ];

  environment.systemPackages = with pkgs; [
    intel-gpu-tools
  ];
}
