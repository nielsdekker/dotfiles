local M = {
	_git_cache = "",
	_diagnostics_cache = "",
	_everhour_cache = "",
}

StatusLine = function()
	local items = {
		M.get_mode(),
		M._diagnostics_cache,
		M._git_cache,
		M.with_hl("%f%m%r", M.groups.default),
		"%=",
		M._everhour_cache,
	}

	local s_line = ""
	for _, v in ipairs(items) do
		if v ~= "" then
			s_line = s_line .. " " .. v
		end
	end

	return s_line
end

vim.o.statusline = "%{%v:lua.StatusLine()%}"

M._redraw = function()
	vim.schedule(function()
		vim.cmd("redrawstatus")
	end)
end

--- Creates a mode block to show whether or not we are in insert mode
M.get_mode = function()
	local modes = {
		["n"] = { text = "Normal", hl = M.groups.mode_normal },
		["v"] = { text = "Visual", hl = M.groups.mode_visual },
		["V"] = { text = "Visual", hl = M.groups.mode_visual },
		-- Matches ^V
		["\22"] = { text = "Visual", hl = M.groups.mode_visual },
		["s"] = { text = "Select", hl = M.groups.mode_select },
		["S"] = { text = "Select", hl = M.groups.mode_select },
		-- Matches ^S
		["\19"] = { text = "Select", hl = M.groups.mode_select },
		["i"] = { text = "Insert", hl = M.groups.mode_insert },
		["ic"] = { text = "Insert", hl = M.groups.mode_insert },
		["R"] = { text = "Replace", hl = M.groups.mode },
		["c"] = { text = "Command", hl = M.groups.mode },
		["r"] = { text = "Prompt", hl = M.groups.mode },
		["!"] = { text = "Shell", hl = M.groups.mode },
		["t"] = { text = "Terminal", hl = M.groups.mode },
	}

	local mode = string.sub(vim.api.nvim_get_mode().mode, 1, 2)
	local m = modes[mode]

	if m ~= nil then
		return M.with_border(m.text, m.hl)
	else
		return M.with_border(mode, M.groups.mode)
	end
end

--- Returns the git branch
M.update_branch_name = function()
	vim.system({ "git", "rev-parse", "--abbrev-ref", "HEAD" }, { text = true }, function(out)
		if out.stdout ~= "" then
			M._git_cache = M.with_hl(M.icons.git .. " " .. vim.trim(out.stdout), M.groups.git)
		else
			M._git_cache = ""
		end

		M._redraw()
	end)
end

--- Updates the everhour cache
---
--- @param timer any|nil
--- @return string
M.update_everhour = function(task)
	if task == nil or task.data == nil or task.data.task == nil then
		M._everhour_cache = ""
	else
		M._everhour_cache = M.with_border(M.icons.timer .. " " .. task.data.task.name, M.groups.info)
	end

	M._redraw()
end

--- Diagnostics from the LSP and other thingies that set diagnostics
M.get_diagnostics = function()
	local error_count = vim.tbl_count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }))
	local warning_count = vim.tbl_count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN }))

	if error_count ~= 0 and warning_count ~= 0 then
		return M.with_hl(M.icons.border_left, M.groups.diag_errors .. "Inverse")
			.. M.with_hl(M.icons.err .. " " .. error_count, M.groups.diag_errors)
			.. M.with_hl(M.icons.triangle, M.groups.diag_seperator)
			.. M.with_hl(M.icons.warn .. " " .. warning_count, M.groups.diag_warnings)
			.. M.with_hl(M.icons.border_right, M.groups.diag_warnings .. "Inverse")
	elseif error_count ~= 0 then
		return M.with_border(M.icons.err .. " " .. error_count, M.groups.diag_errors)
	elseif warning_count ~= 0 then
		return M.with_border(M.icons.warn .. " " .. warning_count, M.groups.diag_warnings)
	else
		return ""
	end
end

-- Renders the given string with the highlight
M.with_hl = function(s, hl)
	return "%#" .. hl .. "#" .. s
end

-- Renders the string and add borders to the left and right of it.
M.with_border = function(s, hl)
	return M.with_hl(M.icons.border_left, hl .. "Inverse")
		.. M.with_hl(s, hl)
		.. M.with_hl(M.icons.border_right, hl .. "Inverse")
end

M.icons = {
	git = "",
	err = "",
	warn = "",
	border_left = "",
	border_right = "",
	triangle = "",
	timer = "󱎫",
}

M.groups = {
	-- Small groups
	default = "StatusLine",
	git = "StatusLineGit",
	info = "StatusLineInfo",

	-- Mode switching
	mode = "StatusLineMode",
	mode_normal = "StatusLineModeNormal",
	mode_visual = "StatusLineModeVisual",
	mode_select = "StatusLineModeSelect",
	mode_insert = "StatusLineModeInsert",

	-- Diagnostics
	diag_errors = "StatusLineDiagnosticErrors",
	diag_warnings = "StatusLineDiagnosticWarnings",
	diag_seperator = "StatusLineDiagnosticSeparator",
}

-- Make sure the status line is updated when the diagnostics change
vim.api.nvim_create_autocmd("DiagnosticChanged", {
	callback = function()
		M._diagnostics_cache = M.get_diagnostics()
		M._redraw()
	end,
})

-- When we regain focus an actions outside neovim, like a branch switch, could
-- have occurred.
vim.api.nvim_create_autocmd({ "FocusGained" }, {
	callback = M.update_branch_name,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "NeogitBranchCheckout",
	callback = M.update_branch_name,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "EverhourTimerStarted",
	callback = M.update_everhour,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "EverhourTimerStopped",
	callback = M.update_everhour,
})
