local mode = require("config.components.mode")
local oil = require("config.components.oil")
local file = require("config.components.file")
local layout = require("config.components.layout")
local diagnostic = require("config.components.lsp")
local breadcrumbs = require("config.components.breadcrumb")

local statusline = {
	mode,
	layout.Space,
	oil,
	file,
	layout.Space,
	breadcrumbs,
	layout.Align,
	diagnostic,
}

return {
	statusline = statusline,
}
