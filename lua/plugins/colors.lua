return {

	{
		'folke/tokyonight.nvim',
		priority = 1000,
		styles = {
			comments = { italics = true },
		},
	},
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		priority = 1000,
		flavour = 'auto',
		auto_integrations = true,
		show_end_of_buffer = true,
	},
	{
		'navarasu/onedark.nvim',
		priority = 1000,
		config = function()
			require('onedark').setup {
				style = 'dark',
				ending_tildes = true,
			}
		end,
	},
}
