# module: core/users
# utilisateur paul + shell fish
{ pkgs, ... }:

{
  users.users.paul = {
    isNormalUser = true;
    description = "paul";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;
  programs.fish.interactiveShellInit = ''
    set fish_greeting
    starship init fish | source
  '';
}
