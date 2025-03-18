local colors = require("catppuccin.palettes.macchiato")

local Count = {
	condition = function()
		return vim.v.hlsearch ~= 0
	end,
	init = function(self)
		local ok, search = pcall(vim.fn.searchcount)
		if ok and search.total then
			self.search = search
		end
	end,
	provider = function(self)
		local search = self.search
		return string.format("[%d/%d]", search.current, math.min(search.total, search.maxcount))
	end,
	hl = function()
		return { fg = colors.mantle, bg = colors.yellow }
	end,
}

return Count
