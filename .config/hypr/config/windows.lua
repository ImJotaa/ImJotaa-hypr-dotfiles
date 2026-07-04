-- GENERAL OPTIONS --
hl.config({
	general = {
		-- Window separation --
		gaps_in = "5",

		-- Screen border separation --
		gaps_out = 15,

		-- Window resize --
		resize_on_border = true,
		extend_border_grab_area = 15
	}
})


-- WINDOW BEHAVIOUR --
hl.config({ general = { layout = "dwindle" } })
hl.config({ dwindle = { preserve_split = true } })

-- WINDOW SIZE --
hl.window_rule({ match = { float = true }, size = {1200, 600} })

-- Specific window sizes --
hl.window_rule({ match = { class = "kitty" }, size = {1000, 600} })
hl.window_rule({ match = { class = "zen" }, size = {1600, 900} })
hl.window_rule({ match = { class = "dolphin" }, size = {1100, 700} })

