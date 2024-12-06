local mode = require("config.components.mode")
local files = require("config.components.files")
local layout = require("config.components.layout")

local statusline = {
	mode,
	layout.Space,
	files.Path,
	layout.Space,
	files.Flags,
}

return {
	statusline = statusline,
}
