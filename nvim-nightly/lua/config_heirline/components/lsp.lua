local colors = require("catppuccin.palettes.macchiato")

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local Active = {
	condition = conditions.lsp_attached,
	update = { "LspAttach", "LspDetach" },
	provider = function()
		local names = {}
		for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
			table.insert(names, server.name)
		end
		return " [" .. table.concat(names, ",") .. "]"
	end,
	hl = { fg = colors.blue, bg = colors.mantle, bold = true },
}

return { Active }
