return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato",
				integrations = {
					treesitter = true,
				},
			})
			vim.cmd([[colorscheme catppuccin-macchiato]])
		end,
	},
}
