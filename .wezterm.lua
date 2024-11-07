-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
-- This will hold the configuration.
local config = wezterm.config_builder()

config.front_end = "OpenGL"
config.max_fps = 144
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_rate = 500
config.term = "xterm-256color"

config.font = wezterm.font("CommitMono Nerd Font Mono")
config.cell_width = 0.9
config.window_background_opacity = 0.85
config.prefer_egl = true
config.font_size = 12

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
		overrides.color_scheme = "Cloud (terminal.sexy)"
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
		key = "o",
		mods = "CTRL|SHIFT",
		action = wezterm.action_callback(function(window, _)
			local overrides = window:get_config_overrides() or {}
			if overrides.window_background_opacity == 0.98 then
				overrides.window_background_opacity = 0.85
			else
				overrides.window_background_opacity = 0.98
			end
			window:set_config_overrides(overrides)
		end),
	},
}

config.color_scheme = "Catppuccin Mocha"
config.colors = {
	background = "#1e1e2e",
	cursor_border = "#f5e0dc",
	cursor_bg = "#f5e0dc",
	foreground = "#f2cdcd",
	cursor_fg = "#1e1e2e",
	selection_bg = "#51576d",
	selection_fg = "#f5e0dc",

	ansi = {"#6e6c7e", "#f38ba8", "#a6e3a1", "#f9e2af", "#89b4fa", "#cba6f7", "#94e2d5", "#bac2de"},
	brights = {"#45475a", "#f2cdcd", "#a6e3a1", "#f9e2af", "#89b4fa", "#cba6f7", "#94e2d5", "#f5e0dc"},

	tab_bar = {
		background = "#1e1e2e",
		active_tab = {
			bg_color = "#1e1e2e",
			fg_color = "#f5e0dc",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = "#1e1e2e",
			fg_color = "#6e6c7e",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		new_tab = {
			bg_color = "#1e1e2e",
			fg_color = "#6e6c7e",
		},
	},
}

config.window_frame = {
	font = wezterm.font({ family = "CommitMono Nerd Font Mono", weight = "Regular" }),
	active_titlebar_bg = "#1e1e2e",
}

config.window_decorations = "NONE | RESIZE"
config.default_prog = { "powershell.exe", "-NoLogo" }
config.initial_cols = 80

return config
