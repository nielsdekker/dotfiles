---@type vim.lsp.Config
return {
    cmd = { "gopls" },
    filetypes = { "js" },
    root_markers = { "go.mod", ".git" },
}
