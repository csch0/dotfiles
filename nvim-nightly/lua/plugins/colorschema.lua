vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})
require("catppuccin").setup({
	flavour = "macchiato",
	integrations = {
		aerial = true,
		blink_cmp = true,
		fzf = true,
		harpoon = true,
		snacks = true,
		treesitter = true,
		treesitter_context = true,
		mason = true,
		neotree = true,
		which_key = true,
	},
})
vim.cmd.colorscheme("catppuccin-macchiato")
