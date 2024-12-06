vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

local keymap = vim.keymap

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("v", "<", "<gv", { noremap = true, silent = true })
keymap.set("v", ">", ">gv", { noremap = true, silent = true })

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set({ "n", "i" }, "<C-s>", "<cmd>w<CR>")

-- window management
keymap.set("n", "<leader>s|", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>s-", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew | lua Snacks.dashboard.open()<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- buffers
keymap.set("n", "<a-x>", "<cmd>bd<CR>")
keymap.set("n", "<a-j>", "<cmd>bp<CR>")
keymap.set("n", "<a-k>", "<cmd>bn<CR>")

keymap.set("n", "<leader>bb", "<cmd>Telescope buffers sort_mru=true<cr>", { desc = "Buffers" })
keymap.set("n", "<leader>bx", "<cmd>bdelete<cr>", { desc = "Close" })
keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next Buffer" })

keymap.set("n", "<leader>r", "<cmd>Lazy reload heirline.nvim<cr>", { desc = "Reload Plugin" })

keymap.set({ "n", "v" }, "<leader>y", '"+y')
keymap.set({ "n", "v" }, "<leader>Y", '"+Y')

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

---@param status boolean
---@param title string
local function notify(status, title)
	if status then
		vim.notify("Toggled On", vim.log.levels.INFO, { title = title })
	else
		vim.notify("Toggled Off", vim.log.levels.INFO, { title = title })
	end
end

keymap.set("n", "<leader>ol", function()
	vim.o.number = not vim.o.number
	notify(vim.o.number, "Line Number")
end, { desc = "Options | Toggle Line Number", silent = true })

keymap.set("n", "<leader>or", function()
	vim.o.relativenumber = not vim.o.relativenumber
	if vim.o.relativenumber then
		vim.notify("Toggled On", vim.log.levels.INFO, { title = "Relative Number" })
	else
		vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Relative Number" })
	end
end, { desc = "Options | Toggle Relative Number", silent = true })

-- Toggle Wrap
keymap.set("n", "<leader>ow", function()
	vim.wo.wrap = not vim.wo.wrap
	if vim.wo.wrap then
		vim.notify("Toggled On", vim.log.levels.INFO, { title = "Line Wrap" })
	else
		vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Line Wrap" })
	end
end, { desc = "Options | Toggle Wrap", silent = true })
