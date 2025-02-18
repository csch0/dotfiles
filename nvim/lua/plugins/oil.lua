return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		default_file_explorer = false,
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		constrain_cursor = "name",
		columns = { "icon", "permissions", "size", "mtime" },
		watch_for_changes = true,
		keymaps = {
			["q"] = "actions.close",
		},
		float = {
			max_width = 0.8,
			max_height = 0.85,
			row = 0.35,
			col = 0.5,
			border = "rounded",
			title = " %s ",
			title_pos = "center",
			win_options = {
				winhl = "NormalFloat:Normal,FloatTitle:FloatBorder",
			},
		},
		preview_win = {
			title = "",
			title_pos = "center",
			win_options = {
				winhl = "NormalFloat:Normal,FloatTitle:FloatBorder",
			},
		},
		view_options = {
			show_hidden = true,
			is_always_hidden = function(name, _)
				return name == ".." or name == ".git"
			end,
		},
	},
	keys = {
		{ "-", "<cmd>Oil --float<CR>", desc = "Open Oil" },
	},
}
