---@type vim.lsp.Config
return {
    cmd = { "toolbox", "run", "-c", "dev-tools", "tsgo", "--lsp", "--stdio" },
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    root_markers = { ".git" }, -- , "tsconfig.json", "jsconfig.json" },
}
