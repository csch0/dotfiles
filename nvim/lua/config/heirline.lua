local conditions = require("heirline.conditions")

local mode = require("config.components.mode")
local file = require("config.components.file")
local layout = require("config.components.layout")
local lsp = require("config.components.lsp")
local breadcrumbs = require("config.components.breadcrumb")

local oil = require("config.components.oil")
local neotree = require("config.components.neotree")

local Encoding = {
	provider = function()
		local s = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
		return s:upper()
		-- return s ~= "utf-8" and s:upper()
	end,
}

local SearchCount = {
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
}

local DefaultStatusLine = {
	mode,
	layout.Space,
	file,
	layout.Space,
	breadcrumbs,
	layout.Align,
	lsp,
	layout.Space,
	Encoding,
	SearchCount,
}

local statusline = {
	fallthrough = false,
	oil,
	neotree,
	DefaultStatusLine,
}

return {
	statusline = statusline,
}
