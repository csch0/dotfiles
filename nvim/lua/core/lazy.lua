-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

---@type LazySpec
local spec = {
	{
		import = "plugins",
		cond = function()
			return not vim.g.vscode
		end,
	},
	{
		import = "plugins_vscode",
		cond = function()
			return vim.g.vscode
		end,
	},
}

require("lazy").setup(spec, {
	checker = { enabled = false },
	change_detection = { notify = false },
	dev = {
		path = "~/repos/csch0",
		patterns = { "csch0/bbfm.nvim" },
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = { buffer = event.buf }
		local keymap = vim.keymap

		keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	end,
})
