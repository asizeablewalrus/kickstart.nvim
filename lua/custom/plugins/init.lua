-- See the kickstart.nvim README for more information
return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- Optional image support for file preview: See `# Preview Mode` for more information.
      -- {"3rd/image.nvim", opts = {}},
      -- OR use snacks.nvim's image module:
      -- "folke/snacks.nvim",
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    keys = {
      { 'n', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    },
    opts = {
      filesystem = {
        window = {
          mappings = {
            ['n'] = 'close_window',
            -- ['<CR>'] = 'open_tabnew',
            -- ['t'] = 'open',
          },
        },
      },
    },
  },

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
          mode = 'tabs',
          style_preset = bufferline.style_preset.default,
        },
      }
    end,
  },
}
