return {
	{ "MunifTanjim/nui.nvim", lazy = true },
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-tree/nvim-web-devicons" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependecies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			hide_root_node = true,
			window = {
				position = "left",
			},
		},
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Neotree" } },
		},
	},
}
