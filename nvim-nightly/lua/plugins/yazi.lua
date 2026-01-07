local colors = require("catppuccin.palettes.macchiato")

vim.pack.add({
  { src = "https://github.com/mikavilpas/yazi.nvim" },
  { src = "http://github.com/nvim-lua/plenary.nvim" }
})

require("yazi").setup({
		keymaps = {
			open_file_in_vertical_split = "<c-s>",
			change_working_directory = "~",
			cycle_open_buffers = false,
		},
		open_for_directories = true,
		highlight_groups = {
			hovered_buffer = { bg = colors.base },
		},
		floating_window_scaling_factor = 0.85,
		-- highlight_hovered_buffers_in_same_directory = false,
		integrations = {
			grep_in_directory = "fzf-lua",
			grep_in_selected_files = "fzf-lua",
			replace_in_directory = nil,
			replace_in_selected_files = nil,
		},
		hooks = {
			yazi_opened_multiple_files = require("yazi.openers").send_files_to_quickfix_list,
		},
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set({"n", "v"}, "-", "<cmd>Yazi<cr>", { desc = "Open yazi at the current file" })
