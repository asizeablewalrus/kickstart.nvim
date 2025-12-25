local map = vim.keymap.set

---Create a mapping that toggles between value_a and value_b to the option when
---the key is pressed.
---
---@param key string
---@param option string
---
---@param value_a any
---@param value_b any
---
---@param opts? vim.keymap.set.Opts
local function map_toggle(key, option, value_a, value_b, opts)
	opts = opts or {}

	---@type vim.api.keyset.option
	local OPT_INFO = {}

	map('n', key, function()
		local cur_value = vim.api.nvim_get_option_value(option, OPT_INFO)
		if cur_value == value_a then
			vim.api.nvim_set_option_value(option, value_b, OPT_INFO)
		else
			vim.api.nvim_set_option_value(option, value_a, OPT_INFO)
		end
	end, opts)
end

--- [ Diagnostics ]

map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [q]uickfix list' })

--- [ Editing ]

map('n', '<M-S-j>', ':m-2|join<CR>', { silent = true, desc = '[J]oin above' })

--- [ Terminal ]

map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

map('n', '<Leader>zh', function()
	vim.cmd 'belowright.split'
	vim.cmd 'resize 8'
	vim.cmd 'terminal'
end, { silent = true, desc = 'Open horizontal terminal' })

map('n', '<Leader>zf', function()
	require('myvim.terminal').show_floating(0.6)
end, { desc = 'Open floating terminal' })

map('n', '<Leader>zm', function()
	require('myvim.terminal').show_message_box()
end, { desc = 'Open message box' })

--- [ View Commands ]

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true, desc = 'Open/close explorer' })

-- Buffer navigation
map('n', 'Q', ':bprevious<CR>', { silent = true, desc = 'Previous buffer' })
map('n', 'E', ':bnext<CR>', { silent = true, desc = 'Next buffer' })
map('n', '<Leader>x', ':bdelete<CR>', { desc = 'Close buffer' })

-- Useful window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Toggleables
map_toggle('<Leader>ts', 'signcolumn', 'no', 'auto:2', { desc = '[T]oggle [s]ign column' })
map_toggle('<Leader>tn', 'number', true, false, { desc = '[T]oggle [n]umber column' })

-- Destroy search highlighting on <Esc>
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
