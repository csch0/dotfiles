vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
	{ src = "https://github.com/CopilotC-Nvim/CopilotChat.nvim" },
})

require("copilot").setup()
require("CopilotChat").setup({
	headers = {
		user = "👤",
		assistant = "🤖",
		tool = "🔧 Tool",
	},
})

vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChatToggle<cr>", { desc = "CopilotChat Toggle" })
vim.keymap.set("v", "<leader>ce", "<cmd>CopilotChatExplain<cr>", { desc = "CopilotChat Explain selection" })
vim.keymap.set("v", "<leader>cr", "<cmd>CopilotChatReview<cr>", { desc = "CopilotChat Review selection" })
vim.keymap.set("n", "<leader>cf", "<cmd>CopilotChatFix<cr>", { desc = "CopilotChat Fix diagnostic" })

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "copilot-*",
	callback = function()
		vim.opt_local.relativenumber = false
		vim.opt_local.number = false
		vim.opt_local.conceallevel = 0
	end,
})
