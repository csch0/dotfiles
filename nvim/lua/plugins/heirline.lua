return {
	{
		"rebelot/heirline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "UiEnter",
		config = function()
			local config = require("config.heirline")
			require("heirline").setup(config)
		end,
	},
}
