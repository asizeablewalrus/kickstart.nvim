local map = vim.keymap.set

--
-- Buffer
--

map('n', 'E', ':bnext<CR>', { silent = true, desc = 'Next buffer' })
map('n', 'Q', ':bprevious<CR>', { silent = true, desc = 'Previous buffer' })
map('n', '<Leader>x', ':bdelete<CR>', { desc = 'Close buffer' })

map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

map('n', '<M-S-j>', ':m-2|join<CR>', { silent = true, desc = 'Join Above' })

--
-- Terminal
--

map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

map('n', '<Leader>z', function()
	vim.cmd 'belowright.split'
	vim.cmd 'resize 8'
	vim.cmd 'terminal'
end, { silent = true, desc = 'Open Quick Terminal' })

local normal_signcolumn = vim.o.signcolumn
map('n', '<Leader>ts', function()
	vim.o.signcolumn = vim.o.signcolumn == normal_signcolumn and 'no' or normal_signcolumn
end, { desc = '[T]oggle [S]ign column' })

--
-- Editor/Editing
--

map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('n', '<Esc>', '<cmd>nohlsearch<CR>')
