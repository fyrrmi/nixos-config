# module: core/users
# user paul + fish shell
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
