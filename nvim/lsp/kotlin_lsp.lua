---@type vim.lsp.Config
return {
	name = "kotlin-lsp",
	cmd = { "/opt/kotlin-lsp/kotlin-lsp.sh", "--stdio" },
	single_file_support = false,
	filetypes = { "kotlin" },
	root_markers = { ".git" },
	cmd_env = {
		JAVA_OPTS = "-Xms1024m -Xmx8192m",
	},
}
