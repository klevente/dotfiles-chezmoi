local wezterm = require("wezterm")

return {
	-- color_scheme = 'Catppuccin Mocha',
	color_scheme = "Kanagawa (Gogh)",
	enable_tab_bar = false,
	enable_wayland = false,
	font = wezterm.font("JetBrainsMono NF"),
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	keys = {
		{
			key = "f",
			mods = "ALT",
			action = wezterm.action.ToggleFullScreen,
		},
	},
}
