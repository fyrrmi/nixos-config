# module: desktop/hjem
# declarative dotfiles for user paul (symlinks via hjem)
{ config, lib, pkgs, theme, ... }:

let
  # wezterm.lua généré depuis theme.nix — plus de couleurs en dur
  weztermLua = pkgs.writeText "wezterm.lua" ''
    -- wezterm.lua — theme "${theme.variant}" (serial experiments lain)
    -- généré par nix depuis theme.nix, ne pas éditer à la main

    local wezterm = require 'wezterm'
    local config = wezterm.config_builder()

    -- police : jetbrainsmono nerd font (comme le reste de la config)
    config.font = wezterm.font_with_fallback {
      'JetBrainsMono Nerd Font',
      'Symbols Nerd Font',
    }
    config.font_size = 12.0
    config.line_height = 1.1

    -- fenetre
    config.window_background_opacity = 0.92
    config.window_decorations = 'NONE'
    config.window_padding = { left = 16, right = 16, top = 14, bottom = 12 }
    config.hide_tab_bar_if_only_one_tab = true
    config.use_fancy_tab_bar = false
    config.tab_bar_at_bottom = true
    config.default_cursor_style = 'BlinkingBar'
    config.cursor_blink_rate = 500
    config.max_fps = 120
    config.scrollback_lines = 10000
    config.audible_bell = 'Disabled'

    -- couleurs : palette ${theme.variant} + les 16 ANSI
    config.colors = {
      foreground = '${theme.palette.text}',
      background = '${theme.palette.base}',
      cursor_bg = '${theme.accentHex}',
      cursor_border = '${theme.accentHex}',
      cursor_fg = '${theme.palette.crust}',
      selection_bg = '${theme.palette.surface1}',
      selection_fg = '${theme.palette.text}',
      ansi = {
        '${builtins.elemAt theme.ansi16 0}', '${builtins.elemAt theme.ansi16 1}', '${builtins.elemAt theme.ansi16 2}', '${builtins.elemAt theme.ansi16 3}',
        '${builtins.elemAt theme.ansi16 4}', '${builtins.elemAt theme.ansi16 5}', '${builtins.elemAt theme.ansi16 6}', '${builtins.elemAt theme.ansi16 7}',
      },
      brights = {
        '${builtins.elemAt theme.ansi16 8}', '${builtins.elemAt theme.ansi16 9}', '${builtins.elemAt theme.ansi16 10}', '${builtins.elemAt theme.ansi16 11}',
        '${builtins.elemAt theme.ansi16 12}', '${builtins.elemAt theme.ansi16 13}', '${builtins.elemAt theme.ansi16 14}', '${builtins.elemAt theme.ansi16 15}',
      },
    }

    return config
  '';
in
{
  options.fyrr.wayle.runtimeFile = lib.mkOption {
    type = lib.types.path;
    description = "chemin du runtime.toml de wayle, spécifique au host";
  };

  config = {
    hjem.users.paul = {
      directory = "/home/paul";
      files = {
        ".config/hypr/hyprland.lua".source = ../../config/hypr/hyprland.lua;
        ".config/hypr/hyprlock.conf".source = ../../config/hypr/hyprlock.conf;

        ".config/kitty/kitty.conf".source = ../../config/kitty/kitty.conf;
        ".config/kitty/themes/eva24.conf".source = ../../config/kitty/themes/eva24.conf;

        ".config/wezterm/wezterm.lua".source = weztermLua;

        ".config/fastfetch/config.jsonc".source = ../../config/fastfetch/config.jsonc;

        ".config/nushell/config.nu".source = ../../config/nushell/config.nu;
        ".config/nushell/env.nu".source = ../../config/nushell/env.nu;

        ".config/starship.toml".source = ../../config/starship/starship.toml;

        ".config/wayle/runtime.toml".source = config.fyrr.wayle.runtimeFile;
        ".config/wayle/tombi.toml".source = ../../config/wayle/tombi.toml;
        ".config/wayle/config.toml".source = ../../config/wayle/config.toml;
        ".config/wayle/schema.json".source = ../../config/wayle/schema.json;
      };
    };
  };
}
