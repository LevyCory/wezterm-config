local function get_os()
  return {
    windows = wezterm.target_triple:find('windows') ~= nil,
    macos = wezterm.target_triple:find('apple') ~= nil,
  }
end

return {
  os = get_os(),
}
