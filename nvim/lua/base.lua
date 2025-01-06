-- vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true
vim.wo.relativenumber = true
-- vim.wo.colorcolumn = '80'
vim.opt.title = true
vim.opt.signcolumn = "yes:2"

vim.opt.autoindent = true
vim.opt.hlsearch = false
vim.opt.backup = false
-- vim.opt.showcmd = true
-- vim.opt.cmdheight = 1
-- vim.opt.laststatus = 2
vim.opt.expandtab = true
-- vim.opt.scrolloff = 10
vim.opt.shell = 'zsh'
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = true
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- Search subfolders when looking for files

-- Undercurl (testing this)
-- vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

vim.api.nvim_create_autocmd('BufWritePost', {
	desc = 'format go on write using gofmt',

	group = vim.api.nvim_create_augroup('gofmt_on_save', { clear = true }),
	callback = function (opts)
		if vim.bo[opts.buf].filetype == 'go' then
			vim.cmd 'silent! !gofmt -w %'
		end
	end,
})
vim.api.nvim_create_autocmd('BufWritePost', {
	desc = 'format python on write using black',

	group = vim.api.nvim_create_augroup('black_on_save', { clear = true }),
	callback = function (opts)
		if vim.bo[opts.buf].filetype == 'python' then
			vim.cmd 'silent! !black %'
            -- print('asdfadsfadf')
		end
	end,
})
-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

vim.opt.cursorline = true
vim.opt.completeopt={"menu", "menuone", "noselect"}

vim.opt.termguicolors = true
-- vim.cmd.colorscheme('tokyonight-moon')
vim.cmd.colorscheme('catppuccin-mocha')
-- vim.cmd.colorscheme('solarized-osaka.nvim')
-- vim.cmd.colorscheme('melange')
-- vim.cmd.colorscheme("hybrid2")
-- vim.cmd.colorscheme('ayu-mirage')
vim.opt.undofile = true
