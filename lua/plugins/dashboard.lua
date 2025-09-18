return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      hide = {
        statusline = false,
        tabline = false,
        winbar = false,
      },
      shortcut_type = 'number',
      config = {
        header = { '' },
        center = {
          {
            desc = 'Config',
            key = '1',
            action = 'cd .config/nvim | Neotree reveal float',
          },
          {
            desc = 'Mecodeme',
            key = '2',
            action = 'cd dev/mecodeme | Neotree reveal float',
          },
          {
            desc = 'Search',
            key = '0',
            action = 'Neotree reveal float',
          },
        },
        vertical_center = true,
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
