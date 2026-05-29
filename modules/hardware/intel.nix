# module: hardware/intel
# paramètres gpu intel + correctif panel self refresh (i915)
{ pkgs, ... }:

{
  # désactive le panel self refresh i915 — évite les artefacts visuels
  boot.kernelParams = [ "i915.enable_psr=0" ];

  environment.systemPackages = with pkgs; [
    intel-gpu-tools
  ];
}
