-- Will enable all the configurations that are found in the `lsp/*` folder, only
-- start loading the files after a buffer is opened. In this case LSP settings
-- can still be changed from a `.nvim.lua` file.
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
	once = true,
	callback = function()
		for _, lsp in ipairs(vim.api.nvim_get_runtime_file("lsp/*.lua", true)) do
			vim.lsp.enable(vim.fn.fnamemodify(lsp, ":t:r"))
		end
	end,
})

-- Enable completion on attach
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(evt)
		vim.lsp.completion.enable(true, evt.data.client_id, evt.buf, { autotrigger = true })
	end,
})
