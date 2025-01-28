return {
	{
		"echasnovski/mini.pairs",
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.files",
		version = false,
		opts = {
			windows = {
				width = 0.8,
				height = 0.85,
				--
				width_focus = 100,
				width_nofocus = 25,
				--
				max_number = 3,
				--
				preview = true,
			},
		},
		config = function(_, opts)
			local files = require("mini.files")
			files.setup(opts)

			local keymap = vim.keymap
			keymap.set("n", "_", files.open, { desc = "Open mini.files" })

			vim.api.nvim_set_hl(0, "MiniFilesNormal", { link = "Normal" })

			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniFilesWindowOpen",
				callback = function(args)
					local win_id = args.data.win_id
					local config = vim.api.nvim_win_get_config(win_id)

					-- change border and title_pos
					config.border = "rounded"
					config.title_pos = "center"

					vim.api.nvim_win_set_config(win_id, config)
				end,
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniFilesWindowUpdate",
				callback = function(args)
					local win_id = args.data.win_id
					local config = vim.api.nvim_win_get_config(win_id)

					-- add space before and after name
					local title = config.title[1]
					table.insert(config.title, { " ", title[2] })
					table.insert(config.title, 1, { " ", title[2] })

					vim.api.nvim_win_set_config(args.data.win_id, config)
				end,
			})
		end,
	},
}
