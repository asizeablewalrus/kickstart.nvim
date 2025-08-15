return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      hide = {
        statusline = false,
        tabline = false,
        winbar = false,
      },
      shortcut_type = 'number',
      config = {
        shortcut = {},
        header = { '' },
        packages = { enabled = false },
        project = { enabled = true, limit = 3 },
        mru = { enabled = true, limit = 5 },
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
