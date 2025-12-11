local autocmd = vim.api.nvim_create_autocmd
local savedata = require 'local.savedata'

-- Highlight when yanking (copying) text
autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end
})

-- Close savedata and flush when nvim exits
vim.api.nvim_create_autocmd('VimLeavePre', {
	desc = 'Flush savedata when leaving nvim',
	callback = function()
		savedata.commit()
		savedata.json = nil
		savedata.tb = nil
	end,
})

-- Update save data when the colorscheme is changed
autocmd('ColorScheme', {
	desc = 'Update savedata when colorscheme changes',
	callback = function()
		savedata.set('colorscheme', vim.g.colors_name)
	end
})
