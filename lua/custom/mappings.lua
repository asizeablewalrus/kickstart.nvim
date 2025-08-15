local map = vim.keymap.set

-- Buffer
map('n', 'E', ':bnext<CR>', { silent = true, desc = 'Next buffer' })
map('n', 'Q', ':bprevious<CR>', { silent = true, desc = 'Previous buffer' })
map('n', '<Leader>x', ':bdelete<CR>', { desc = 'Close buffer' })

-- Terminal
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

map('n', '<Leader>z', function() -- Create horizontal terminal
  vim.cmd 'belowright.split'
  vim.cmd 'resize 8'
  vim.cmd 'terminal'
  local termwindow = vim.api.nvim_get_current_buf()
  vim.api.nvim_create_autocmd('TermClose', { buffer = termwindow, command = 'close' })
end, { silent = true, desc = 'Open Terminal' })

-- Editor/Editing
map('n', '<M-S-j>', ':m-2|join<CR>', { silent = true, desc = 'Join Above' })

map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Code
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- General
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
