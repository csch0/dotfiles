local colors = require("catppuccin.palettes.macchiato")
local oil = require("oil")

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local mode = require("config.components.mode")
local layout = require("config.components.layout")

local Folder = {
	init = function(self)
		self.folder = oil.get_current_dir()
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

return {
	condition = function()
		return conditions.buffer_matches({ filetype = { "neo-tree" } })
	end,
	mode,
	layout.Space,
	utils.insert(Folder, Icon, Path),
}
