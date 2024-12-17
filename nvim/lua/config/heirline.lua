local mode = require("config.components.mode")
local oil = require("config.components.oil")
local file = require("config.components.file")
local layout = require("config.components.layout")

local statusline = {
	mode,
	layout.Space,
	oil,
	file,
}

return {
	statusline = statusline,
}
