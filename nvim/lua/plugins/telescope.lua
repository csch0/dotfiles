return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				file_ignore_patterns = { "%.git/." },
				defaults = {
					file_ignore_patterns = { "node_modules", "package-lock.json" },
					prompt_prefix = "   ",
					selection_caret = " ",
					entry_prefix = " ",
					results_title = "",
					preview_title = "",
					sorting_strategy = "ascending",
					layout_config = {
						prompt_position = "top",
						preview_cutoff = 120,
						height = 0.5,
						width = 0.8,
					},
					mappings = {
						n = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
						},
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
						},
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
				pickers = {
					buffers = {
						mappings = {
							i = {
								["<C-x>"] = actions.delete_buffer,
							},
						},
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("harpoon")

			local keymap = vim.keymap

			-- general
			keymap.set("n", "<leader>fb", "<cmd>Telescope buffers sort_mru=true<cr>", { desc = "Buffers" })
			keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
			keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help" })
			keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
			keymap.set("n", "<leader>fc", function()
				require("telescope.builtin").find_files({
					cwd = vim.fn.stdpath("config"),
					prompt_title = "Config files",
				})
			end, { desc = "Config" })

			--- files
			keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Files in cwd" })
			keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })

			keymap.set("n", "<leader>ft", "<cmd>Telescope treesitter<cr>", { desc = "Treesitter" })

			--- strings
			keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "String in cwd" })
			-- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find current string in cwd" })
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
}
