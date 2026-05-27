{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./gaming.nix
    ./desktop.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Disable i915 panel self refresh / prevents deep CPU c-states.
  boot.kernelParams = [ "i915.enable_psr=0" ];

  networking.hostName = "navi";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  users.users.paul = {
    isNormalUser = true;
    description = "paul";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      kdePackages.kate
      # thunderbird
    ];
  };

  # Automatic garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
    persistent = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  programs.firefox.enable = true;

  programs.fish.enable = true;
  programs.fish.interactiveShellInit = ''
    set fish_greeting
    starship init fish | source
  '';

  services.mullvad-vpn.enable = true;
  services.resolved.enable = true;

  # Tailscale
  services.tailscale.enable = true;
  networking.firewall = {
    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [ config.services.tailscale.port ];
  };

  environment.systemPackages = with pkgs; [
    fastfetch
    gajim
    equibop
    git
    unzip
    kitty
    zed-editor
    claude-code
    starship
    wayle
    # diagnostics
    kdePackages.qttools
    powertop
    intel-gpu-tools
  ];

  # Laptop power management
  powerManagement.enable = true;

  system.stateVersion = "25.11"; # Did you read the comment?
}
