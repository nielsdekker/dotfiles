---@type vim.lsp.Config
return {
    cmd = { "pod-dev-tools", "gopls" },
    filetypes = { "go" },
    root_markers = { "go.mod", ".git" },
}
