return {
	"stevearc/oil.nvim",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		local oil = require("oil")
		oil.setup({
			default_file_explorer = true,
			delete_to_trash = true,
			columns = { "icon", "permissions", "size", "mtime" },
			watch_for_changes = true,
			keymaps = {
				["q"] = "actions.close",
			},
		})

		local keymap = vim.keymap
		keymap.set("n", "-", oil.open, { desc = "Open Oil" })
	end,
}
