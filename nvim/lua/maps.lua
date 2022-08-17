local keymap = vim.keymap

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

keymap.set('n', '<C-p>', ':lua require("telescope.builtin").find_files()<cr>')
keymap.set('n', '<C-/>', ':lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>')
vim.g.mapleader = ' '
