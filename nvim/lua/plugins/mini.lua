return {
	{
		"echasnovski/mini.files",
		version = false,
		opts = {},
		init = function(_, opts)
			local files = require("mini.files")
			files.setup(opts)
			local keymap = vim.keymap
			keymap.set("n", "_", files.open, { desc = "Open Oil" })
		end,
	},
}
