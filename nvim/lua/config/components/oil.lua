local colors = require("catppuccin.palettes.macchiato")
local conditions = require("heirline.conditions")

local Path = {
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(0)
	end,
	condition = function()
		return conditions.buffer_matches({ filetype = { "oil" } })
	end,
	provider = function(self)
		return vim.fn.fnamemodify(self.filename, ":.")
	end,
	hl = function()
		return { bg = colors.blue, fg = colors.mantle }
	end,
}

return Path
