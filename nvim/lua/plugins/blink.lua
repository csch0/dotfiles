return {
	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		version = "v0.*",
		dependencies = { "fang2hou/blink-copilot" },
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
				-- ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				-- ["<Tab>"] = { "select_and_accept", "fallback" },
				-- ["<C-k>"] = { "select_prev", "fallback" },
				-- ["<C-j>"] = { "select_next", "fallback" },
			},
			cmdline = {
				sources = function()
					local type = vim.fn.getcmdtype()
					if type == "/" or type == "?" then
						return { "buffer" }
					end
					if type == ":" or type == "@" then
						if vim.fn.getcmdline():match("e\\s") then
							return { "path" }
						else
							return { "cmdline" }
						end
					end
					return {}
				end,
				completion = {
					menu = { auto_show = true },
				},
			},
			sources = {
				default = { "lsp", "path", "buffer", "copilot" },
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-copilot",
						score_offset = 100,
						async = true,
					},
				},
			},
			signature = {
				enabled = true,
			},
		},
	},
}
