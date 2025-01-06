return {
	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		version = "v0.*",
		--- @module "blink.cmp"
		--- @type blink.cmp.Config
		opts = {
			completion = {
				menu = {
					draw = {
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind" },
						},
					},
				},
			},
			keymap = {
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<Tab>"] = { "accept", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
			},
			sources = {
				default = { "lsp", "path", "buffer" },
				cmdline = function()
					local type = vim.fn.getcmdtype()
					if type == "/" or type == "?" then
						return { "buffer" }
					end
					if type == ":" or type == "@" then
						return { "cmdline", "path" }
					end
					return {}
				end,
			},
		},
	},
}
