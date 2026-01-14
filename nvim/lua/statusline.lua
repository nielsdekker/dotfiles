local S = {
	--- @type { is_done: boolean, progress: number }[]
	lsp = {},
}

StatusLine = function()
	return table.concat({
		S.get_mode(),
		S.get_diagnostics(),
		S.get_git_branch_name(),
		S.with_hl(" %f%m%r", S.groups.default),
		-- Moves to the end
		"%=",
		S.get_lsp_info(),
	})
end

vim.o.statusline = "%!v:lua.StatusLine()"

-- Make sure the status line is updated when the diagnostics change
vim.api.nvim_create_autocmd("DiagnosticChanged", {
	callback = function()
		S.redraw()
	end,
})

vim.api.nvim_create_autocmd("LspProgress", {
	callback = function(evt)
		print("hoi")
		local lspClient = evt.data.client_id
		local kind = evt.data.params.value.kind

		if kind == "report" then
			if S.lsp[lspClient] == nil then
				S.lsp[lspClient] = {
					is_done = false,
					progress = 0,
				}
			elseif S.lsp[lspClient].progress == evt.data.params.value.percentage then
				-- No new data so nothing to update
				return
			else
				S.lsp[lspClient] = {
					progress = evt.data.params.value.percentage,
				}
				S.redraw()
			end
		elseif kind == "end" then
			S.lsp[lspClient] = {
				is_done = true,
				progress = 100,
			}

			S.redraw()
		end
	end,
})

S.redraw = function()
	vim.api.nvim__redraw({ statusline = true })
end

--- Creates a mode block to show whether or not we are in insert mode
S.get_mode = function()
	local modes = {
		["n"] = { text = "Normal", hl = S.groups.mode_normal },
		["v"] = { text = "Visual", hl = S.groups.mode_visual },
		["V"] = { text = "Visual", hl = S.groups.mode_visual },
		-- Matches ^V
		["\22"] = { text = "Visual", hl = S.groups.mode_visual },
		["s"] = { text = "Select", hl = S.groups.mode_select },
		["S"] = { text = "Select", hl = S.groups.mode_select },
		-- Matches ^S
		["\19"] = { text = "Select", hl = S.groups.mode_select },
		["i"] = { text = "Insert", hl = S.groups.mode_insert },
		["R"] = { text = "Replace", hl = S.groups.mode },
		["c"] = { text = "Command", hl = S.groups.mode },
		["r"] = { text = "Prompt", hl = S.groups.mode },
		["!"] = { text = "Shell", hl = S.groups.mode },
		["t"] = { text = "Terminal", hl = S.groups.mode },
	}

	local mode = string.sub(vim.api.nvim_get_mode().mode, 1, 2)
	local m = modes[mode]

	if m ~= nil then
		return S.with_border(m.text, m.hl)
	else
		return S.with_border(mode, S.groups.mode)
	end
end

--- Returns the git branch
S.get_git_branch_name = function()
	local branch_name = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")

	if branch_name ~= "" then
		return S.with_hl(S.icons.git .. " " .. branch_name, S.groups.git)
	else
		return ""
	end
end

--- Diagnostics from the LSP and other thingies that set diagnostics
S.get_diagnostics = function()
	local error_count = vim.tbl_count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }))
	local warning_count = vim.tbl_count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN }))

	if error_count ~= 0 and warning_count ~= 0 then
		return " "
			.. S.with_hl(S.icons.border_left, S.groups.diag_errors .. "Inverse")
			.. S.with_hl(S.icons.err .. " " .. error_count, S.groups.diag_errors)
			.. S.with_hl(S.icons.triangle, S.groups.diag_seperator)
			.. S.with_hl(S.icons.warn .. " " .. warning_count, S.groups.diag_warnings)
			.. S.with_hl(S.icons.border_right, S.groups.diag_warnings .. "Inverse")
			.. " "
	elseif error_count ~= 0 then
		return S.with_border(S.icons.err .. " " .. error_count, S.groups.diag_errors)
	elseif warning_count ~= 0 then
		return S.with_border(S.icons.warn .. " " .. warning_count, S.groups.diag_warnings)
	else
		return ""
	end
end

S.get_lsp_info = function()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if next(clients) == nil then
		return ""
	end

	local all_clients = {}

	local buf_ft = vim.api.nvim_get_option_value("filetype", {})
	for _, client in ipairs(clients) do
		---@diagnostic disable-next-line: undefined-field
		local ft = client.config.filetypes
		local lsp = S.lsp[client.id]

		if lsp and ft and vim.fn.index(ft, buf_ft) ~= -1 then
			if lsp.is_done then
				table.insert(all_clients, client.name)
			else
				table.insert(all_clients, client.name .. " " .. lsp.progress .. "%%")
			end
		end
	end

	return S.with_hl(table.concat(all_clients, " "), S.groups.info)
end

S.get_cursor_info = function()
	return S.with_border("[l:%l c:%c]", S.groups.info)
end

-- Renders the given string with the highlight
S.with_hl = function(s, hl)
	return "%#" .. hl .. "#" .. s
end

-- Renders the string and add borders to the left and right of it.
S.with_border = function(s, hl)
	return " "
		.. S.with_hl(S.icons.border_left, hl .. "Inverse")
		.. S.with_hl(s, hl)
		.. S.with_hl(S.icons.border_right, hl .. "Inverse")
		.. " "
end

S.icons = {
	git = "",
	err = "",
	warn = "",
	border_left = "",
	border_right = "",
	triangle = "",
}

S.groups = {
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
