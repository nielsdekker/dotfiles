--- @type vim.lsp.Config
return {
    cmd = { "toolbox", "run", "-c", "dev-tools", "pylsp" },
    filetypes = { "python" },
    root_markers = { ".git", "pyvenv.cfg" }
}
