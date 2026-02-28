---@type vim.lsp.Config
return {
	-- Should be installed with mason
	cmd = { "tsgo", "--lsp", "--stdio" },
	filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	root_markers = { ".git" }, -- , "tsconfig.json", "jsconfig.json" },
}
