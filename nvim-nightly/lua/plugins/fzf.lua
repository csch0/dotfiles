vim.pack.add({
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

local fzf = require("fzf-lua")
fzf.setup({
	winopts = {
		backdrop = 100,
		title_flags = false,
		width = 0.85,
		height = 0.85,
		row = 0.5,
		col = 0.5,
		---@diagnostic disable-next-line: missing-fields
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

vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Files" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", fzf.helptags, { desc = "Neovim Help" })
vim.keymap.set("n", "<leader>fr", fzf.oldfiles, { desc = "Old Files" })
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Text in Files" })

vim.keymap.set("n", "<leader>f.", function()
	fzf.files({ cwd = "~/dotfiles/", winopts = { title = " Dotfiles " } })
end, { desc = "Dotfiles" })

vim.keymap.set({ "n", "v", "i" }, "<C-x><C-f>", fzf.complete_path, { silent = true })
