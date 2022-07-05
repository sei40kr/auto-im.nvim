local M = {}

local function remote_exec(args)
	if vim.fn.executable("fcitx5-remote") == 1 then
		return vim.fn.system(string.format("fcitx5-remote %s", args))
	end

	return nil
end

function M.activate()
	remote_exec("-o")
end

function M.inactivate()
	remote_exec("-c")
end

function M.setup()
	local group = vim.api.nvim_create_augroup("auto_im", {})
	vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave" }, {
		group = group,
		pattern = { "*" },
		callback = function()
			M.inactivate()
		end,
	})
end

return M
