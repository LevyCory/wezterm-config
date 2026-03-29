return {
  gui_startup = function(cmd)
    local _, _, window = wezterm.mux.spawn_window(cmd or {})
    window:gui_window():maximize()
  end,
  format_tab_title = function(tab, _, _, _, hover, _)
    local process_name = tab.active_pane.foreground_process_name
    if process_name then
      if platform.os.windows then
        process_name = process_name:match("([^\\]+).exe$")
        if process_name == 'wslhost' then
          process_name = 'wsl'
        end
      else
        process_name = process_name:match("([^/]+)$")
      end
    end

    local title = process_name or "shell"

    local icons = {
      vim = ' ',
      nvim = ' ',
      bash = ' ',
      zsh = ' ',
      fish = ' ',
      powershell = ' ',
      cmd = ' ',
      wsl = ' ',
      python = ' ',
      python3 = ' ',
      git = ' ',
    }

    local bg_color = tab.is_active and '#8caaee' or (hover and '#414559' or '#303446')
    local fg_color = tab.is_active and '#232634' or '#c6d0f5'

    return {
      { Background = { Color = bg_color } },
      { Foreground = { Color = fg_color } },
      { Text = ' ' .. (icons[process_name] or '') .. title .. '  ' },
    }
  end,
}
