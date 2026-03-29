wezterm = require('wezterm')
platform = require('platform')

local events = require('events')

local config = {
  color_scheme = 'Catppuccin Frappe',
  font_size = 20,
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
  font = wezterm.font_with_fallback({
    'JetBrains Mono',
    'Symbols Nerd Font',
  }),

  launch_menu = {},
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = false,
  tab_max_width = 32,
  window_decorations = "INTEGRATED_BUTTONS|RESIZE",
  integrated_title_button_alignment = "Left",
  integrated_title_buttons = {
    "Close",
  },
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
}

-- Keymaps
require('keymaps').apply_to_config(config)

-- Event Handlers
wezterm.on("gui-startup", events.gui_startup)
wezterm.on('format-tab-title', events.format_tab_title)

-- Plugins
require('tabline').setup(config)

-- Platform specific config
platform.apply_config(config)

-- Env specific config
local has_env_config, env = pcall(require, 'env')
if has_env_config then
  env.apply_to_config(config)
end

return config
