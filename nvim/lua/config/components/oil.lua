local colors = require("catppuccin.palettes.macchiato")

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local oil = require("oil")

local Folder = {
	init = function(self)
		self.folder = oil.get_current_dir()
	end,
	condition = function()
		return conditions.buffer_matches({ filetype = { "oil" } })
	end,
}

local Path = {
	provider = function(self)
		return vim.fn.fnamemodify(self.folder, ":~")
	end,
}

local Icon = {
	provider = function()
		return " "
	end,
	hl = function()
		return { fg = colors.blue, bg = colors.mantle }
	end,
}

return utils.insert(Folder, Icon, Path)
