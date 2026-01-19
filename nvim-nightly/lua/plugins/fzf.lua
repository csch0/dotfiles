vim.pack.add({
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

require("fzf-lua").setup({
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
	ui_select = true,
})

vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Files" })
vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua helptags<cr>", { desc = "Neovim Help" })
vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", { desc = "Old Files" })

vim.keymap.set({ "n", "v", "i" }, "<C-x><C-f>", function()
	FzfLua.complete_path()
end, { silent = true })

vim.keymap.set("n", "<leader>f.", function()
	require("fzf-lua").files({ cwd = "~/dotfiles/", prompt = "Dotfiles> ", no_header = true })
end, { desc = "Dotfiles" })
