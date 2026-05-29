# module: core/networking
# networkmanager + tailscale + mullvad + règles firewall associées
{ config, ... }:

{
  networking.networkmanager.enable = true;

  services.mullvad-vpn.enable = true;
  services.resolved.enable = true;

  services.tailscale.enable = true;

  networking.firewall = {
    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [ config.services.tailscale.port ];
  };
}
