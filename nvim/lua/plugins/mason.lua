return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ruff",
					"pyright",
					"cssls",
					"html",
					"rust_analyzer",
					---
					"dockerls",
					"docker_compose_language_service",
				},
				handlers = {
					function(server_name)
						local capabilities = require("cmp_nvim_lsp").default_capabilities()
						require("lspconfig")[server_name].setup({ capabilities = capabilities })
					end,
					["lua_ls"] = function()
						require("lspconfig").lua_ls.setup({
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
											vim.env.VIMRUNTIME,
											vim.fn.expand("~/.local/share/nvim/lazy/"),
										},
									},
								},
							},
						})
					end,
				},
			})
		end,
	},
}
