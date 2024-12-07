local mode = require("config.components.mode")
local oil = require("config.components.oil")
local files = require("config.components.files")
local layout = require("config.components.layout")

local statusline = {
	mode,
	oil,
	layout.Space,
	files.Path,
	layout.Space,
	files.Flags,
}

return {
	statusline = statusline,
}
