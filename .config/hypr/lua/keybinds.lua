local vars = require("lua.variables")

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/configuring/core/binds/ for more
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(vars.terminal))
local closeWindowBind = hl.bind(mainMod .. " + W", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(
	mainMod .. " + SHIFT + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(vars.fileManager))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(vars.menu))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(vars.appSwitcher))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Resize windows
-- Enter Resize mode
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
	local function resize(key, x, y)
		hl.bind(
			key,
			hl.dsp.window.resize({
				x = x,
				y = y,
				relative = true,
			}),
			{ repeating = true }
		)
	end

	resize("L", 10, 0)
	resize("H", -10, 0)
	resize("K", 0, -10)
	resize("J", 0, 10)

	resize("SHIFT + L", 20, 0)
	resize("SHIFT + H", -20, 0)
	resize("SHIFT + K", 0, -20)
	resize("SHIFT + J", 0, 20)

	-- Exit Resize mode
	hl.bind("escape", hl.dsp.submap("reset"))
	hl.bind("return", hl.dsp.submap("reset"))
end)

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Scroll through workspaces with CTRL + ALT + arrow
hl.bind("CTRL + ALT + left", hl.dsp.focus({ workspace = "-1" }))
hl.bind("CTRL + ALT + right", hl.dsp.focus({ workspace = "+1" }))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + minus", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + minus", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

local scriptDir = vars.home .. "/.config/hypr/scripts"

-- Lock
hl.bind(mainMod .. " + backslash", hl.dsp.exec_cmd(vars.lock))

-- Clipboard
hl.bind(
	mainMod .. " + SHIFT + V",
	hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy")
)
hl.bind(mainMod .. " + SHIFT + ALT + V", hl.dsp.exec_cmd("cliphist wipe"))

-- Screenshot
local screenshotDir = vars.home .. "/Pictures"
local screenshotPath = screenshotDir .. "/Screenshot_$(date +'%Y%m%d_%H-%M-%S').png"
-- Fullscreen
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.exec_cmd("grim " .. screenshotPath))
-- Fullscreen/Clipboard
hl.bind(mainMod .. " + SHIFT + CTRL + 3", hl.dsp.exec_cmd("grim - | wl-copy"))
-- Selected
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.exec_cmd('grim -g "$(slurp)" ' .. screenshotPath))
-- Selected/Clipboard
hl.bind(mainMod .. " + SHIFT + CTRL + 4", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))
-- ActiveWindow
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.exec_cmd(scriptDir .. "/screenshot_active_window.sh"))

-- Volume control
hl.bind(
	"CTRL + comma",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/volume_notify.sh down"),
	{ locked = true, repeating = true }
)
hl.bind(
	"CTRL + period",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/volume_notify.sh up"),
	{ locked = true, repeating = true }
)
hl.bind("CTRL + SHIFT + slash", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume_notify.sh mute"), { locked = true })

-- Quake terminal
local quakeWorkspace = "quake"
local quakeClass = "com.example.ghostty.quake"
-- Window rule for Quake terminal
hl.window_rule({
	name = "quake-terminal",
	match = { class = quakeClass },
	pseudo = true,
})
hl.bind(mainMod .. " + T", hl.dsp.workspace.toggle_special(quakeWorkspace))
-- Move the terminal to a special workspace upon startup
hl.on("hyprland.start", function()
	hl.exec_cmd("ghostty --class=" .. quakeClass, {
		workspace = "special:" .. quakeWorkspace .. " silent",
	})
end)
-- Resize when open terminal
hl.on("window.open", function(w)
	if w.class ~= quakeClass then
		return
	end

	hl.dispatch(hl.dsp.window.resize({
		x = 1750,
		y = 1160,
		window = w,
	}))
end)

-- Laptop multimedia keys for volume and LCD brightness
-- hl.bind(
-- 	"XF86AudioRaiseVolume",
-- 	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
-- 	{ locked = true, repeating = true }
-- )
-- hl.bind(
-- 	"XF86AudioLowerVolume",
-- 	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
-- 	{ locked = true, repeating = true }
-- )
-- hl.bind(
-- 	"XF86AudioMute",
-- 	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
-- 	{ locked = true, repeating = true }
-- )
-- hl.bind(
-- 	"XF86AudioMicMute",
-- 	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
-- 	{ locked = true, repeating = true }
-- )
-- hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
-- hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
--
-- -- Requires playerctl
-- hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
-- hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

