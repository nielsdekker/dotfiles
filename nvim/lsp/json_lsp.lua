--- @type vim.lsp.Config
return {
    cmd = { "vscode-json-language-server", "--stdio" },
    single_file_support = true,
    filetypes = { "json" },
}
