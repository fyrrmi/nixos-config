{ pkgs, ... }:
{
 nixpkgs.hostPlatform = "aarch64-darwin";
 nixpkgs.config.allowUnfree = true;
 system.primaryUser = "user";
 system.stateVersion = 5;

 # touch id
  security.pam.services.sudo_local.touchIdAuth = true;

 # fish
   programs.fish.enable = true;
   environment.shells = [ pkgs.fish ];
   users.knownUsers = [ "user" ];
   users.users.user = {
     uid = 501;
     shell = pkgs.fish;
   };
 # hjem — dotfiles déclaratifs
   hjem.users.user = {
     directory = "/Users/user";
     files = {
       ".config/kitty/kitty.conf".source = ../../config/kitty/kitty.conf;
       ".config/kitty/themes/eva24.conf".source = ../../config/kitty/themes/eva24.conf;
       ".config/starship.toml".source = ../../config/starship/starship.toml;
     };
   };
}
