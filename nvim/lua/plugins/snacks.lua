return {
	"folke/snacks.nvim",
	---@type snacks.dashboard.Config
	opts = {
		dashboard = {
			preset = {
				---@type snacks.dashboard.Item[]
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = "<leader>ff" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = "<leader>fr",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = "<leader>fc",
					},
					{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
					{ icon = "󰏗 ", key = "m", desc = "Mason", action = ":Mason" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
		notifier = {},
	},
}
