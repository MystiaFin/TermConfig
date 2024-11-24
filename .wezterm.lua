-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
-- This will hold the configuration.
local config = wezterm.config_builder()

config.front_end = "OpenGL"
config.max_fps = 144
config.animation_fps = 1
config.term = "xterm-256color"

config.font = wezterm.font("CommitMono Nerd Font Mono")
config.cell_width = 0.9
config.window_background_opacity = 0.85
config.prefer_egl = true
config.font_size = 13

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
  if overrides.color_scheme == "Gruvbox Dark" then
    overrides.color_scheme = "Gruvbox Light"
  else
    overrides.color_scheme = "Gruvbox Dark"
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

config.color_scheme = "Gruvbox Dark"
config.colors = {
  background = "#282828",
  cursor_border = "#ebdbb2",
  cursor_bg = "#ebdbb2",
  foreground = "#d79921",
  cursor_fg = "#282828",
  selection_bg = "#3c3836",
  selection_fg = "#ebdbb2",

  ansi = { "#3c3836", "#fb4934", "#b8bb26", "#fabd2f", "#83a598", "#d3869b", "#8ec07c", "#ebdbb2" },
  brights = { "#665c54", "#fb4934", "#b8bb26", "#fabd2f", "#83a598", "#d3869b", "#8ec07c", "#ebdbb2" },

  tab_bar = {
    background = "#282828",
    active_tab = {
      bg_color = "#3c3836",
      fg_color = "#ebdbb2",
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false,
    },
    inactive_tab = {
      bg_color = "#282828",
      fg_color = "#7c6f64",
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false,
    },
    new_tab = {
      bg_color = "#282828",
      fg_color = "#7c6f64",
    },
  },
}

config.window_frame = {
  font = wezterm.font({ family = "CommitMono Nerd Font Mono", weight = "Regular" }),
  active_titlebar_bg = "#282828",
}

config.window_decorations = "NONE | RESIZE"
config.default_prog = { "powershell.exe", "-NoLogo" }
config.initial_cols = 80
config.adjust_window_size_when_changing_font_size = false;
return config
