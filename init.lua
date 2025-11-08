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

-- Enable filetype-only options (see ./ftplugin/)
vim.cmd 'filetype plugin on'

-- Set colorscheme
vim.cmd.colorscheme 'tokyonight-moon'
