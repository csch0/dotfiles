return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						runtime = {
							path = {
								"lua/?.lua",
								"lua/?/init.lua",
							},
							version = "LuaJIT",
						},
						telemetry = { enable = false },
						workspace = {
							checkThirdParty = false,
							library = {
								"${3rd}/luv/library",
								unpack(vim.api.nvim_get_runtime_file("", true)),
							},
						},
					},
				},
			},
			cssls = {},
			html = {},
			svelte = {},
			tailwindcss = {},
			ts_ls = {},
			--
			pyright = {},
			ruff = {},
			--
			dockerls = {},
			docker_compose_language_service = {},
		},
	},
	config = function(_, opts)
		for server, config in pairs(opts.servers) do
			vim.lsp.config(server, config)
			vim.lsp.enable(server)
		end
	end,
}
