return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v3.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
		'MunifTanjim/nui.nvim',
	},
	lazy = false, -- neo-tree will lazily load itself
	---@module "neo-tree"
	---@type neotree.Config?
	keys = {
		{ '<C-n>', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
	},
	opts = {
		filesystem = {
			reveal_force_cwd = true,
			window = {
				mappings = {
					['<C-n>'] = 'close_window',
				},
			},
		},
	},
}
