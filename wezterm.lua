wezterm = require('wezterm')
platform = require('platform')

local events = require('events')

local config = {
  color_scheme = 'Catppuccin Frappe',
  font_size = 20,
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },

  use_fancy_tab_bar = false,
  tab_bar_at_bottom = false,
  tab_max_width = 32,
  window_decorations = "RESIZE",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  keys = {
    { key = 'l', mods = 'ALT', action = wezterm.action.ShowLauncher }
  },

  window_frame = {
    font = wezterm.font_with_fallback({
      { family = 'Roboto',                  weight = 'Bold' },
      { family = 'JetBrainsMono Nerd Font', weight = 'Bold' },
      'Symbols Nerd Font',
    }),
    font_size = 16.0,
  },
}

-- Event Handlers
wezterm.on("gui-startup", events.gui_startup())
wezterm.on('format-tab-title', events.format_tab_title)

-- Plugins
require('tabline').setup(config)

-- Env specific config
local has_env_config, env_config = pcall(require, 'env')
if has_env_config then
  env_config.apply_to_config(config)
end

return config
