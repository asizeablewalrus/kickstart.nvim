return {
	'nvim-tree/nvim-tree.lua',
	version = '*',
	lazy = false,
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		require('nvim-tree').setup {
			sync_root_with_cwd = true,
			renderer = {
				decorators = {
					'Git',
					'Hidden',
					'Modified',
					'Copied',
					'Cut',
				},
				icons = {
					git_placement = 'right_align',
					show = {
						diagnostics = false,
					},
				},
			},
		}
	end,
}
