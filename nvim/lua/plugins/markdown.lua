vim.pack.add({
	"https://github.com/selimacerbas/markdown-preview.nvim",
	"https://github.com/selimacerbas/live-server.nvim",
})

require("markdown_preview").setup({
	port = 5000,
	-- browser = "chrome",
	open_browser = false,
})
