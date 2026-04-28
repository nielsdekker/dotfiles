---@type vim.lsp.Config
return {
	name = "kotlin-lsp",
	cmd = { "intellij-server", "--stdio" },
	single_file_support = false,
	filetypes = { "kotlin" },
	root_markers = { ".git" },
}
