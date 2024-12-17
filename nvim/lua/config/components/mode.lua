local conditions = require("heirline.conditions")
local colors = require("catppuccin.palettes.macchiato")

return {
	init = function(self)
		self.mode = vim.fn.mode()
	end,
	condition = function()
		return conditions.is_active() and not conditions.buffer_matches({
		})
	end,
	static = {
		mode_colors_map = {
			n = colors.blue,
			i = colors.green,
			v = colors.pink,
			V = colors.pink,
			["\22"] = "cyan",
			c = colors.peach,
			s = "purple",
			S = "purple",
			["\19"] = "purple",
			R = "oranges",
			r = "orange",
			["!"] = "red",
			t = "red",
		},
	},
	provider = function(self)
		return " " .. self.mode:upper() .. " "
	end,
	hl = function(self)
		return { bg = self.mode_colors_map[self.mode], fg = colors.mantle, bold = true }
	end,
	update = {
		"ModeChanged",
		pattern = "*:*",
		callback = vim.schedule_wrap(function()
			vim.cmd("redrawstatus")
		end),
	},
}
