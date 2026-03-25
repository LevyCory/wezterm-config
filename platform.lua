local function get_os()
  return {
    windows = wezterm.target_triple:find('windows') ~= nil,
    macos = wezterm.target_triple:find('apple') ~= nil,
    linux = wezterm.target_triple:find('linux') ~= nil,
  }
end

return {
  os = get_os(),
  apply_config = function(config)
    local os = get_os()
    if os.windows then
      require('windows').apply_to_config(config)
    end
    if os.macos then
      require('macos').apply_to_config(config)
    end
    if os.linux then
      require('linux').apply_to_config(config)
    end
  end
}
