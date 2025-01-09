return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		default_file_explorer = true,
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		columns = { "icon", "permissions", "size", "mtime" },
		watch_for_changes = true,
		keymaps = {
			["q"] = "actions.close",
		},
		view_options = {
			show_hidden = true,
			is_always_hidden = function(name, _)
				return name == ".." or name == ".git"
			end,
		},
	},
	config = function(_, opts)
		local oil = require("oil")
		oil.setup(opts)
		local keymap = vim.keymap
		keymap.set("n", "-", oil.open, { desc = "Open Oil" })
	end,
}
