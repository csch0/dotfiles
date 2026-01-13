local colors = require("catppuccin.palettes.macchiato")

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local Active = {
	condition = conditions.lsp_attached,
	update = { "LspAttach", "LspDetach" },
	init = function(self)
		self.names = {}
	end,
	on_click = {
		callback = function(self)
			vim.notify(table.concat(self.names, ","))
		end,
		name = "LSPInfo",
	},
	provider = function(self)
		self.names = {}
		for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
			table.insert(self.names, server.name)
		end
		return " " .. #self.names
	end,
	hl = { fg = colors.blue, bg = colors.mantle, bold = true },
}

return { Active }
