--- @type vim.lsp.Config
return {
    cmd = { "pylsp" },
    filetypes = { "python" },
    root_markers = { ".git", "pyvenv.cfg" }
}
