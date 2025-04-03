local wezterm = require 'wezterm'
local config = {
  color_scheme = 'Catppuccin Mocha',
  font = wezterm.font 'JetBrains Mono',
  font_size = 18,
  default_prog = { "/home/linuxbrew/.linuxbrew/bin/zellij", "a", "-c", "mimiga" },
  enable_tab_bar = false,
  window_close_confirmation = "NeverPrompt",
  front_end = "WebGpu",
  freetype_load_target = "Light",
  use_resize_increments = true,
  window_background_opacity = 0.8,
}

return config
