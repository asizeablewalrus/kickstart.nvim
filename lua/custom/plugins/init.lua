-- See the kickstart.nvim README for more information
return {
  -- Neotree: file navigation
  { import = 'custom.plugins.neotree' },

  -- Lualine: status bar configuration
  { import = 'custom.plugins.lualine' },

  -- Bufferline: tab/bufferline configuration
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      local bufferline = require 'bufferline'
      bufferline.setup {
        options = {
          mode = 'buffers',
          style_preset = bufferline.style_preset.default,
        },
      }
    end,
  },

  { import = 'custom.plugins.dashboard' },
}
