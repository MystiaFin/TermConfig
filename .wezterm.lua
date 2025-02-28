-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
-- This will hold the configuration.
local config = wezterm.config_builder()

config.front_end = "OpenGL"
config.max_fps = 144
config.animation_fps = 1
config.term = "xterm-256color"

config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.cell_width = 0.9
config.window_background_opacity = 0.85
config.prefer_egl = true
config.font_size = 10

config.window_padding = {
  left = 4,
  right = 4,
  top = 4,
  bottom = 4,
}

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true

wezterm.on("toggle-colorscheme", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if overrides.color_scheme == "Catppuccin Mocha" then
    overrides.color_scheme = "Catppuccin Latte"
  else
    overrides.color_scheme = "Catppuccin Mocha"
  end
  window:set_config_overrides(overrides)
end)

config.keys = {
  {
    key = "x",
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = "h",
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action.SplitPane({
      direction = "Down",
      size = { Percent = 50 },
    }),
  },
  {
    key = "v",
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action.SplitPane({
      direction = "Right",
      size = { Percent = 50 },
    }),
  },
  {
    key = '{',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.DecreaseFontSize
  },
  {
    key = '}',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.IncreaseFontSize
  },

  {
    key = "U",
    mods = "CTRL|SHIFT",
    action = act.AdjustPaneSize({ "Left", 5 }),
  },
  {
    key = "I",
    mods = "CTRL|SHIFT",
    action = act.AdjustPaneSize({ "Down", 5 }),
  },
  {
    key = "O",
    mods = "CTRL|SHIFT",
    action = act.AdjustPaneSize({ "Up", 5 }),
  },
  {
    key = "P",
    mods = "CTRL|SHIFT",
    action = act.AdjustPaneSize({ "Right", 5 }),
  },
  { key = "9", mods = "CTRL", action = act.PaneSelect },
  { key = "L", mods = "CTRL", action = act.ShowDebugOverlay },
  {
    key = "?",
    mods = "CTRL|SHIFT",
    action = wezterm.action_callback(function(window, _)
      local overrides = window:get_config_overrides() or {}
      if overrides.window_background_opacity == 0.995 then
        overrides.window_background_opacity = 0.85
      else
        overrides.window_background_opacity = 0.995
      end
      window:set_config_overrides(overrides)
    end),
  },
}

config.color_scheme = "Catppuccin Mocha"
config.colors = {
  background = "#1E1E2E",
  cursor_border = "#F5C2E7",
  cursor_bg = "#F5C2E7",
  foreground = "#CDD6F4",
  cursor_fg = "#1E1E2E",
  selection_bg = "#585B70",
  selection_fg = "#F5E0DC",

  ansi = { "#6C7086", "#F38BA8", "#A6E3A1", "#F9E2AF", "#89B4FA", "#F5C2E7", "#94E2D5", "#BAC2DE" },
  brights = { "#45475A", "#F38BA8", "#A6E3A1", "#F9E2AF", "#89B4FA", "#F5C2E7", "#94E2D5", "#A6ADC8" },

  tab_bar = {
    background = "#1E1E2E",
    active_tab = {
      bg_color = "#313244",
      fg_color = "#F5E0DC",
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false,
    },
    inactive_tab = {
      bg_color = "#1E1E2E",
      fg_color = "#7F849C",
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false,
    },
    new_tab = {
      bg_color = "#1E1E2E",
      fg_color = "#7F849C",
    },
  },
}

config.window_frame = {
  font = wezterm.font({ family = "CommitMono Nerd Font Mono", weight = "Regular" }),
  active_titlebar_bg = "#1E1E2E",
}

config.window_decorations = "NONE | RESIZE"
config.default_prog = { "powershell.exe", "-NoLogo" }
config.initial_cols = 80
config.adjust_window_size_when_changing_font_size = false
return config
