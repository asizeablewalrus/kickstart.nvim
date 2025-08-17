-- See the kickstart.nvim README for more information
return {
  { import = 'local.plugins.autopairs' },

  { import = 'local.plugins.neotree' }, -- Neotree: file navigation

  { import = 'local.plugins.lualine' }, -- Lualine: status bar configuration

  { import = 'local.plugins.bufferline' }, -- Bufferline: tab/bufferline configuration

  { import = 'local.plugins.dashboard' },

  { import = 'local.plugins.etc' }, -- Items that dont need their own file
}
