-- Set log level to 'INFO'
vim.lsp.log.set_level(1)

require 'options'
require 'autocommand'
require 'commands'

-- Local libraries
local refactor = require 'local.refactor'
local savedata = require 'local.savedata'

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
	import = 'plugins.inc',

	-- Ensure nerd icons are used
	ui = { icons = vim.g.have_nerd_font and {} },
}

-- Set mappings
require 'mappings'

-- Enable filetype-only options (see ./ftplugin/)
vim.cmd 'filetype plugin on'

-- Set colorscheme
vim.g.colors_name = savedata.get 'colorscheme'
vim.cmd.colorscheme(savedata.get 'colorscheme')
