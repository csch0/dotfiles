vim.pack.add({
	"https://github.com/rebelot/heirline.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
})

local config = require("config_heirline.heirline")
require("heirline").setup(config)
