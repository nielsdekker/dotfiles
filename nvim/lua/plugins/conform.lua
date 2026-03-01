vim.pack.add({
    { src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
    format_on_save = {
        timeout_ms = 3000,
        lsp_format = "fallback",
    },
    formatters_by_ft = {
        json = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        go = { "gofmt" },
        kotlin = { "ktfmt" },
        helm = { "prettier" },
        lua = { "stylua" },
    },
    formatters = {
        ktfmt = {
            inherit = true,
            prepend_args = { "--kotlinlang-style" },
        },
    },
})
