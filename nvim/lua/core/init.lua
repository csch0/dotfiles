require("core.keymaps")
require("core.settings")

if vim.g.vscode then
	require("core.keymaps_vscode")
else
	require("core.options")
end
