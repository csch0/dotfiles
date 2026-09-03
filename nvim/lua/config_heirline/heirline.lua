local colors = require("catppuccin.palettes.macchiato")
local conditions = require("heirline.conditions")

local breadcrumbs = require("config_heirline.components.breadcrumb")
local file = require("config_heirline.components.file")
local layout = require("config_heirline.components.layout")
local lsp = require("config_heirline.components.lsp")
local mode = require("config_heirline.components.mode")
local search = require("config_heirline.components.search")

local Encoding = {
	provider = function()
		local s = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
		return s:upper()
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
	-- neotree,
	DefaultStatusLine,
}

return {
	statusline = statusline,
}
