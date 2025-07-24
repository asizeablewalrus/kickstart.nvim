local map = vim.keymap.set

local opts = {
  noremap = false,
  silent = true,
}
-- Tab related keys

map('n', 'E', ':+tabnext<CR>')
map('n', 'Q', ':-tabnext<CR>')
