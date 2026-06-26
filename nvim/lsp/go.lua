---@type vim.lsp.Config
return {
    cmd = { "toolbox", "run", "-c", "dev-tools", "gopls" },
    filetypes = { "go" },
    root_markers = { "go.mod", ".git" },
}
