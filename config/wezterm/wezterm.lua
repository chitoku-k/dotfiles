local wezterm = require('wezterm')

local default_prog, font
if wezterm.target_triple:find('-linux-') then
  font = wezterm.font_with_fallback({ 'Inconsolata', 'Source Han Sans JP', 'Noto Color Emoji' })
elseif wezterm.target_triple:find('-windows-') then
  default_prog = {'pwsh.exe', '-NoLogo'}
  font = wezterm.font_with_fallback({ 'Consolas', 'BIZ UDゴシック', 'Segoe UI Emoji' })
end

local color_scheme = wezterm.color.get_builtin_schemes()['Ocean (base16)']
color_scheme.tab_bar = {
  background = color_scheme.background,
}

return {
  colors = color_scheme,
  cursor_blink_rate = 0,
  default_prog = default_prog,
  font = font,
  font_size = 10,
  hide_tab_bar_if_only_one_tab = true,
  line_height = 1.1,
  mouse_bindings = {
    {
      event = { Up = { streak = 1, button = "Left" } },
      mods = "NONE",
      action = wezterm.action.CompleteSelection("PrimarySelection"),
    },
    {
      event = { Up = { streak = 1, button = "Left" } },
      mods = "CTRL",
      action = wezterm.action.OpenLinkAtMouseCursor,
    },
    {
      event = { Down = { streak = 1, button = "Left" } },
      mods = "CTRL",
      action = wezterm.action.Nop,
    },
  },
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  use_fancy_tab_bar = false,
}
