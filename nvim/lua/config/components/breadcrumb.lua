local colors = require("catppuccin.palettes.macchiato")

---@param data aerial.SymbolView[]
local function children(data)
	local ll = {}
	for i, symbol in ipairs(data) do
		table.insert(ll, {
			provider = symbol.icon .. symbol.name,
			hl = { fg = colors.sky, bg = colors.mantle },
		})
		if i < #data then
			table.insert(ll, {
				provider = " ",
			})
		end
	end
	return ll
end

local Breadcrumbs = {
	init = function(self)
		self.data = require("aerial").get_location(true)
		self[1] = self:new(children(self.data), 1)
	end,
}

return Breadcrumbs
