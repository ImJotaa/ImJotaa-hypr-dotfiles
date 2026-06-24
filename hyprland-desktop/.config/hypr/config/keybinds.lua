-- Import default programs configuration --
local default_programs = require ("config/default_programs")

-- Set "Windows" key as main modifier --
local mainMod = "SUPER"

-- Set close window keybind --
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(default_programs.terminal))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(default_programs.menu))
