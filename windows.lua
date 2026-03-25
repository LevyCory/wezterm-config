return {
  apply_to_config = function(config)
    table.insert(config.launch_menu,
      {
        label = 'PowerShell',
        args = { 'powershell.exe', '-NoLogo' }
      }
    )

    table.insert(config.launch_menu,
      {
        label = 'cmd',
        args = { 'cmd.exe' }
      }
    )

    table.insert(config.keys, {
      key = 'w',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.CloseCurrentTab { confirm = false },
    })
  end
}
