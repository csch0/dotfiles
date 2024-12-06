local colors = require("catppuccin.palettes.macchiato")

local Path = {
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(0)
	end,
	flexible = true,
	{
		provider = function(self)
			return vim.fn.fnamemodify(self.filename, ":.")
		end,
	},
	{
		provider = function(self)
			return vim.fn.pathshorten(vim.fn.fnamemodify(self.filename, ":."))
		end,
	},
	{
		provider = function(self)
			return vim.fn.fnamemodify(self.filename, ":t")
		end,
	},
}

local Flags = {
	{
		condition = function()
			return vim.bo.modified
		end,
		provider = "󰛄",
		hl = { fg = colors.blue, bg = colors.mantle },
	},
	{
		condition = function()
			return not vim.bo.modifiable or vim.bo.readonly
		end,
		provider = "",
		hl = { fg = colors.rosewater, bg = colors.mantle },
	},
}

local Icon = {
	init = function(self)
		local filename = vim.api.nvim_buf_get_name(0)
		local ext = vim.fn.fnamemodify(filename, ":e")
		self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, ext)
	end,
	provider = function(self)
		return self.icon and (" " .. self.icon .. " ")
	end,
	hl = function(self)
		return { fg = self.icon_color, bg = colors.mantle }
	end,
}

return {
	Path = Path,
	Flags = Flags,
	Icon = Icon,
}
