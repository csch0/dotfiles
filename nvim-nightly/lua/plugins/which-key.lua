vim.pack.add({
	{ src = "https://github.com/folke/which-key.nvim" },
})

require("which-key").setup({
		preset = "modern",
		show_help = false,
		win = {
			width = 0.8,
		},
})

vim.keymap.set("n", "<leader>?", "<cmd>WhichKey<cr>", { desc = "Buffer Local Keymaps (which-key)" })

-- return {
-- 	"folke/which-key.nvim",
-- 	event = "VeryLazy",
-- 	opts = {
-- 	},
-- 	keys = {
-- 		{
-- 			"<leader>?",
-- 			function()
-- 				require("which-key").show({ global = false })
-- 			end,
-- 			desc = "Buffer Local Keymaps (which-key)",
-- 		},
-- 	},
-- }
