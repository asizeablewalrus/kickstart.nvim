vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

require 'options'
require 'autocommand'

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
	if vim.v.shell_error ~= 0 then
		error('Error cloning lazy.nvim:\n' .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup {

	-- Entry point for plugin list
	import = 'plugin',

	-- Ensure nerd icons are used
	ui = { icons = vim.g.have_nerd_font and {} },
}

-- Set mappings
require 'mappings'

-- Set colorscheme
vim.cmd.colorscheme 'github_dark_dimmed'

-- Unless a color is specified, they will be dark and hard to read
vim.api.nvim_set_hl(0, '@comment', { fg = '#A6A09B' })
vim.api.nvim_set_hl(0, 'comment', { fg = '#A6A09B' })
