vim.pack.add({
	{ src = "https://github.com/rebelot/heirline.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

local config = require("config_heirline.heirline")
require("heirline").setup(config)
