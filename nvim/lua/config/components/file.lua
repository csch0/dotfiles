local colors = require("catppuccin.palettes.macchiato")

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local File = {
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(0)
	end,
	condition = function()
		return not conditions.buffer_matches({
			filetype = { "oil" },
		})
	end,
}

local Path = {
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
		provider = " 󰛄 ",
		hl = { fg = colors.blue, bg = colors.mantle },
	},
	{
		condition = function()
			return not vim.bo.modifiable or vim.bo.readonly
		end,
		provider = "  ",
		hl = { fg = colors.rosewater, bg = colors.mantle },
	},
}

local Icon = {
	init = function(self)
		local name = vim.fn.fnamemodify(self.filename, ":t")
		local extension = vim.fn.fnamemodify(self.filename, ":e")
		self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(name, extension)
	end,
	provider = function(self)
		if self.icon then
			return self.icon .. " "
		else
			return " "
		end
	end,
	hl = function(self)
		return { fg = self.icon_color, bg = colors.mantle }
	end,
}

return utils.insert(File, Icon, Path, Flags)
