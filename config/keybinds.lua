-- ImJotaa Hyprland Keybinds Configuration
local mainMod = "SUPER"
local launchPrefix = "uwsm app -- "

---------------------------
---- WINDOW MANAGEMENT ----
---------------------------

hl.bind(mainMod .. " + Escape",		hl.dsp.exec_cmd("hyprctl kill"))
hl.bind(mainMod .. " + Q",		hl.dsp.window.close())
hl.bind(mainMod .. " + F",		hl.dsp.window.fullscreen())

-- Change focus
hl.bind(mainMod .. " + Left",	hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + Right",	hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + Up",	hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + Down",	hl.dsp.focus({ direction = "down" }))
hl.bind("ALT + Tab",		hl.dsp.window.cycle_next())

-- Move active window arround current workspace
hl.bind(mainMod .. " + SHIFT + Right",	hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + Left",	hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + Up",	hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + Down",	hl.dsp.window.move({ direction = "d" }))

-- Move with mouse
hl.bind(mainMod .. " + mouse:274",	hl.dsp.window.drag())

----------------------
---- APPLICATIONS ----
----------------------

hl.bind(mainMod .. " + Return",		hl.dsp.exec_cmd(launchPrefix .. TERMINAL))
hl.bind(mainMod .. " + B",		hl.dsp.exec_cmd(launchPrefix .. BROWSER))

---------------------------
---- HARDWARE CONTROLS ----
---------------------------

-- Audio controls
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctCall .. "volume increase"),   { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noctCall .. "volume decrease"),   { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd(noctCall .. "volume muteOutput"), { locked = true, repeating = true })

-- Media controls
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd(noctCall .. "media playPause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(noctCall .. "media playPause"), { locked = true })
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd(noctCall .. "media next"),      { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd(noctCall .. "media previous"),  { locked = true })

-------------------
---- UTILITIES ----
-------------------

-- Screen capture
hl.bind("Print",               hl.dsp.exec_cmd(noctCall .. "plugin:screen-toolkit annotate"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(noctCall .. "plugin:screen-toolkit annotateWindow"))

-- Clipboard
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(noctCall .. "launcher clipboard"))

--------------------
---- WORKSPACES ----
--------------------

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key,		hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key,	hl.dsp.window.move({ workspace = i, follow = true }))
end

