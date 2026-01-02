---@type vim.lsp.Config
return {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml" },
	root_markers = { ".git" },
	settings = {
		yaml = {
			disableDefaultProperties = true,
			keyOrdering = false,
			schemas = {
				kubernetes = { "**/k8s/**/templates/*.yaml" },
			},
		},
	},
}
