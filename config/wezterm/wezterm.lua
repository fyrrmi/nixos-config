-- wezterm.lua — theme "blood & static" (serial experiments lain)
-- couleurs d'apres vmfunc/quaver, portees en lua natif (symlink hjem)

local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- police : jetbrainsmono nerd font (comme le reste de ta config)
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

-- couleurs : palette blood inline + les 16 ANSI dedies
config.colors = {
  foreground = '#c2b6c0',
  background = '#0d0a0e',
  cursor_bg = '#bf7593',
  cursor_border = '#bf7593',
  cursor_fg = '#060406',
  selection_bg = '#1e1824',
  selection_fg = '#c2b6c0',
  ansi = {
    '#1e1824', '#c0667e', '#82a08c', '#c4a878',
    '#8a7aa6', '#bf7593', '#6f9a98', '#c2b6c0',
  },
  brights = {
    '#4c4450', '#d07e96', '#9ab4a2', '#d4bc90',
    '#a08cc0', '#cf90ac', '#8ab4b0', '#e0d6dc',
  },
}

return config
