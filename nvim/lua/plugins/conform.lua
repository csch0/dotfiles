return {
	"stevearc/conform.nvim",
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff" },
		},
		format_on_save = {
			timeout_ms = 500,
		},
	},
}
