local conditions = require("heirline.conditions")

local mode = require("config.components.mode")
local file = require("config.components.file")
local layout = require("config.components.layout")
local lsp = require("config.components.lsp")
local breadcrumbs = require("config.components.breadcrumb")

local oil = require("config.components.oil")
local neotree = require("config.components.neotree")

local DefaultStatusLine = {
	mode,
	layout.Space,
	file,
	layout.Space,
	breadcrumbs,
	layout.Align,
	lsp,
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
