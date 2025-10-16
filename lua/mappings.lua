require 'environment'

local map = vim.keymap.set

---@param key string
---@param option string
---@param description string
local function map_toggle(key, option, normal, other, description)
	map('n', '<Leader>t' .. key, function()
		vim.opt[option] = vim.opt[option] == normal and other or normal
	end, { desc = description })
end

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

--
-- Editor/Editing
--

map_toggle('s', 'signcolumn', 'no', ENV.signcolumn, '[T]oggle [S]ign column')
map_toggle('L', 'number', vim.opt.number, not vim.opt.number, '[T]oggle [L]ine column')

map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('n', '<Esc>', '<cmd>nohlsearch<CR>')
