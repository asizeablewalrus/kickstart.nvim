return {
  { -- You can easily change to a different colorscheme.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    styles = {
      comments = {
        italics = true,
      },
    },
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
  },
}
