return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
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
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        style = 'dark',
        ending_tildes = true,
      }
    end,
  },
}
