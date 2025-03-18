local colors = require("catppuccin.palettes.macchiato")
local conditions = require("heirline.conditions")

local breadcrumbs = require("config.components.breadcrumb")
local file = require("config.components.file")
local layout = require("config.components.layout")
local lsp = require("config.components.lsp")
local mode = require("config.components.mode")
local search = require("config.components.search")

local oil = require("config.components.oil")
local neotree = require("config.components.neotree")

local Encoding = {
	provider = function()
		local s = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
		return s:upper()
		-- return s ~= "utf-8" and s:upper()
	end,
}

local DefaultStatusLine = {
	mode,
	layout.Space,
	file,
	layout.Space,
	breadcrumbs,
	layout.Align,
	lsp,
	layout.Space,
	Encoding,
	layout.Space,
	search,
}

local statusline = {
	fallthrough = false,
	oil,
	neotree,
	DefaultStatusLine,
}

return {
	statusline = statusline,
}
