-- See the kickstart.nvim README for more information
return {

  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = { library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } }, },
    },
  },

	-- NOTE: HIGH PRIORITY PLUGINS
  { import = 'plugins.whichkey' },
  { import = 'plugins.telescope' },
  { import = 'plugins.lsp' },
  { import = 'plugins.autocomplete' },
  { import = 'plugins.colors' },
  { import = 'plugins.gitsigns' },
  { import = 'plugins.mini' },
  { import = 'plugins.treesitter' },

	-- NOTE: OTHER
  { import = 'plugins.autopairs' },

  { import = 'plugins.neotree' }, -- Neotree: file navigation

  { import = 'plugins.lualine' }, -- Lualine: status bar configuration

  { import = 'plugins.bufferline' }, -- Bufferline: tab/bufferline configuration

  { import = 'plugins.dashboard' },

  { import = 'plugins.etc' }, -- Items that dont need their own file
}
