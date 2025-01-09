local colors = require("catppuccin.palettes.macchiato")

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local mode = require("config.components.mode")
local layout = require("config.components.layout")

local Folder = {
	init = function(self)
		self.folder = vim.fn.getcwd()
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

local Path = {
	provider = function(self)
		return vim.fn.fnamemodify(self.folder, ":~")
	end,
}

return {
	condition = function()
		return vim.bo.filetype == "neo-tree"
	end,
	layout.Space,
	utils.insert(Folder, Icon, Path),
}
