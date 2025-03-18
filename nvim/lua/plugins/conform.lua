return {
	"stevearc/conform.nvim",
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			bzl = { "buildifier" },
			lua = { "stylua" },
			javascript = { "prettier" },
			markdown = { "prettier" },
			json = { lsp_format = "fallback" },
			python = { "ruff_format", "ruff_organize_imports" },
			typescript = { "prettier" },
			svelte = { lsp_format = "fallback" },
		},
		format_on_save = {
			timeout_ms = 500,
		},
	},
}
