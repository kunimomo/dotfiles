local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- 基本設定
config.color_scheme = 'Pro'
config.macos_window_background_blur = 20
config.window_background_opacity = 0.8
config.window_decorations = "RESIZE"
config.window_background_gradient = { colors = { "#000000" } }

-- フォント
config.font = wezterm.font("JetBrains Mono", {
  weight = "Regular",
  stretch = "Normal",
  style = "Normal",
})
config.font_size = 12

-- IME
config.use_ime = true

-- カーソル
config.colors = {
  cursor_bg = '#FFFFFF',
  cursor_fg = '#000000',
  cursor_border = '#00FF00',
  selection_bg = '#D4F7D4',
  selection_fg = '#000000',
  tab_bar = { inactive_tab_edge = "none" },
}

-- タブバー設定
config.show_new_tab_button_in_tab_bar = false
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
  font = wezterm.font('JetBrains Mono', { weight = 'Bold' }),
}

local SOLID_LEFT_ARROW  = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, cfg, hover, max_width)
  local background = "#49575C"
  local foreground = "#FFFFFF"
  local edge_background = "none"

  if tab.is_active then
    background = "#FFE1E1"
    foreground = "#000000"
  end

  local edge_foreground = background
  local title_text = wezterm.truncate_right(tab.active_pane.title, max_width - 5)
  local title = "   " .. title_text .. "   "

  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)

-- キーバインド
local act = wezterm.action
config.keys = {
  { key = "f", mods = "CTRL", action = act.ToggleFullScreen },
  { key = "t", mods = "CTRL", action = act.SpawnTab "CurrentPaneDomain" },
  { key = "p", mods = "CTRL", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
}

return config
