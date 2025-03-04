local fzf_oldprojects = function(opts)
	local fzf_lua = require("fzf-lua")
	local fzf_lua_path = require("fzf-lua.path")
	opts = opts or {}
	opts.prompt = "> "
	opts.winopts = {
		title = " OldProjects ",
		title_pos = "center",
		preview = {
			hidden = true,
		},
	}
	opts.fzf_opts = {
		["--preview"] = "ls {}",
		["--preview-window"] = "nohidden,50%",
	}
	opts.actions = {
		["default"] = function(selected)
			local dir = selected[1]
			vim.notify("CWD: " .. dir)
			vim.cmd("cd " .. dir)
		end,
	}

	local dirs = { vim.fn.expand("~") }
	local snacks = require("snacks")

	for file in snacks.dashboard.oldfiles({}) do
		local dir = snacks.git.get_root(file)
		if dir and not vim.tbl_contains(dirs, dir) then
			table.insert(dirs, dir)
		end
	end

	fzf_lua.fzf_exec(dirs, opts)
end

return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			winopts = {
				backdrop = 100,
				preview = {
					scrollbar = false,
					title = false,
				},
			},
			files = {
				cwd_prompt = false,
			},
		},
		keys = {
			{
				"<leader>fp",
				function()
					fzf_oldprojects({})
				end,
				desc = "Projects",
			},
			{ "<leader>fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
			{ "<leader>fd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Diagnostics" },
			{ "<leader>fD", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Diagnostics (Workspace)" },
			{
				"<leader>fc",
				function()
					require("fzf-lua").files({
						cwd = vim.fn.stdpath("config"),
						prompt = "Config> ",
						no_header = true,
					})
				end,
				desc = "Config Files",
			},
			{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Files" },
			{ "<leader>fh", "<cmd>FzfLua helptags<cr>", desc = "Help" },
			{
				"<leader>fg",
				function()
					require("fzf-lua").live_grep({ prompt = "Text> " })
				end,
				desc = "Text",
			},
			{ "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },

			{
				"<leader>f.",
				function()
					require("fzf-lua").files({ cwd = "~/dotfiles/", prompt = "Dotfiles> ", no_header = true })
				end,
				desc = "Dotfiles",
			},
			{ "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files" },
			{ "<leader>ft", "<cmd>FzfLua treesitter<cr>", desc = "Treesitter" },
		},
	},
}
