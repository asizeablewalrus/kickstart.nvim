-- [ Refactoring integrations ] --

local refactor = {}

-- Find match and add it to the quickfix list
---@param match string
---@param files string?
function refactor.find(match, files)
	vim.cmd(':grep ' .. match .. (files and (' ' .. files)))
end

-- Substitute items in the quickfix list
---@param match string
---@param sub string
---@param global boolean?
function refactor.substitute(match, sub, global)
	local act = ':cfdo ' .. 's/' .. match .. '/' .. sub .. '/' .. (global and 'g')
	vim.cmd(act .. ' | update | bd')
end

-- Executes find and substitute
---@param match string
---@param sub string
---@param files string?
---@param global boolean?
function refactor.find_replace(match, sub, files, global)
	refactor.find(match, files)
	refactor.substitute(match, sub, global)
end

return refactor
