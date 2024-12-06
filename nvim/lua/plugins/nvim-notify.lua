return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		require("notify").setup({
			render = "compact",
			stages = "no_animation",
			top_down = false,
		})
		-- vim.notify = require("notify")
	end,
}
