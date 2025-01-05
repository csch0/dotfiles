return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			winopts = {
				backdrop = 100,
				preview = {
					scrollbar = false,
					title = false,
				},
			},
			files = {
				cwd_prompt = false,
			},
		},
		keys = {
			{ "<leader>fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
			{ "<leader>fd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Diagnostics" },
			{
				"<leader>fc",
				function()
					require("fzf-lua").files({ cwd = vim.fn.stdpath("config"), prompt = "Config> ", no_header = true })
				end,
				desc = "Config Files",
			},
			{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Files" },
			{ "<leader>fh", "<cmd>FzfLua helptags<cr>", desc = "Help" },
			{
				"<leader>fg",
				function()
					require("fzf-lua").live_grep({ prompt = "Text> " })
				end,
				desc = "Text",
			},
			{ "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },

			{
				"<leader>f.",
				function()
					require("fzf-lua").files({ cwd = "~/dotfiles/", prompt = "Dotfiles> ", no_header = true })
				end,
				desc = "Dotfiles",
			},
			{ "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files" },
			{ "<leader>ft", "<cmd>FzfLua treesitter<cr>", desc = "Treesitter" },
		},
	},
}
