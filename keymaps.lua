return {
  apply_to_config = function(config)
    config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
    config.keys = {
      { key = 'l', mods = 'LEADER', action = wezterm.action.ShowLauncher },
    }
  end
}
