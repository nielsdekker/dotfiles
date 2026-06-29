--- @type vim.lsp.Config
return {
    cmd = { "pod-dev-tools", "pylsp" },
    filetypes = { "python" },
    root_markers = { ".git", "pyvenv.cfg" }
}
