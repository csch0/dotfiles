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
							{ "kind_icon" },
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
				cmdline = { "path" },
			},
		},
	},
}
