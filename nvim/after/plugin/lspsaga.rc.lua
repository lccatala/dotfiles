local saga = require 'lspsaga'


-- use default config
saga.init_lsp_saga()

local opts = {noremap = true, silent = true}
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
vim.keymap.set('n', '<C-k>', '<Cmd>Lspsaga signature_help<cr>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<cr>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<cr>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<cr>', opts)