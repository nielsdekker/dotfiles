vim.pack.add({
    { src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
    format_on_save = {
        timeout_ms = 3000,
        lsp_format = "fallback",
    },
    formatters_by_ft = {
        json = { "podPrettier" },
        javascript = { "podPrettier" },
        typescript = { "podPrettier" },
        javascriptreact = { "podPrettier" },
        typescriptreact = { "podPrettier" },
        html = { "podPrettier" },
        yaml = { "podPrettier" },
        markdown = { "podPrettier" },
        go = { "podGofmt" },
    },
    formatters = {
        podPrettier = {
            command = "pod-dev-tools",
            args = { "prettier", "--stdin-filepath", "$FILENAME" }
        },
        podGofmt = {
            command = "pod-dev-tools",
            args = { "gofmt" }
        }
    }
})
