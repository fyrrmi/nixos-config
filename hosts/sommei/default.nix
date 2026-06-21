# host: sommei
# macbook pro m1 — nix-darwin/daily driver
{ pkgs, ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;
  system.primaryUser = "user";
  system.stateVersion = 5;

  # touch id for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  # fish shell
  programs.fish.enable = true;
  environment.shells = [ pkgs.fish ];
  users.knownUsers = [ "user" ];
  users.users.user = {
    uid = 501;
    shell = pkgs.fish;
  };

  # hjem — declarative dotfiles
  hjem.users.user = {
    directory = "/Users/user";
    files = {
      ".config/kitty/kitty.conf".source = ../../config/kitty/kitty.conf;
      ".config/kitty/themes/eva24.conf".source = ../../config/kitty/themes/eva24.conf;
      ".config/starship.toml".source = ../../config/starship/starship.toml;
      ".config/fish/config.fish".source = ../../config/fish/config.fish;
    };
  };
}
