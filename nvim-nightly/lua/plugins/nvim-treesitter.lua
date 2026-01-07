vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("nvim-treesitter").setup()

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', "help" },
  callback = function() vim.treesitter.start() end,
})
