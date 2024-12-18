local colors = require("catppuccin.palettes.macchiato")

local utils = require("heirline.utils")

local function line_diagnostic()
	local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
	local diagnostics = vim.diagnostic.get(0, { lnum = lnum })
	-- filter diagnostic for the current line only
	for _, diagnostic in pairs(diagnostics) do
		if diagnostic.lnum == lnum then
			return diagnostic
		end
	end
end

local Diagnostics = {
	static = {
		colors = {
			[vim.diagnostic.severity.ERROR] = utils.get_highlight("DiagnosticError").fg,
			[vim.diagnostic.severity.WARN] = utils.get_highlight("DiagnosticWarn").fg,
			[vim.diagnostic.severity.INFO] = utils.get_highlight("DiagnosticInfo").fg,
			[vim.diagnostic.severity.HINT] = utils.get_highlight("DiagnosticHint").fg,
		},
		icons = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
	init = function(self)
		self.diagnostic = line_diagnostic()
	end,
	condition = function()
		return line_diagnostic()
	end,
	flexible = 1,
	{
		provider = function(self)
			return self.icons[self.diagnostic.severity] .. " " .. self.diagnostic.message
		end,
	},
	{
		provider = function(self)
			return self.icons[self.diagnostic.severity] .. " " .. string.sub(self.diagnostic.message, 1, 50) .. "..."
		end,
	},
	{
		provider = function(self)
			return self.icons[self.diagnostic.severity] .. " " .. string.sub(self.diagnostic.message, 1, 25) .. "..."
		end,
	},
	hl = function(self)
		return { fg = self.colors[self.diagnostic.severity], bg = colors.mantle }
	end,
}

return Diagnostics
