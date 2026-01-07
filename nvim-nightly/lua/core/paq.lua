local paqpath = vim.fn.stdpath("data") .. "/savq/paq-nvim"
if not vim.uv.fs_stat(paqpath) then
	vim.fn.system({
		"git",
		"clone",
		"--depth=1",
		"--branch=master",
		"https://github.com/savq/paq-nvim.git",
		paqpath,
	})
end
vim.opt.rtp:prepend(paqpath)

require("paq")({
	"echasnovski/mini.files",
})

require("mini.files").setup()
