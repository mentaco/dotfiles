---------------------
---- MY PROGRAMS ----
---------------------
return {
    -- Home directory path
	home = os.getenv("HOME"),

	-- Set programs that you use
	terminal = "ghostty",
	fileManager = "thunar",
	menu = "rofi -modi 'combi,drun,window' -combi-modi 'drun,window' -show combi -show-icons -combi-display-format '{text} ({mode})'",
	appSwitcher = "rofi -show run",
	lock = "hyprlock",
}

