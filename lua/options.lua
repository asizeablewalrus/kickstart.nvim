require 'environment'

-- [ EDITOR ] --

vim.o.mouse = 'a' -- Enable mouse mode, can be useful for resizing splits for example!

vim.schedule(function() --  See `:help 'clipboard'`
	vim.o.clipboard = 'unnamedplus'
end)

vim.o.breakindent = true -- Enable break indent
vim.o.undofile = true -- Save undo history

vim.o.ignorecase = true -- [[ Case-insensitive searching UNLESS \C or
vim.o.smartcase = true -- one or more capital letters in the search term ]]

-- [ CODE ] --

-- [ APPEARANCE ] --

vim.o.number = ENV.number -- Make line numbers default
vim.o.inccommand = 'split' -- Preview substitutions live, as you type!
vim.o.cursorline = true -- Show which line your cursor is on
vim.o.signcolumn = ENV.d_signcolumn -- Default to no
vim.o.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.
vim.o.showmode = false -- Should the mode be in the command line?

-- Tab Spacing
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.autoindent = true
vim.o.smartindent = true

-- [ META ] --

vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 300 -- Decrease mapped sequence wait time

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = true
