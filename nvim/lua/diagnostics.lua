vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,

	signs = {
		linehl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticErrorLine",
			[vim.diagnostic.severity.WARN] = "DiagnosticWarnLine",
			[vim.diagnostic.severity.HINT] = "DiagnosticHintLine",
			[vim.diagnostic.severity.INFO] = "DiagnosticHintLine",
		},
	},
})

vim.api.nvim_create_autocmd("CursorHold", {
	pattern = "*",
	callback = function()
		vim.diagnostic.open_float()
	end,
})
