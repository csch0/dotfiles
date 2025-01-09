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
		float = {
			max_width = 0.8,
			max_height = 0.85,
			row = 0.35,
			col = 0.5,
			border = "rounded",
			win_options = {
				winhl = "Normal:Normal,FloatBorder:Normal",
			},
		},
		preview = {
			win_options = {
				winhl = "Normal:Normal,Float:Float",
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
