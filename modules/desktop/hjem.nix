# module: desktop/hjem
# declarative dotfiles for user paul (symlinks via hjem)
{ config, ... }:

{
  hjem.users.paul = {
    directory = "/home/paul";
    files = {
      ".config/hypr/hyprland.lua".source = ../../config/hypr/hyprland.lua;
      ".config/hypr/hyprlock.conf".source = ../../config/hypr/hyprlock.conf;

      ".config/kitty/kitty.conf".source = ../../config/kitty/kitty.conf;
      ".config/kitty/themes/eva24.conf".source = ../../config/kitty/themes/eva24.conf;

      ".config/wezterm/wezterm.lua".source = ../../config/wezterm/wezterm.lua;

      ".config/fastfetch/config.jsonc".source = ../../config/fastfetch/config.jsonc;

      ".config/nushell/config.nu".source = ../../config/nushell/config.nu;
      ".config/nushell/env.nu".source = ../../config/nushell/env.nu;

      ".config/starship.toml".source = ../../config/starship/starship.toml;

      # per-host runtime file: navi gets its own, everything else gets games
      ".config/wayle/runtime.toml".source =
        if config.networking.hostName == "navi"
        then ../../config/wayle/runtime-navi.toml
        else ../../config/wayle/runtime-games.toml;
      ".config/wayle/tombi.toml".source = ../../config/wayle/tombi.toml;
      ".config/wayle/config.toml".source = ../../config/wayle/config.toml;
      ".config/wayle/schema.json".source = ../../config/wayle/schema.json;
    };
  };
}
