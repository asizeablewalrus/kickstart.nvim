local cmd = vim.api.nvim_create_user_command

local refactor = require 'myvim.refactor'
local savedata = require 'myvim.savedata'

cmd('Refactor', function(opts)
	local args = opts.fargs
	refactor.find_replace(args['f'], args['r'], args['files'] or nil)
end, { nargs = '+', desc = 'Find and replace a match with sub in files' })

cmd('Replace', function(opts)
	local args = opts.fargs
	refactor.substitute(args['f'], args['r'], args['global'])
end, { nargs = '+', desc = 'Replace items in the quick-fix list' })

cmd('ViewSavedata', function()
	print(savedata.view())
end, { nargs = 0 })

cmd('CMake', function(opts)
	if opts.nargs == 0 then
		local current_dir = vim.fn.getcwd()
		local source_dir
		local build_dir
		if current_dir:sub(-#'/build') == '/build' then
			source_dir = '..'
			build_dir = '.'
		else
			source_dir = '.'
			build_dir = 'build'
		end
		vim.cmd(('!cmake -S %s -B %s'):format(source_dir, build_dir))
	else
		vim.cmd('!cmake ' .. opts.args)
	end
end, { nargs = '+', desc = 'Run cmake in the current working directory. If no options are supplied, smart detect the build and source directory.' })
