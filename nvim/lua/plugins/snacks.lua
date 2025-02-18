-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(args)
-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
-- 		print(vim.inspect(client))
-- 		vim.notify(client.name .. " attached")
-- 	end,
-- })
--
return {
	"folke/snacks.nvim",
	opts = {
		explorer = {
			replace_netrw = true,
		},
		picker = {},
		-- 	dashboard = {
		-- 		preset = {
		-- 			---@type snacks.dashboard.Item[]
		-- 			keys = {
		-- 				{ icon = " ", key = "f", desc = "Find File", action = "<leader>ff" },
		-- 				{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
		-- 				{
		-- 					icon = " ",
		-- 					key = "r",
		-- 					desc = "Recent Files",
		-- 					action = "<leader>fr",
		-- 				},
		-- 				{
		-- 					icon = " ",
		-- 					key = "p",
		-- 					desc = "Recent Projects",
		-- 					action = "<leader>fp",
		-- 				},
		-- 				{
		-- 					icon = " ",
		-- 					key = "c",
		-- 					desc = "Config",
		-- 					action = "<leader>fc",
		-- 				},
		-- 				{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
		-- 				{ icon = "󰏗 ", key = "m", desc = "Mason", action = ":Mason" },
		-- 				{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
		-- 			},
		-- 		},
		-- 		sections = {
		-- 			{ section = "header" },
		-- 			{ section = "keys", padding = 1, gap = 1 },
		-- 			{ section = "startup" },
		-- 		},
		-- 	},
		notifier = {},
	},
}
