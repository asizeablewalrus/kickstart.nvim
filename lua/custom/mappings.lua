local map = vim.keymap.set

local opts = {
  noremap = true,
  silent = true,
}

-- Tab related keys

map('n', '<Tab>', ':+tabnext')
map('n', '<S-Tab>', ':-tabnext')
