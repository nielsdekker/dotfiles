--- @type MiniDep
return {
    source = "stevearc/conform.nvim",
    later = function()
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
                templ = { "templ" },
                go = { "gofmt" },
                kotlin = { "ktfmt" },
                java = { "google-java-format" },
                sql = { "sql_formatter" },
                helm = { "prettier" },
            },
            formatters = {
                ktfmt = {
                    inherit = true,
                    prepend_args = { "--kotlinlang-style" },
                }
            }
        })
    end
}
