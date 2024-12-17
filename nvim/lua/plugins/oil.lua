return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		oil.setup({
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = false,
			columns = { "icon", "permissions", "size", "mtime" },
			watch_for_changes = true,
			keymaps = {
				["q"] = "actions.close",
			},
			view_options = {
				show_hidden = true,
			},
		})
		local keymap = vim.keymap
		keymap.set("n", "-", oil.open, { desc = "Open Oil" })
	end,
}
