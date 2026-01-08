local M = {}

M.Align = {
	provider = function()
		return "%="
	end,
}

M.Space = {
	provider = function()
		return " "
	end,
}

return M
