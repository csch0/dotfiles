return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function(_, opts)
		local harpoon = require("harpoon")
		harpoon.setup(opts)

		local keymap = vim.keymap

		keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Open harpoon window" })

		keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "Add file to list" })

		keymap.set("n", "<leader>hx", function()
			harpoon:list():remove()
		end, { desc = "Remove file from list" })

		for i = 1, 5 do
			keymap.set("n", "<leader>" .. i, function()
				harpoon:list():select(i)
			end, { silent = true, desc = "which_key_ignore" })
		end
	end,
}
