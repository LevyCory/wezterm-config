return {
  setup = function(config)
    local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
    tabline.setup({
      options = {
        theme = config.color_scheme,
        icons_enabled = true,
        tabs_enabled = true,
        section_separators = {
          left = '',
          right = '',
        },
        component_separators = {
          left = '',
          right = '',
        },
        tab_separators = {
          left = '',
          right = '',
        },
      },
      sections = {
        tabline_a = {},
        tabline_b = {},
        tabline_c = {},
        tab_active = {
          'index',
          { 'parent', padding = 0 },
          '/',
          { 'cwd',    padding = { left = 0, right = 1 } },
          { 'zoomed', padding = 0 },
        },
        tab_inactive = { 'index', { 'process', padding = { left = 0, right = 1 } } },
        tabline_x = {},
        tabline_y = {},
        tabline_z = { 'ram', 'cpu' },
      },
      extensions = {},
    })
  end
}
