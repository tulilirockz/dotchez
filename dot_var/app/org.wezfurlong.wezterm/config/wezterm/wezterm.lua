local wezterm = require 'wezterm'
local config = {
  color_scheme = 'Catppuccin Mocha',
  font = wezterm.font 'JetBrains Mono',
  font_size = 18,
  default_prog = { "/home/linuxbrew/.linuxbrew/bin/zellij", "a", "-c", "mimiga" }
}

return config
