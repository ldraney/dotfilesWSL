vim.g.mapleader = " "
--mapleader = vim.g.mapleader

vim.keymap.set("n", "<Leader>E", vim.cmd.Ex)
vim.keymap.set('n', "<Leader>to", function() require('telescope.builtin').oldfiles() end)
