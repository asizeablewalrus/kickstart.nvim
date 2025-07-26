local map = vim.keymap.set

local opts = {
  silent = true,
}
-- Buffer related keys
map('n', 'E', ':bnext<CR>', { silent = true, desc = 'Next buffer' })
map('n', 'Q', ':bprevious<CR>', { silent = true, desc = 'Previous buffer' })
map('n', '<Leader>x', ':bdelete<CR>', { desc = 'Close buffer' })
map('n', '<Leader>n', ':new<CR>', { desc = 'New buffer' })
