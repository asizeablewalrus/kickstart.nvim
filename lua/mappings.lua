local map = vim.keymap.set

--[ Create a mapping that toggles between default and other to the option when the key is pressed ]--
---@param key string
---@param option string
---@param default any
---@param other any
---@param description string
local function map_toggle(key, option, default, other, description)
	local OPT_INFO = {}
	map('n', '<Leader>t' .. key, function()
		local cur_value = vim.api.nvim_get_option_value(option, OPT_INFO)
		if cur_value == default then
			vim.api.nvim_set_option_value(option, other, OPT_INFO)
		else
			vim.api.nvim_set_option_value(option, default, OPT_INFO)
		end
	end, { desc = description })
end

--
-- Global
--

map('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true, desc = 'Open/close explorer' })

--
-- Buffer
--

map('n', 'Q', ':bprevious<CR>', { silent = true, desc = 'Previous buffer' })
map('n', 'E', ':bnext<CR>', { silent = true, desc = 'Next buffer' })
map('n', '<Leader>x', ':bdelete<CR>', { desc = 'Close buffer' })

map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [q]uickfix list' })

map('n', '<M-S-j>', ':m-2|join<CR>', { silent = true, desc = '[J]oin above' })

--
-- Terminal
--

map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
map('n', '<Leader>z', function()
	vim.cmd 'belowright.split'
	vim.cmd 'resize 8'
	vim.cmd 'terminal'
end, { silent = true, desc = 'Open quick terminal' })

--
-- Editor/Editing
--

-- Toggleables
map_toggle('s', 'signcolumn', 'no', 'auto:2', '[T]oggle [s]ign column')
map_toggle('n', 'number', true, false, '[T]oggle [n]umber column')

-- Useful window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Destroy search highlighting on <Esc>
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
