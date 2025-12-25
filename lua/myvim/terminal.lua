-- [Terminal related utilities that ease development.]
local M = {}

--- Show a floating terminal.
---@param size number The ratio, from 0-1, of the window size.
function M.show_floating(size)
	if size > 1 or size <= 0 then
		print "Parameter {size} for 'local.terminal.show_floating(size)' must be a fraction."
		return
	end

	local buf = vim.api.nvim_create_buf(false, false)
	if buf == 0 then
		print 'Failed to open floating terminal'
		return
	end
	local cur_height = vim.o.lines
	local cur_width = vim.o.columns

	local win_height = math.floor(size * cur_height)
	local win_width = math.floor(size * cur_width)

	vim.api.nvim_open_win(buf, true, {
		relative = 'editor',
		style = 'minimal',
		title = 'terminal',
		height = win_height,
		width = win_width,
		row = (cur_height - win_height) / 2,
		col = (cur_width - win_width) / 2,
	})

	vim.cmd 'terminal'
end

--- Create a message box for sending to the terminal.
function M.show_message_box()
	local buf = vim.api.nvim_create_buf(false, true)

	-- Flush terminal command on enter
	DialogueBoxRow = 0
	vim.api.nvim_buf_set_keymap(buf, 'i', '<CR>', '', {
		desc = 'Push command to terminal',
		callback = function()
			local lines = vim.api.nvim_buf_get_lines(buf, DialogueBoxRow, DialogueBoxRow, false)
			DialogueBoxRow = DialogueBoxRow + 1

			local buf_text = ''
			for _, value in ipairs(lines) do
				buf_text = buf_text .. value
			end

			vim.fn.jobstart(buf_text, {})
		end,
	})

	-- Close the message box when insert mode ends
	vim.api.nvim_create_autocmd('InsertLeave', {
		buffer = buf,
		callback = function()
			vim.api.nvim_buf_delete(buf, {})
		end,
	})

	local box_width = 50
	local box_height = 15

	vim.api.nvim_open_win(buf, true, {
		relative = 'editor',
		style = 'minimal',
		width = box_width,
		height = box_height,
		col = (vim.o.columns - box_width) / 2,
		row = (vim.o.lines - box_height) / 2,
	})
end

return M
