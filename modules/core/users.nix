# module: core/users
# user paul + nushell
{ pkgs, ... }:

{
  users.users.paul = {
    isNormalUser = true;
    description = "paul";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.nushell;
  };

}
