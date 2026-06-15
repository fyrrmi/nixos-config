{ pkgs, ... }:
{
 nixpkgs.hostPlatform = "aarch64-darwin";
 nixpkgs.config.allowUnfree = true;
 system.primaryUser = "user";
 system.stateVersion = 5;

 # fish
   programs.fish.enable = true;
   environment.shells = [ pkgs.fish ];
   users.knownUsers = [ "user" ];
   users.users.user = {
     uid = 501;
     shell = pkgs.fish;
   };
}
