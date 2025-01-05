return {
	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		version = "v0.*",
		--- @module "blink.cmp"
		--- @type blink.cmp.Config
		opts = {
			appearance = {
				nerd_font_variant = "normal",
			},
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
				preset = "enter",
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
