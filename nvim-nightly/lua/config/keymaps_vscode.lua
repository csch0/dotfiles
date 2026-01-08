local keymap = vim.keymap

keymap.set({ "n", "v" }, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap.set({ "n", "v" }, "<leader>fd", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")
keymap.set({ "n", "v" }, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")

keymap.set("n", "ga", "<Cmd>lua require('vscode').call('editor.action.quickFix')<CR>")
keymap.set("n", "gi", "<Cmd>lua require('vscode').call('editor.action.goToImplementation')<CR>")
keymap.set("n", "gl", "<Cmd>lua require('vscode').call('editor.action.marker.next')<CR>")
keymap.set("n", "go", "<Cmd>lua require('vscode').call('editor.action.peekTypeDefinition')<CR>")
keymap.set("n", "gr", "<Cmd>lua require('vscode').call('editor.action.goToReferences')<CR>")
keymap.set("n", "gs", "<Cmd>lua require('vscode').call('editor.action.triggerParameterHints')<CR>")
