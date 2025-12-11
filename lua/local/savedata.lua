-- [ Savedata is responsible for managing persistent data. This is useful in a
-- variety of circumstances. ] --

-- Path to the savedata file
local SVPATH = vim.fn.stdpath 'config' .. '/savedata.json'

local M = {}

local sv_json = ''
local sv_tbl = {}
local sv_json_valid = true

--- Set a value in the savedata
---
--- @param key string
--- @param value string
function M.set(key, value)
	sv_tbl[key] = value
	sv_json_valid = false
end

--- Get a value from the savedata
--- 
--- @param key string
--- @return any
function M.get(key)
	return sv_tbl[key]
end

--- Returns the human readable form of the savedata
---
--- @return string
function M.view()
	if not sv_json_valid then
		sv_json = vim.json.encode(sv_tbl)
	end

	sv_json_valid = true

	return sv_json
end

function M.load()
	local fi, err1 = io.open(SVPATH, 'r')
	assert((not err1) and (fi ~= nil), err1)

	local txt, err2 = fi:read '*all'
	assert((not err2) and (txt ~= nil), err2)

	fi:close()

	sv_json = txt
	sv_tbl = vim.json.decode(txt)
end

function M.commit()
	local fi, err1 = io.open(SVPATH, 'w+')
	assert((not err1) and (fi ~= nil), err1)

	local txt = M.view()
	local _, err2 = fi:write(txt)
	assert(not err2, err2)

	fi:flush()
	fi:close()
end

-- Initialize savedata
M.load()

return M
