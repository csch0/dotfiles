vim.pack.add({
	{ src = "https://github.com/Saghen/blink.cmp", version = "v1.8.0" },
})

require("blink.cmp").setup({
	keymap = { preset = "default" },
	cmdline = {
		sources = function()
			local type = vim.fn.getcmdtype()
			if type == "/" or type == "?" then
				return { "buffer" }
			end
			if type == ":" or type == "@" then
				-- if vim.fn.getcmdline():match("e\\s") then
				-- 	return { "path" }
				if vim.fn.getcmdline():match("l\\s") then
					return { "buffer", "path" }
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
	completion = {
		documentation = {
			auto_show = true,
		},
		menu = {
			draw = {
				columns = {
					{ "label", "label_description", gap = 1 },
					{ "kind" },
				},
			},
		},
	},
	sources = {
		default = { "lsp", "path", "buffer", "snippets" },
	},
})
