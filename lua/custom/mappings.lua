local map = vim.keymap.set

-- Buffer related keys
map('n', 'E', ':bnext<CR>', { silent = true, desc = 'Next buffer' })
map('n', 'Q', ':bprevious<CR>', { silent = true, desc = 'Previous buffer' })
map('n', '<Leader>x', ':bdelete<CR>', { desc = 'Close buffer' })
map('n', '<Leader>n', ':new<CR>', { desc = 'New buffer' })

-- Terminal related
map('n', '<Leader>z', function() -- Create horizontal terminal
  vim.cmd 'belowright.split'
  vim.cmd 'resize 8'
  vim.cmd 'terminal'

  local termwindow = vim.api.nvim_get_current_buf()
  vim.api.nvim_create_autocmd('TermClose', { -- Close window when terminal ends
    buffer = termwindow,
    command = 'close',
  })
end, { silent = true, desc = 'Open Terminal' })
