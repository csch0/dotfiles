require("config.keymaps")
require("config.lsp")
require("config.options")

require("plugins/blink")
require("plugins/conform")
require("plugins/colorschema")
require("plugins/fzf")
require("plugins/lsp")
require("plugins/nvim-notify")
require("plugins/nvim-treesitter")
require("plugins/heirline")
require("plugins/which-key")
require("plugins/yazi")

vim.filetype.add({
	pattern = {
		["compose.*%.ya?ml"] = "yaml.docker-compose",
		["docker%-compose.*%.ya?ml"] = "yaml.docker-compose",
	},
})
