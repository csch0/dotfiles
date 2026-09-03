vim.lsp.config("lua_ls", {
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
})
vim.lsp.enable("lua_ls")

-- web
vim.lsp.enable("cssls")
vim.lsp.enable("html")

-- svelte
vim.lsp.enable("svelte")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("ts_ls")

-- python
vim.lsp.enable("ruff")
vim.lsp.enable("pyright")

-- docker
vim.lsp.enable("docker_language_server")
vim.lsp.enable("docker_compose_language_service")

-- general
vim.lsp.enable("bashls")
vim.lsp.enable("harper_ls")

vim.diagnostic.config({
	virtual_lines = {
		current_line = true,
	},
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
})
