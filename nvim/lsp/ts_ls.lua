return {
    -- Should be installed with mason
    cmd = { "typescript-language-server" },
    filetypes = { "ts", "tsx", "js", "jsx" },
    root_markers = { ".git", "tsconfig.json", "jsconfig.json" },
}
