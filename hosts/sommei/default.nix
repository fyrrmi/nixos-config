{ pkgs, ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;
  system.primaryUser = "user";
  system.stateVersion = 5;
}
