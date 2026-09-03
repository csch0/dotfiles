vim.pack.add({
	{ src = "https://github.com/rcarriga/nvim-notify", name = "notify" },
})

require("notify").setup({
	render = "compact",
	stages = "no_animation",
	top_down = false,
})

vim.notify = require("notify")
