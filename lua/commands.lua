local cmd = vim.api.nvim_create_user_command

local refactor = require 'local.refactor'
local savedata = require 'local.savedata'

cmd('Refactor', function(opts)
	local args = opts.args
	refactor.find_replace(args['f'], args['r'], args['files'] or nil)
end, { nargs = '+', desc = 'Find and replace a match with sub in files' })

cmd('Replace', function(opts)
	local args = opts.args
	refactor.substitute(args['f'], args['r'], args['global'])
end, { nargs = '+', desc = 'Replace items in the quick-fix list' })

cmd('ViewSavedata', function()
	print(savedata.view())
end, { nargs = 0 })
